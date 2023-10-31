package m2.back_end.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import m2.back_end.model.mediminder;

public interface mediminder_DAO extends JpaRepository<mediminder, Long>{
    List<mediminder> findByEmail(String email);
}
