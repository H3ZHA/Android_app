package m2.back_end.model;

import javax.persistence.*;

@Entity
@Table(name = "users")
public class user {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Column(name = "email")
    private String email;
    @Column(name = "name")
    private String name;
    @Column(name = "password")
    private String password;
    @Column(name = "available")
    private String available;
    @Column(name = "checkp")
    private String checkp;

    public user(){

    }

    public user(String email, String password, String checkp){
        this.email = email;
        this.name = email;
        this.password = password;
        this.checkp = checkp;
        this.available = "false";
    }

    public long get_id(){
        return id;
    }

    public String get_name(){
        return name;
    }

    public void set_name(String name){
        this.name = name;
    }

    public String get_email(){
        return email;
    }

    public void set_email(String email){
        this.email = email;
    }

    public String get_password(){
        return password;
    }

    public String get_checkp(){
        return checkp;
    }

    public void set_checkp(String checkp){
        this.checkp = checkp;
    }

    public void set_password(String password){
        this.password = password;
    }

    public String get_available(){
        return available;
    }

    public void set_available(String bool){
        available = bool;
    }
}
