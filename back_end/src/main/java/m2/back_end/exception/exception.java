package m2.back_end.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;

@Repository
public class exception {
    public String passwords_not_match(){
        return "two passwords do not match";
    }

    public String email_already_registered(){
        return "email already registered";
    }

    public String user_not_exist(String user){
        return user + " does not exist";
    }

    public String password_incorrect(){
        return "password incorrect";
    }

    public  String doctor_not_available(){
        return "doctor not available";
    }
}
