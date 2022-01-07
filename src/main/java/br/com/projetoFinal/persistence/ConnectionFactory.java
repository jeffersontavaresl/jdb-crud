package br.com.projetoFinal.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

    public static Connection conectar(){
        Connection con = null;
        String url = "jdbc:postgresql://projetofinal.ckbaie7bmh03.sa-east-1.rds.amazonaws.com:5432/projetofinal";
        String user = "postgres";
        String password = "projetofinal";
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Erro ao conectar com o banco");
        }
        return con;                
    }
}



