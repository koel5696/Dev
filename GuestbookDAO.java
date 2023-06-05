package ch11;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GuestbookDAO {
    private final String JDBC_DRIVER = "org.h2.Driver";
    private final String JDBC_URL = "jdbc:h2:tcp://localhost/~/jwbookdb";

    public Connection open() {
        Connection conn = null;
        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(JDBC_URL, "jwbook", "1234");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public void addGuestbookEntry(GuestbookEntry entry) {
        try (Connection connection = open();
             PreparedStatement statement = connection.prepareStatement("INSERT INTO guestbook (date, title, author, email, content) VALUES (?, ?, ?, ?, ?)")) {
            statement.setDate(1, new java.sql.Date(entry.getDate().getTime()));
            statement.setString(2, entry.getTitle());
            statement.setString(3, entry.getAuthor());
            statement.setString(4, entry.getEmail());
            statement.setString(5, entry.getContent());

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("방명록 데이터가 성공적으로 입력되었습니다.");
            } else {
                System.out.println("방명록 데이터 입력에 실패하였습니다.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateGuestbookEntry(GuestbookEntry entry) {
        try (Connection connection = open();
             PreparedStatement statement = connection.prepareStatement("UPDATE guestbook SET date = ?, title = ?, author = ?, email = ?, content = ? WHERE id = ?")) {
            statement.setDate(1, new java.sql.Date(entry.getDate().getTime()));
            statement.setString(2, entry.getTitle());
            statement.setString(3, entry.getAuthor());
            statement.setString(4, entry.getEmail());
            statement.setString(5, entry.getContent());
            statement.setInt(6, entry.getId());

            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("방명록 데이터가 성공적으로 수정되었습니다.");
            } else {
                System.out.println("방명록 데이터 수정에 실패하였습니다.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteGuestbookEntry(int entryId) {
        try (Connection connection = open();
             PreparedStatement statement = connection.prepareStatement("DELETE FROM guestbook WHERE id = ?")) {
            statement.setInt(1, entryId);

            int rowsDeleted = statement.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("방명록 데이터가 성공적으로 삭제되었습니다.");
            } else {
                System.out.println("방명록 데이터 삭제에 실패하였습니다.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<GuestbookEntry> getAllGuestbookEntries() {
        List<GuestbookEntry> guestbookEntries = new ArrayList<>();

        try (Connection connection = open();
             PreparedStatement statement = connection.prepareStatement("SELECT id, date, title, author, email, content FROM guestbook");
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                GuestbookEntry entry = new GuestbookEntry();
                entry.setId(resultSet.getInt("id"));
                entry.setDate(resultSet.getDate("date"));
                entry.setTitle(resultSet.getString("title"));
                entry.setAuthor(resultSet.getString("author"));
                entry.setEmail(resultSet.getString("email"));
                entry.setContent(resultSet.getString("content"));
                guestbookEntries.add(entry);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return guestbookEntries;
    }
}
