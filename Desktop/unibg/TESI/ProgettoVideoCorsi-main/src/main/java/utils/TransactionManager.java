package utils;

import java.sql.Connection;
import java.sql.SQLException;

public class TransactionManager {
    public static void beginTransaction(Connection connection) throws SQLException {
        connection.setAutoCommit(false);
    }

    public static void commitTransaction(Connection connection) throws SQLException {
        connection.commit();
        connection.setAutoCommit(true);
    }

    public static void rollbackTransaction(Connection connection) {
        try {
            if (connection != null) {
                connection.rollback();
                connection.setAutoCommit(true);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
} 