package m2.back_end.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import m2.back_end.model.*;
import m2.back_end.exception.*;
import m2.back_end.DAO.*;

@CrossOrigin(origins = "http://localhost:8080")
@RestController
public class main_controller {
    @Autowired
    user_DAO _user_DAO;

    @Autowired
    booking_log_DAO _booking_log_DAO;

    @Autowired
    mediminder_DAO _mediminder_dao;

    @Autowired
    exception _exception;

    @PostMapping("backend/sign_up")
    public String sign_up(@RequestBody user user){
        if(user.get_password().equals(user.get_checkp()) == false){
            return _exception.passwords_not_match();
        }

        List<user> Data = new ArrayList<user>();
        _user_DAO.findByEmail(user.get_email()).forEach(Data::add);

        if (Data.isEmpty()) {
            _user_DAO.save(new user(user.get_email(), user.get_password(),
                    user.get_checkp()));
            return "register success! " + user.get_email();
        }
        else {
            return _exception.email_already_registered();
        }
    }

    @PostMapping("backend/login")
    public String login(@RequestBody user user){
        List<user> Data = new ArrayList<user>();
        _user_DAO.findByEmail(user.get_email()).forEach(Data::add);

        if (Data.isEmpty()) {
            return _exception.user_not_exist("user");
        }

        if(Data.get(0).get_password().equals(user.get_password())){
            return "login success! welcome " + user.get_email();
        }
        else{
            return _exception.password_incorrect();
        }
    }

    @PostMapping("backend/booking")
    public String booking(@RequestBody booking_log booking_log){
        // check patient email
        List<user> check_user = new ArrayList<user>();
        _user_DAO.findByEmail(booking_log.get_patient()).forEach(check_user::add);
        if (check_user.isEmpty()) {
            return _exception.user_not_exist("patient");
        }

        // check doctor email
        List<user> check_doctor = new ArrayList<user>();
        _user_DAO.findByEmail(booking_log.get_doctor()).forEach(check_doctor::add);
        if (check_doctor.isEmpty()) {
            return _exception.user_not_exist("doctor");
        }

        // check doctor available
        if(check_doctor.get(0).get_available().equals("false")){
            return _exception.doctor_not_available();
        }

        // add booking log
        _booking_log_DAO.save(new booking_log(booking_log.get_patient(),
                booking_log.get_doctor()));
        return "booking success";
    }

    @PostMapping("backend/add_mediminder")
    public String add_mediminder(@RequestBody mediminder mediminder){
        // check email
        List<user> check_user = new ArrayList<user>();
        _user_DAO.findByEmail(mediminder.get_email()).forEach(check_user::add);
        if (check_user.isEmpty()) {
            return _exception.user_not_exist("user ");
        }

        if(mediminder.get_medicine().length() == 0){
            return "please enter medicine name";
        }

        if(mediminder.get_dosage().length() == 0){
            return "please enter dosage";
        }

        _mediminder_dao.save(new mediminder(mediminder.get_email(),mediminder.get_medicine(),
                mediminder.get_dosage()));
        return "add mediminder success";
    }

    @PostMapping("backend/test")
    public ResponseEntity<mediminder> test(@RequestBody mediminder mediminder){
        return new ResponseEntity<>(mediminder, HttpStatus.OK);
    }

    @PostMapping("backend/test2")
    public String test2(){
        return "111";
    }
}
