package m2.back_end.model;

import javax.persistence.*;

@Entity
@Table(name = "booking_log")
public class booking_log {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Column(name = "patient")
    private String patient;
    @Column(name = "doctor")
    private String doctor;

    public booking_log(String patient, String doctor){
        this.patient = patient;
        this.doctor = doctor;
    }

    public String get_patient(){
        return patient;
    }

    public void set_patient(String patient){
        this.patient = patient;
    }

    public String get_doctor(){
        return doctor;
    }

    public void set_doctor(String doctor){
        this.doctor = doctor;
    }

    public long get_id(){
        return id;
    }
}
