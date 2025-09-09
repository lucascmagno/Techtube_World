<?php
class Database {
    private static $instance = null;

    private function __construct() {}
    private function __clone() {}

    public static function getConnection() {
        if (!isset(self::$instance)) {
            try {
                self::$instance = new PDO(
                    "mysql:host=localhost:3306;dbname=techtube;charset=utf8",
                    "root",   // usuário do banco
                    "12345",       // senha do banco
                    [
                        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                        PDO::ATTR_PERSISTENT => true // mantém a conexão ativa
                    ]
                );
            } catch (PDOException $e) {
                die("Erro na conexão com o banco de dados: " . $e->getMessage());
            }
        }
        return self::$instance;
    }
}
