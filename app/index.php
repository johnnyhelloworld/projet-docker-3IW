<?php
// // Set up database credentials
// $host = '172.28.0.2';
// $dbname = 'database';
// $username = 'user';
// $password = 'password';
// $connect_timeout=999;
require "conf.inc.php";

// Create PDO instance and set error mode
try {
    $pdo = new \PDO(DB_DRIVER.":host=".DB_HOST.";dbname=".DB_NAME.";port=".DB_PORT, DB_USER, DB_PWD);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

// Retrieve data from database
if (isset($pdo)) {
    try {
        $query = "SELECT * FROM todos";
        $stmt = $pdo->query($query);
        $todos = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Display the data
        echo "<ul>";
        foreach ($todos as $todo) {
            echo "<li>{$todo['id']} - {$todo['title']} - {$todo['done']}</li>";
        }
        echo "</ul>";
    } catch (PDOException $e) {
        echo "Database query failed: " . $e->getMessage();
    }
}
