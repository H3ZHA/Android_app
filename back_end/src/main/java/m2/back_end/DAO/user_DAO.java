package m2.back_end.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import m2.back_end.model.user;

public interface user_DAO extends JpaRepository<user, Long>{
    List<user> findByEmail(String email);
}
