package beans;

import java.util.Date;

public class BoardDto {
    private Integer board_index;
    private String board_title;
    private String board_inquiry;
    private String b0ard_studentID;
    private String board_classfication;
    private String board_answer;
    private Date create_date;

    public BoardDto() {}

    public BoardDto(Integer board_index, String board_title, String board_inquiry, String b0ard_studentID, String board_classfication, String board_answer, Date create_date) {
        this.board_index = board_index;
        this.board_title = board_title;
        this.board_inquiry = board_inquiry;
        this.b0ard_studentID = b0ard_studentID;
        this.board_classfication = board_classfication;
        this.board_answer = board_answer;
        this.create_date = create_date;
    }

    public BoardDto(Integer board_index, String board_title, String board_inquiry, String b0ard_studentID, String board_classfication, Date create_date) {
        this.board_index = board_index;
        this.board_title = board_title;
        this.board_inquiry = board_inquiry;
        this.b0ard_studentID = b0ard_studentID;
        this.board_classfication = board_classfication;
        this.create_date = create_date;
    }

    public Integer getBoard_index() {
        return board_index;
    }

    public void setBoard_index(Integer board_index) {
        this.board_index = board_index;
    }

    public String getBoard_title() {
        return board_title;
    }

    public void setBoard_title(String board_title) {
        this.board_title = board_title;
    }

    public String getBoard_inquiry() {
        return board_inquiry;
    }

    public void setBoard_inquiry(String board_inquiry) {
        this.board_inquiry = board_inquiry;
    }

    public String getB0ard_studentID() {
        return b0ard_studentID;
    }

    public void setB0ard_studentID(String b0ard_studentID) {
        this.b0ard_studentID = b0ard_studentID;
    }

    public String getBoard_classfication() {
        return board_classfication;
    }

    public void setBoard_classfication(String board_classfication) {
        this.board_classfication = board_classfication;
    }

    public String getBoard_answer() {
        return board_answer;
    }

    public void setBoard_answer(String board_answer) {
        this.board_answer = board_answer;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }
//    public void setUpdateDay(Date updateDay) {
//        this.updateDay = updateDay;
//    }
}
