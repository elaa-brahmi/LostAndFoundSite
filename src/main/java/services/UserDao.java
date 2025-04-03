package services;
import java.sql.*;

import model.Role;
import model.User;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Logger;
public class UserDao{
    private static final Logger logger =Logger.getLogger(UserDao.class.getName());
    public UserDao() {
    }
    public static Integer SaveUser(User user) throws SQLException{
        String query = "INSERT INTO users(name, email, password, role, phone) VALUES(?, ?, ?, ?, ?)";
        try (Connection connection = BDConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
    
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            String hashed = PasswordUtil.hashPassword(user.getPassword());
            ps.setString(3, hashed);
            ps.setString(4, String.valueOf(Role.USER));
            ps.setString(5, user.getPhone());
    
            int rows = ps.executeUpdate();
            if (rows > 0) {
                System.out.println("User Saved");
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        System.out.println("The generated key is " + rs.getInt(1));
                        return rs.getInt(1); // Retrieve the generated ID
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
       
    }
    public static Optional<User> authenticate(String email, String password) throws SQLException{
        //todo:return an object of the authenticated user
        String query = "SELECT * FROM users WHERE email = ?";
    try (Connection connection = BDConnection.getConnection();
         PreparedStatement ps = connection.prepareStatement(query)) {

        ps.setString(1, email);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                String hashedPassword = rs.getString("password");
                if (PasswordUtil.checkPassword(password, hashedPassword)) {
                    System.out.println("User found");
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    user.setName(rs.getString("name"));
                    user.setPhone(rs.getString("phone"));
                    user.setRole(Role.valueOf(rs.getString("role")));
                    return Optional.of(user);
                }
            } else {
                System.out.println("User not found");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return Optional.empty();
    }
    public boolean registerUser(User user) throws SQLException{
        String queryPhone = "SELECT * FROM users WHERE phone = ?";
        String queryEmail = "SELECT * FROM users WHERE email = ?";
        try (Connection connection = BDConnection.getConnection();
             PreparedStatement psPhone = connection.prepareStatement(queryPhone);
             PreparedStatement psEmail = connection.prepareStatement(queryEmail)) {
    
            psPhone.setString(1, user.getPhone());
            try (ResultSet rsPhone = psPhone.executeQuery()) {
                if (rsPhone.next()) {
                    System.out.println("User already exists with this phone");
                    return false;
                }
            }
    
            psEmail.setString(1, user.getEmail());
            try (ResultSet rsEmail = psEmail.executeQuery()) {
                if (rsEmail.next()) {
                    System.out.println("User already exists with this email");
                    return false;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }
    public static User getUser(int id) throws SQLException{
        String query = "SELECT * FROM users WHERE id = ?";
        try (Connection connection = BDConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
    
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    user.setName(rs.getString("name"));
                    user.setPhone(rs.getString("phone"));
                    user.setRole(Role.valueOf(rs.getString("role")));
                    user.setPicture(rs.getString("pictures"));
                    return user;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void updateUser(User user) throws SQLException{
        String query = "UPDATE users SET name = ?, email = ?, phone = ? WHERE id = ?";
    try (Connection connection = BDConnection.getConnection();
         PreparedStatement ps = connection.prepareStatement(query)) {

        ps.setString(1, user.getName());
        ps.setString(2, user.getEmail());
        ps.setString(3, user.getPhone());
        ps.setInt(4, user.getId());

        int rows = ps.executeUpdate();
        if (rows > 0) {
            System.out.println("User Updated");
        } else {
            System.out.println("User Not Updated");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    }
    public static void deleteUser(int id) throws SQLException{
        String query = "DELETE FROM users WHERE id = ?";
        try (Connection connection = BDConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
    
            ps.setInt(1, id);
            int rows=ps.executeUpdate();
            if (rows > 0) {
                System.out.println("User Deleted");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void uploadPicture(String imageURL,Integer id) throws SQLException{
        String query = "UPDATE users SET pictures = ? WHERE id = ?";
        try (Connection connection = BDConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
    
            ps.setString(1, imageURL);
            ps.setInt(2, id);
    
            int rows = ps.executeUpdate();
            if (rows > 0) {
                System.out.println("User Picture Updated");
            } else {
                System.out.println("User Picture Not Updated");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static Integer getNumberOfUsers() throws SQLException{
        String query = "SELECT COUNT(*) FROM users";
    try (Connection connection = BDConnection.getConnection();
         PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {

        if (rs.next()) {
            return rs.getInt(1);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return 0;
    }
    public static List<User> getUsers() throws SQLException{
        String query = "SELECT * FROM users WHERE role = 'USER'";
        List<User> users = new ArrayList<>();
        try (Connection connection = BDConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
    
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setName(rs.getString("name"));
                user.setPhone(rs.getString("phone"));
                user.setRole(Role.valueOf(rs.getString("role")));
                user.setPicture(rs.getString("pictures"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }









}
