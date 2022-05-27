package beans;

public class UserDto {
    private String id;
    private String pw;
    private String name;
    private String phone;
    private String email;
    private String position;
    private String state;
    private String warning;

    public static class Builder{
        private String id;
        private String pw;
        private String name;
        private String phone;
        private String email;
        private String position;
        private String state;
        private String warning;

        public Builder id(String id){
            this.id = id;
            return this;
        }

        public Builder pw(String pw){
            this.pw = pw;
            return this;
        }

        public Builder name(String name){
            this.name = name;
            return this;
        }

        public Builder phone(String phone){
            this.phone = phone;
            return this;
        }

        public Builder email(String email){
            this.email = email;
            return this;
        }

        public Builder position(String position){
            this.position = position;
            return this;
        }

        public Builder warning(String warning){
            this.warning = warning;
            return this;
        }

        public Builder state(String state){
            this.state = state;
            return this;
        }
        public UserDto build() {
            return new UserDto(this);
        }
    }

    public UserDto(Builder builder){
        this.id = builder.id;
        this.pw = builder.pw;
        this.name = builder.name;
        this.phone = builder.phone;
        this.email = builder.email;
        this.position = builder.position;
        this.state = builder.state;
        this.warning = builder.warning;
    }

    public UserDto() {}

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getWarning() {
        return warning;
    }

    public void setWarning(String warning) {
        this.warning = warning;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}