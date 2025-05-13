package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import dao.UserDAO;
import immutablebeans.ImmutableUser;
import utils.ConnectionHandler;

@WebServlet("/UploadProfileImage")
@MultipartConfig
public class UploadProfileImage extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Connection connection = null;

    public void init() throws ServletException {
        connection = ConnectionHandler.getConnection(getServletContext());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        ImmutableUser user = (ImmutableUser) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        Part filePart = request.getPart("profileImage");
        if (filePart == null || filePart.getSize() == 0) {
            response.sendRedirect(request.getHeader("referer"));
            return;
        }

        // Validazione base: solo immagini e max 2MB
        String contentType = filePart.getContentType();
        if (!contentType.startsWith("image/")) {
            response.sendRedirect(request.getHeader("referer") + "?error=Formato+non+valido");
            return;
        }
        if (filePart.getSize() > 2 * 1024 * 1024) {
            response.sendRedirect(request.getHeader("referer") + "?error=Immagine+troppo+grande");
            return;
        }

        // Salva il file
        String uploadPath = getServletContext().getRealPath("/uploads/profile_images");
        Files.createDirectories(Paths.get(uploadPath));
        String ext = contentType.substring(contentType.lastIndexOf("/") + 1);
        String fileName = "user_" + user.getId() + "_" + UUID.randomUUID() + "." + ext;
        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        // Percorso relativo per il DB
        String dbPath = "/uploads/profile_images/" + fileName;

        // Aggiorna il DB
        try {
            UserDAO userDao = new UserDAO(connection);
            userDao.updateProfileImage(user.getId(), dbPath);
            // Ricarica l'utente aggiornato dal DB e aggiorna la sessione
            ImmutableUser updatedUser = userDao.getUserById(user.getId());
            session.setAttribute("user", updatedUser);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Aggiorna la sessione (opzionale, se vuoi mostrare subito la nuova immagine)
        // ...

        response.sendRedirect(request.getHeader("referer"));
    }

    public void destroy() {
        try {
            ConnectionHandler.closeConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
} 