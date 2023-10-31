package m2.back_end.DAO;

import java.util.List;

import m2.back_end.model.user;
import org.springframework.data.jpa.repository.JpaRepository;
import m2.back_end.model.booking_log;

public interface booking_log_DAO extends JpaRepository<booking_log, Long> {
    List<booking_log> findByPatient(String patient);
    List<booking_log> findByDoctor(String doctor);
}
