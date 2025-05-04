package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertNotNull;

public class ConnectionTest {

    @Test
    public void testConnection() throws SQLException {
        String url = "jdbc:postgresql://dpg-d08cdi15pdvs739m3fi0-a.frankfurt-postgres.render.com:5432/videocorsi";
        String user = "videocorsi_user";
        String password = "oX2qyf4O6sgkGQcN0icwSBiMSWsOnEbq";

        Connection connection = DriverManager.getConnection(url, user, password);
        assertNotNull(connection, "La connessione non dovrebbe essere null");
        connection.close();
    }
} 