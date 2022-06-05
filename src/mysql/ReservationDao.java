package mysql;

import beans.ReservationDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReservationDao {
    public static int RESERVATION_SUCCESS = 1;
    public static int SELECT_SUCCESS = 2;
    public static int UPDATE_SUCCESS = 3;
    public static int UPDATE_FAIL = 4;
    public static int DELETE_SUCCESS = 5;
    public static int DELETE_FAIL = 6;
    private static ReservationDao instance = new ReservationDao();

    public static ReservationDao getInstance() { return instance; }

    private ReservationDao(){
    }

    public int insertReservation(ReservationDto reservation, String seat) {
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "INSERT INTO reservation (reservation_id, reservation_lectureroom_num, reservation_startTime, reservation_endTime," +
                "reservation_seat, reservation_date) VALUES (?,?,?,?,?,?)";
        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, reservation.getId());
            pstmt.setString(2, reservation.getLectureroomNum());
            pstmt.setString(3, reservation.getStartTime());
            pstmt.setString(4, reservation.getEndTime());
            pstmt.setString(5, seat);
            pstmt.setString(6, reservation.getDate());
            pstmt.executeUpdate();
            rt = RESERVATION_SUCCESS;
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

    public int insertReservationAm(ReservationDto reservation, String seat) {
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "INSERT INTO reservation (reservation_id, reservation_lectureroom_num, reservation_startTime, reservation_endTime," +
                "reservation_seat, reservation_date, reservation_state) VALUES (?,?,?,?,?,?,?)";
        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, reservation.getId());
            pstmt.setString(2, reservation.getLectureroomNum());
            pstmt.setString(3, reservation.getStartTime());
            pstmt.setString(4, reservation.getEndTime());
            pstmt.setString(5, seat);
            pstmt.setString(6, reservation.getDate());
            pstmt.setString(7, "승인");
            pstmt.executeUpdate();
            rt = RESERVATION_SUCCESS;
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

    public int selectLongTime(){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "SELECT MAX(CONVERT(SUBSTR(reservation_endTime,1,2), signed integer)), reservation_id FROM reservation";
        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.executeQuery();
            rt = SELECT_SUCCESS;
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

    public List<ReservationDto> selectTime(String room, String date, int start, int end){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "SELECT reservation_seat FROM reservation WHERE reservation_date=? " +
                "AND reservation_lectureroom_num=?"+
                "AND ((? >= CONVERT(SUBSTR(reservation_startTime,1,2), signed integer) AND ? < CONVERT(SUBSTR(reservation_endTime,1,2), signed integer))" +
                "OR (? >= CONVERT(SUBSTR(reservation_startTime,1,2), signed integer) AND ? < CONVERT(SUBSTR(reservation_endTime,1,2), signed integer))" +
                "OR (? <= CONVERT(SUBSTR(reservation_startTime,1,2), signed integer) AND ? >= CONVERT(SUBSTR(reservation_endTime,1,2), signed integer)))" +
                "AND reservation_state='승인'";
        ResultSet rs = null;
        ArrayList<ReservationDto> list = new ArrayList<>();
        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return null;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, date);
            pstmt.setString(2, room);
            pstmt.setInt(3, start);
            pstmt.setInt(4, start);
            pstmt.setInt(5, end);
            pstmt.setInt(6, end);
            pstmt.setInt(7, start);
            pstmt.setInt(8, end);
            rs = pstmt.executeQuery();

            while(rs.next()){
                ReservationDto dto = new ReservationDto.Builder()
                        .seat(rs.getString("reservation_seat"))
                        .build();
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

    public List<ReservationDto> getReservation(int startRow, int endRow, String id){
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "";
        ResultSet rs = null;
        ArrayList<ReservationDto> list = new ArrayList<>();
        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return null;
            if(id.equals("")){
                query = "SELECT * FROM reservation ORDER BY reservation_date DESC, reservation_startTime DESC, reservation_endTime DESC, reservation_state LIMIT ?, ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, startRow);
                pstmt.setInt(2, endRow);
            }else {
                query = "SELECT * FROM reservation WHERE reservation_id=? ORDER BY reservation_date DESC, reservation_startTime DESC, reservation_endTime DESC, reservation_state LIMIT ?, ?";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, id);
                pstmt.setInt(2, startRow);
                pstmt.setInt(3, endRow);
            }
            rs = pstmt.executeQuery();

            while(rs.next()){
                ReservationDto dto = new ReservationDto.Builder()
                        .id(rs.getString("reservation_id"))
                        .lectureroomNum(rs.getString("reservation_lectureroom_num"))
                        .startTime(rs.getString("reservation_startTime"))
                        .endTime(rs.getString("reservation_endTime"))
                        .seat(rs.getString("reservation_seat"))
                        .date(rs.getString("reservation_date"))
                        .state(rs.getString("reservation_state"))
                        .build();
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

    public int getCount(){
        int count = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT count(*) FROM reservation";
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
        String sql = "SELECT count(*) FROM reservation WHERE reservation_id=?";
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

    public int updateState(ReservationDto reservationDto){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String query = "UPDATE reservation SET reservation_state='승인' WHERE reservation_id = ? AND reservation_lectureroom_num=? AND " +
                "reservation_startTime = ? AND reservation_endTime = ? AND reservation_seat = ? AND reservation_date = ?";

        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, reservationDto.getId());
            pstmt.setString(2, reservationDto.getLectureroomNum());
            pstmt.setString(3, reservationDto.getStartTime());
            pstmt.setString(4, reservationDto.getEndTime());
            pstmt.setString(5, reservationDto.getSeat());
            pstmt.setString(6, reservationDto.getDate());
            pstmt.executeUpdate();
            rt = UPDATE_SUCCESS;
        } catch (SQLException e) {
            rt = UPDATE_FAIL;
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

    public String getLongTimeName(String date){
        String name = "";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT member_name FROM member JOIN " +
                "(SELECT MAX(CONVERT(SUBSTR(reservation_endTime,1,2), signed integer)), reservation_id, reservation_endTime FROM reservation " +
                "WHERE reservation_state='승인' AND reservation_date=?) r " +
                "WHERE member_id=r.reservation_id";
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, date);
            rs = pstmt.executeQuery();
            if(rs.next()){
                name = rs.getString("member_name");
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
        return name;
    }

    public int deleteReservation(String id, String date, String room, String seat, String sTime, String eTime){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String query = "DELETE FROM reservation WHERE reservation_id = ? AND reservation_lectureroom_num=? " +
                "AND reservation_startTime = ? AND reservation_endTime = ? AND reservation_seat = ? AND reservation_date = ?";

        try {
            conn = DatabaseUtil.getConnection();

            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            pstmt.setString(2, room);
            pstmt.setString(3, sTime);
            pstmt.setString(4, eTime);
            pstmt.setString(5, seat);
            pstmt.setString(6, date);
            pstmt.executeUpdate();
            rt = DELETE_SUCCESS;
        } catch (SQLException e) {
            rt = DELETE_FAIL;
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



    public int getExtendTime(String seat, int sTime, String room, int week){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT MIN(CONVERT(SUBSTR(r.reservation_startTime,1, INSTR(r.reservation_startTime,':')-1), signed integer)) rcnt, MIN(CONVERT(SUBSTR(s.schedule_class_Stime,1, INSTR(s.schedule_class_Stime,':')-1), signed integer)) scnt FROM reservation r, schedule s " +
                "WHERE reservation_seat =? AND reservation_startTime > ? AND s.schedule_lectureroom_num =? AND s.schedule_week = ?";
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, seat);
            pstmt.setInt(2, sTime);
            pstmt.setString(3, room);
            pstmt.setInt(4, week);
            rs = pstmt.executeQuery();
            if(rs.next()){
                int r = rs.getInt("rcnt");
                int s = rs.getInt("scnt");
                if(r>=s){
                    rt=s;
                }else {
                    rt=r;
                }
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
        return rt;
    }

    public int updateExtendTime(String time, String seat, String date, String room, String sTime, String eTime){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String query = "UPDATE reservation SET reservation_endTime=? WHERE reservation_lectureroom_num=? AND " +
                "reservation_startTime = ? AND reservation_endTime = ? AND reservation_seat = ? AND reservation_date = ?";

        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, time);
            pstmt.setString(2, room);
            pstmt.setString(3, sTime);
            pstmt.setString(4, eTime);
            pstmt.setString(5, seat);
            pstmt.setString(6, date);

            pstmt.executeUpdate();
            rt = UPDATE_SUCCESS;
        } catch (SQLException e) {
            rt = UPDATE_FAIL;
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

    public int getState(String id){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String query = "SELECT count(*) cnt FROM member WHERE member_state = 'good' AND member_id = ?;";
        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()){
                rt = rs.getInt("cnt");
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
        return rt;
    }
}
