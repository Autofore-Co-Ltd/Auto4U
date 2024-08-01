//package com.autofore.chatapp.controller;
//
//public class LoginController {
//}

package com.autofore.chatapp.controller;

import com.autofore.chatapp.model.Account;
import com.autofore.chatapp.model.LoginRequest;
import com.autofore.chatapp.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/login")
public class LoginController {
    @Autowired
    private AccountService accountService;

    @PostMapping
    public ResponseEntity<String> login(@RequestBody LoginRequest loginRequest) {
        Account account = accountService.authenticate(loginRequest.getName(), loginRequest.getTelephoneNumber());
        if (account != null) {
            return ResponseEntity.ok("Login successful");
        } else {
            return ResponseEntity.status(401).body("Invalid credentials");
        }
    }
}
