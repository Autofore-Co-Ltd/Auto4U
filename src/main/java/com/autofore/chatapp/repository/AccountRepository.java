package com.autofore.chatapp.repository;


import com.autofore.chatapp.model.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AccountRepository extends JpaRepository<Account, Long> {
//    Account findByNameAndTelephoneNumber(String name, String telephoneNumber);

    Optional<Account> findByNameAndTelephoneNumber(String name, String telephoneNumber);
}

