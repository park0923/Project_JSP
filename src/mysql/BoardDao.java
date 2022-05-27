package mysql;

import beans.BoardDto;
import beans.UserDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

public class BoardDao {
    public static int NOTICE_EXISTENT = 1;
    public static int NOTICE_NONEXISTENT = 2;
    public static int NOTICE_WRITE_SUCCESS = 3;
    public static int NOTICE_DELETE_SUCCESS = 4;
    public static int NOTICE_LOGIN_FAIL = 5;
    public static int NOTICE_UPDATE_SUCCESS = 6;
    public static int NOTICE_UPDATE_FAIL = 7;
    public static int ANSWER_UPDATE_SUCCESS = 8;
    public static int ANSWER_UPDATE_FAIL = 9;
    private static BoardDao instance = new BoardDao();
    public static BoardDao getInstance() { return instance; }

    private BoardDao(){
    }

    public int getNoticeId(){
        int id = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "SELECT max(board_index) from board";
        try{
            conn = DatabaseUtil.getConnection();
            if(conn == null )return id;
            pstmt=conn.prepareStatement(query);
            ResultSet resultSet = pstmt.executeQuery();
            if(resultSet.next()){
                id=resultSet.getInt("max(board_index)")+1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return id;
    }

    public int insertBoard(String title, String inquiry, String id, String classification){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "INSERT INTO board VALUES (?,?,?,?,?,?,?)";
        try{
            conn = DatabaseUtil.getConnection();
            LocalDateTime now = LocalDateTime.now();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, getNoticeId());
            pstmt.setString(2, title);
            pstmt.setString(3, inquiry);
            pstmt.setString(4, id);
            pstmt.setString(5, classification);
            pstmt.setString(6, null);
            pstmt.setString(7, now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
            pstmt.executeUpdate();
            rt = NOTICE_WRITE_SUCCESS;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try{
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();;
            }catch (Exception e){
                e.printStackTrace();;
            }
        }
        return rt;
    }

    public ResultSet getBoard(){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String query = "SELECT * FROM board";

        try{
            conn = DatabaseUtil.getConnection();

            if(conn == null) return rs;
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    public ArrayList getBoardInquiry(String studentID){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<BoardDto> boardDto = new ArrayList<>();
        String query = "SELECT * FROM board WHERE board_studentID = ?";

        try{
            conn = DatabaseUtil.getConnection();

            if (conn == null) return boardDto;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1,studentID);
            rs = pstmt.executeQuery();
            while (rs.next()){
                boardDto.add(new BoardDto(rs.getInt("board_index"),
                        rs.getString("board_title"),
                        rs.getString("board_inquiry"),
                        rs.getString("board_studentID"),
                        rs.getString("board_classification"),
                        rs.getString("board_answer"),
                        rs.getDate("create_date")
                    ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return boardDto;
    }

    public ArrayList getBoardNotice(String clasification){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<BoardDto> boardDto = new ArrayList<>();
        String query = "SELECT * FROM board WHERE board_classification = ?";

        try{
            conn = DatabaseUtil.getConnection();

            if (conn == null) return boardDto;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1,clasification);
            rs = pstmt.executeQuery();
            while (rs.next()){
                boardDto.add(new BoardDto(rs.getInt("board_index"),
                        rs.getString("board_title"),
                        rs.getString("board_inquiry"),
                        rs.getString("board_studentID"),
                        rs.getString("board_classification"),
                        rs.getString("board_answer"),
                        rs.getDate("create_date")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return boardDto;
    }

    public BoardDto getBoardId(String id){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDto boardDto = null;
        String query = "SELECT * FROM board WHERE board_index = ?";

        try{
            conn = DatabaseUtil.getConnection();

            if (conn == null) return boardDto;
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1,Integer.parseInt(id));
            rs = pstmt.executeQuery();
            if(rs.next()){
                boardDto = new BoardDto(rs.getInt("board_index"),
                rs.getString("board_title"),
                rs.getString("board_inquiry"),
                rs.getString("board_studentID"),
                rs.getString("board_classification"),
                rs.getString("board_answer"),
                rs.getDate("create_date"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return boardDto;
    }

    public int deleteBoard(String id){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "DELETE FROM board WHERE board_index = ?";

        try{
            conn = DatabaseUtil.getConnection();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1,Integer.parseInt(id));
            pstmt.executeUpdate();
            rt = NOTICE_DELETE_SUCCESS;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return rt;
    }

    public int updateinquiry(String board_index, String body){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String query = "UPDATE board SET board_inquiry=? WHERE board_index = ?";

        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, body);
            pstmt.setInt(2, Integer.parseInt(board_index));
            pstmt.executeUpdate();
            rt = NOTICE_UPDATE_SUCCESS;
        } catch (SQLException e) {
            rt = NOTICE_UPDATE_FAIL;
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return rt;
    }

    public int updateanswer(String board_index, String answer){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String query = "UPDATE board SET board_answer=? WHERE board_index = ?";

        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, answer);
            pstmt.setInt(2, Integer.parseInt(board_index));
            pstmt.executeUpdate();
            rt = ANSWER_UPDATE_SUCCESS;
        } catch (SQLException e) {
            rt = ANSWER_UPDATE_FAIL;
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return rt;
    }
}
