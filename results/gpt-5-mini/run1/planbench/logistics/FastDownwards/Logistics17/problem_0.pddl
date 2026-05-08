(define (problem logistics_task)
  (:domain logistics_orchestrated)

  (:objects
    ;; cities
    city_0 city_1 - city

    ;; locations
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ;; trucks
    truck_0 truck_1 - truck

    ;; airplanes
    airplane_0 airplane_1 - airplane

    ;; packages
    package_0 package_1 package_2 package_3 - package

    ;; truck slots (2 slots per truck chosen to enforce finite capacity)
    t0_s0 t0_s1 - tslot
    t1_s0 t1_s1 - tslot

    ;; airplane cargo slots (3 slots per airplane)
    a0_s0 a0_s1 a0_s2 - pslot
    a1_s0 a1_s1 a1_s2 - pslot

    ;; gates (one gate per airport)
    gate_0_0 gate_1_0 - gate
  )

  (:init
    ;; city membership
    (location_in_city location_0_0 city_0)
    (location_in_city location_0_1 city_0)
    (location_in_city location_1_0 city_1)
    (location_in_city location_1_1 city_1)

    ;; airports
    (is_airport location_0_0)
    (is_airport location_1_0)

    ;; different-city relation for the two airports (explicit)
    (different_city location_0_0 location_1_0)
    (different_city location_1_0 location_0_0)

    ;; initial positions of trucks
    (at truck_0 location_0_1)
    (at truck_1 location_1_1)

    ;; trucks are stopped and not busy initially
    (truck_stopped truck_0)
    (truck_stopped truck_1)

    ;; initial positions of airplanes (both at city_1 airport as reported)
    (at airplane_0 location_1_0)
    (at airplane_1 location_1_0)

    ;; airplanes are grounded at their current airport and not busy initially
    (airplane_grounded airplane_0)
    (airplane_grounded airplane_1)

    ;; packages initial positions
    (at package_0 location_0_1)
    (at package_1 location_1_1)
    (at package_2 location_1_0)
    (at package_3 location_1_1)

    ;; truck slot availability (all slots free initially)
    (slot_free_truck truck_0 t0_s0)
    (slot_free_truck truck_0 t0_s1)
    (slot_free_truck truck_1 t1_s0)
    (slot_free_truck truck_1 t1_s1)

    ;; airplane cargo slot availability (all slots free initially)
    (slot_free_plane airplane_0 a0_s0)
    (slot_free_plane airplane_0 a0_s1)
    (slot_free_plane airplane_0 a0_s2)
    (slot_free_plane airplane_1 a1_s0)
    (slot_free_plane airplane_1 a1_s1)
    (slot_free_plane airplane_1 a1_s2)

    ;; gates free initially (one gate at each airport)
    (gate_free location_0_0 gate_0_0)
    (gate_free location_1_0 gate_1_0)
  )

  ;; Goal: place each package at its mandated final location and ensure no package remains inside any vehicle.
  (:goal (and
    ;; package_0 -> airport location_0_0
    (at package_0 location_0_0)
    (not (in_any_vehicle package_0))

    ;; package_1 -> airport location_1_0
    (at package_1 location_1_0)
    (not (in_any_vehicle package_1))

    ;; package_2 -> location_0_1 (non-airport)
    (at package_2 location_0_1)
    (not (in_any_vehicle package_2))

    ;; package_3 -> location_1_1 (non-airport)
    (at package_3 location_1_1)
    (not (in_any_vehicle package_3))
  ))
)