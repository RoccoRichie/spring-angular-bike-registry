package com.roccorichie.bikeregistryservice.controllers;

import java.util.ArrayList;
import java.util.List;

import com.roccorichie.bikeregistryservice.repositories.BikeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import com.roccorichie.bikeregistryservice.models.Bike;


@RestController
@RequestMapping("/api/v1/bikes")
public class BikesController {

    // Inject the BikeRepository into the controller
    @Autowired
    private BikeRepository bikeRepository;

    // When a reuest hits the mapping above, the GetMapping will direct to this method
    @GetMapping
    public List<Bike> list() {
        return bikeRepository.findAll();
    }

    // Handles form creates (Post) HTTP 200 response
    @PostMapping
    @ResponseStatus(HttpStatus.OK)
    public void create(@RequestBody Bike bike) {
        bikeRepository.save(bike);
    }

    // Get method to return a bike based on its id
    // Adding onto base map /id
    @GetMapping("/{id}")
    public Bike get(@PathVariable("id") long id) {
        return bikeRepository.getOne(id);
    }
}
