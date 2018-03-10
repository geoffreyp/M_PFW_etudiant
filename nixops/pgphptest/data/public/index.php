<!DOCTYPE html>
<html>
  <body>
    <h1>index.php</h1>

    <?php
      $host        = "host = localhost";
      $port        = "port = 5432";
      $dbname      = "dbname = music_db";
      $credentials = "user = music_user password=toto";
      $dbconn      = pg_connect("$host $port $dbname $credentials");

      $query  = "SELECT artists.name, titles.name FROM titles "
              . "INNER JOIN artists ON titles.artist=artists.id";
      $result = pg_query($dbconn, $query);
      echo "<ul>\n";
      while($row = pg_fetch_row($result)) {
        echo "\t\t<li>" . $row[0] . " - " . $row[1] . "</li>\n";
      }
      echo "\t</ul>\n";
      pg_free_result($result);
      pg_close($dbconn);
    ?>

    <p><a href="index.html">index.html</a></p>

  </body>
</html>

