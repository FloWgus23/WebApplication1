package controller;

import java.sql.*;  // Using 'Connection', 'PreparedStatement', and 'ResultSet' classes in java.sql package
import model.Person;

public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/con?zeroDateTimeBehavior=CONVERT_TO_NULL";
    private static final String USER = "root";
    private static final String PASSWORD = " "; // Update with your actual password

    // Method to insert a new person into the database
    public boolean insertNewPerson(Person person) {
    boolean result = false;
    Connection connection = null;
    PreparedStatement pstmt = null;

    try {
        // โหลด MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        // เชื่อมต่อกับฐานข้อมูล
        connection = DriverManager.getConnection(URL, USER, PASSWORD);

        // สร้างคำสั่ง SQL สำหรับการแทรกข้อมูล
        String sql = "INSERT INTO tickets (ticketname, tickettype, singers, quantity, price) VALUES (?, ?, ?, ?, ?)";
        pstmt = connection.prepareStatement(sql);
        pstmt.setString(1, person.getTicketName());
        pstmt.setString(2, person.getTicketType());
        pstmt.setString(3, String.join(",", person.getSingers()));
        pstmt.setString(4, person.getQuantity());
        pstmt.setString(5, person.getPrice());

        // ดำเนินการแทรกข้อมูล
        int rowsAffected = pstmt.executeUpdate();
        result = rowsAffected > 0;

        if (!result) {
            System.out.println("การแทรกข้อมูลล้มเหลว: ไม่มีแถวใดได้รับผลกระทบ.");
        } else {
            System.out.println("แทรกข้อมูลสำเร็จ: " + rowsAffected + " แถว");
        }
    } catch (ClassNotFoundException e) {
        System.out.println("ไม่พบ JDBC Driver: " + e.getMessage());
    } catch (SQLException e) {
        System.out.println("ข้อผิดพลาด SQL: " + e.getMessage());
    } finally {
        // ปิดทรัพยากร
        try {
            if (pstmt != null) pstmt.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            System.out.println("ไม่สามารถปิดทรัพยากรได้: " + e.getMessage());
        }
    }

    return result;
}


    // Method to retrieve and print ticket names from the database
    public void testRetrieve() {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Get database connection
            connection = DriverManager.getConnection(URL, USER, PASSWORD);

            // Create statement
            statement = connection.createStatement();
            // Execute query
            resultSet = statement.executeQuery("SELECT ticketname FROM tickets"); // Ensure table name is correct

            // Process result set
            while (resultSet.next()) {
                String ticketName = resultSet.getString("ticketname").trim();
                System.out.println("Ticket Name: " + ticketName);
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Log the exception
            
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                // Log the exception
                
            }
        }
    }
}
