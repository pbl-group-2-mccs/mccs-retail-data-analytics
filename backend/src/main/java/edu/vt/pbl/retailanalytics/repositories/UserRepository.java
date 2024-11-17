package edu.vt.pbl.retailanalytics.repositories;

import edu.vt.pbl.retailanalytics.entites.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findByLogin(String login);
}
