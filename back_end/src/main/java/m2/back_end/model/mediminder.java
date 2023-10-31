package m2.back_end.model;

import javax.persistence.*;

@Entity
@Table(name = "medicine")
public class mediminder {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Column(name = "email")
    private String email;
    @Column(name = "medicine")
    private String medicine;
    @Column(name = "dosage")
    private String dosage;

    public mediminder(String email, String medicine, String dosage){
        this.email = email;
        this.medicine = medicine;
        this.dosage = dosage;
    }

    public long get_id(){
        return id;
    }

    public String get_email(){
        return email;
    }

    public void set_email(String email){
        this.email = email;
    }

    public String get_medicine(){
        return medicine;
    }

    public void set_medicine(String medicine){
        this.medicine = medicine;
    }

    public String get_dosage(){
        return dosage;
    }

    public void set_dosage(String dosage){
        this.dosage = dosage;
    }
}
