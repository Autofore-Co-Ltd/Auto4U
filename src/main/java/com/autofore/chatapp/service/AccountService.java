package com.autofore.chatapp.service;


import com.autofore.chatapp.repository.AccountRepository;
import com.autofore.chatapp.model.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AccountService {
    @Autowired
    private AccountRepository accountRepository;

    public List<Account> getAllAccounts() {
        return accountRepository.findAll();
    }

    public Account getAccountById(Long id) {
        return accountRepository.findById(id).orElse(null);
    }

    public Account saveAccount(Account account) {
        return accountRepository.save(account);
    }

    public void deleteAccount(Long id) {
        accountRepository.deleteById(id);
    }

//    public Account authenticate(String name, String telephoneNumber) {
//        return accountRepository.findByNameAndTelephoneNumber(name, telephoneNumber);
//    }

    public Account authenticate(String name, String telephoneNumber) {
        Optional<Account> accountOptional = accountRepository.findByNameAndTelephoneNumber(name, telephoneNumber);
        return accountOptional.orElse(null);
    }
}

