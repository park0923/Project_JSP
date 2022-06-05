package mysql;

import beans.BoardDto;
import beans.ReservationDto;
import beans.UserDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
            pstmt.setString(2, id);
            pstmt.setString(3, inquiry);
            pstmt.setString(4, classification);
            pstmt.setString(5, title);
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

    public int updateinquiry(String board_index, String body, String date){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String query = "UPDATE board SET board_inquiry=?, create_date=?  WHERE board_index = ?";

        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, body);
            pstmt.setString(2, date);
            pstmt.setInt(3, Integer.parseInt(board_index));
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

    public int getCount(){
        int count = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT count(*) FROM board";
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if(rs.next()){
                count = rs.getInt(1);
            }
        } catch (Exception e) {
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
        return count; // 총 레코드 수 리턴
    }

    public int getIdCount(String id){
        int count = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT count(*) FROM board WHERE board_studentID=? OR board_classification ='notice'";
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()){
                count = rs.getInt(1);
            }
        } catch (Exception e) {
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
        return count; // 총 레코드 수 리턴
    }

    public List<BoardDto> getInquiry(int startRow, int endRow, String id){
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "";
        ResultSet rs = null;
        ArrayList<BoardDto> list = new ArrayList<>();
        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return null;
            if(id.equals("")){
                query = "SELECT * FROM board ORDER BY board_classification DESC, create_date DESC LIMIT ?, ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, startRow);
                pstmt.setInt(2, endRow);
            }else {
                query = "SELECT * FROM board WHERE board_studentID = ? OR board_studentID = 'admin'" +
                        "ORDER BY board_classification DESC, create_date DESC LIMIT ?, ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, id);
                pstmt.setInt(2, startRow);
                pstmt.setInt(3, endRow);
            }
            rs = pstmt.executeQuery();

            while(rs.next()){
                BoardDto dto = new BoardDto(rs.getInt("board_index"), rs.getString("board_title"), rs.getString("board_inquiry"), rs.getString("board_studentID"),
                        rs.getString("board_classification"), rs.getDate("create_date"));
                list.add(dto);
            }
            return list;
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
        return null;
    }

    public List<BoardDto> getNoticeInquiry(int startRow, int endRow){
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "";
        ResultSet rs = null;
        ArrayList<BoardDto> list = new ArrayList<>();
        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return null;
            query = "SELECT * FROM board WHERE board_classification = 'notice' ORDER BY board_classification DESC, create_date DESC LIMIT ?, ?;";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, endRow);

            rs = pstmt.executeQuery();

            while(rs.next()){
                BoardDto dto = new BoardDto(rs.getInt("board_index"), rs.getString("board_title"), rs.getString("board_inquiry"), rs.getString("board_studentID"),
                        rs.getString("board_classification"), rs.getDate("create_date"));
                list.add(dto);
            }
            return list;
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
        return null;
    }
}
