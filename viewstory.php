<?php
require("config.php");
require("functions.php");
if(pf_check_number($_GET['id']) == TRUE) {
    $validid = $_GET['id'];
}
else {
    header("Location: " . $config_basedir);
}
require("header.php");
$sql = "SELECT * FROM stories WHERE id = " . $validid . ";";
$result = mysql_query($sql);
$row = mysql_fetch_assoc($result);
echo "<h1>" . $row['subject'] . "</h1>";
echo date("D jS F Y g.iA", strtotime($row['dateposted'])) . "<br />";
echo nl2br($row['body']);
$avgsql = "SELECT COUNT(id) AS number, AVG(rating) AS avg FROM ratings
WHERE story_id = " . $validid . ";";
$avgresult = mysql_query($avgsql);
$avgrow = mysql_fetch_assoc($avgresult);
echo "<p>";
echo "<strong>Rating</strong> ";
if($avgrow['number'] == 0) {
    echo "No ratings!";
}
else {
    $a = (round($avgrow['avg'] * 2) / 2) . "<br>";
    $a *= 10;
    if($a%5 == 0 && $a%10 != ) {
        $range = ($a / 10) - 0.5;
    }
else {
    $range = $a / 10;
}
    for($i=1;$i<=$range;$i++) {
        echo "<img src='" . $config_basedir
                . "siteimages/rating_full.png'>";
    }
    if($a%5 == 0 && $a%10 != ) {
        echo "<img src='" . $config_basedir
                . "siteimages/rating_half.png'>";
    }
    $a = $a / 10;
    $remain = 10 - $a;
    for($r=1;$r<=$remain;$r++) {
        echo "<img src='" . $config_basedir
                . "siteimages/rating_off.png'>";
    }
}
echo "<br />";
echo "<strong>Rate this story</strong>: ";
if($_SESSION['SESS_USERNAME']) {
    for($i=1;$i<=10;$i++) {
        echo "<a href='ratestory.php?id=" . $validid . "&amp;rating="
                . $i . "'>" . $i . "</a> ";
    }
}
else {
    echo "To vote, please <a href='userlogin.php'>log in</a>.";
}
echo "</p>";
require("footer.php");
?>