package com.roccorichie.bikeregistryservice.repositories;

import com.roccorichie.bikeregistryservice.models.Bike;
import org.springframework.data.jpa.repository.JpaRepository;

// Extend JpaRepository brings all the CRUD operations
public interface BikeRepository extends JpaRepository<Bike, Long> {
}
