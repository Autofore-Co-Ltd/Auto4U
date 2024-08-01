package com.autofore.chatapp.controller;


import com.autofore.chatapp.model.Offer;
import com.autofore.chatapp.model.Topic;
import com.autofore.chatapp.service.OfferService;
import com.autofore.chatapp.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/home")
public class HomeController {
    @Autowired
    private OfferService offerService;

    @Autowired
    private TopicService topicService;

    @GetMapping("/offers")
    public ResponseEntity<List<Offer>> getOffers() {
        return ResponseEntity.ok(offerService.getAllOffers());
    }

    @GetMapping("/topics")
    public ResponseEntity<List<Topic>> getTopics() {
        return ResponseEntity.ok(topicService.getAllTopics());
    }
}

