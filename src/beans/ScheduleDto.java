package beans;

public class ScheduleDto {
    private String schedule_name;
    private String schedule_lectureroom_num;
    private String schedule_class_Stime;
    private String schedule_class_Etime;
    private int schedule_week;

    public static class Builder{
        private String schedule_name;
        private String schedule_lectureroom_num;
        private String schedule_class_Stime;
        private String schedule_class_Etime;
        private int schedule_week;

        public Builder schedule_name(String schedule_name){
            this.schedule_name = schedule_name;
            return this;
        }

        public Builder schedule_lectureroom_num(String schedule_lectureroom_num){
            this.schedule_lectureroom_num = schedule_lectureroom_num;
            return this;
        }

        public Builder schedule_class_Stime(String schedule_class_Stime){
            this.schedule_class_Stime = schedule_class_Stime;
            return this;
        }

        public Builder schedule_class_Etime(String schedule_class_Etime){
            this.schedule_class_Etime = schedule_class_Etime;
            return this;
        }

        public Builder schedule_week(int schedule_week){
            this.schedule_week = schedule_week;
            return this;
        }

        public ScheduleDto build() { return new ScheduleDto(this);}
    }

    public ScheduleDto(){}

    public ScheduleDto(Builder builder){
        this.schedule_name = builder.schedule_name;
        this.schedule_lectureroom_num = builder.schedule_lectureroom_num;
        this.schedule_class_Stime = builder.schedule_class_Stime;
        this.schedule_class_Etime = builder.schedule_class_Etime;
        this.schedule_week = builder.schedule_week;
    }

    public String getSchedule_name() {
        return schedule_name;
    }

    public void setSchedule_name(String schedule_name) {
        this.schedule_name = schedule_name;
    }

    public String getSchedule_lectureroom_num() {
        return schedule_lectureroom_num;
    }

    public void setSchedule_lectureroom_num(String schedule_lectureroom_num) {
        this.schedule_lectureroom_num = schedule_lectureroom_num;
    }

    public String getSchedule_class_Stime() {
        return schedule_class_Stime;
    }

    public void setSchedule_class_Stime(String schedule_class_Stime) {
        this.schedule_class_Stime = schedule_class_Stime;
    }

    public String getSchedule_class_Etime() {
        return schedule_class_Etime;
    }

    public void setSchedule_class_Etime(String schedule_class_Etime) {
        this.schedule_class_Etime = schedule_class_Etime;
    }

    public int getSchedule_week() {
        return schedule_week;
    }

    public void setSchedule_week(int schedule_week) {
        this.schedule_week = schedule_week;
    }
}
