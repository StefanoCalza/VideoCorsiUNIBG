package utils;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Logger {
    private static final String LOG_FILE = "application.log";
    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public static void logError(String message, Exception e) {
        try (PrintWriter writer = new PrintWriter(new FileWriter(LOG_FILE, true))) {
            String timestamp = dateFormat.format(new Date());
            writer.println("[" + timestamp + "] ERROR: " + message);
            if (e != null) {
                writer.println("Exception: " + e.getMessage());
                e.printStackTrace(writer);
            }
        } catch (IOException ex) {
            System.err.println("Failed to write to log file: " + ex.getMessage());
        }
    }

    public static void logInfo(String message) {
        try (PrintWriter writer = new PrintWriter(new FileWriter(LOG_FILE, true))) {
            String timestamp = dateFormat.format(new Date());
            writer.println("[" + timestamp + "] INFO: " + message);
        } catch (IOException e) {
            System.err.println("Failed to write to log file: " + e.getMessage());
        }
    }
} 