(define (problem deliver-package-example)
  (:domain multi-modal-logistics)

  (:objects
    ;; cities
    city0 city1 - city

    ;; locations
    loc_c0_air loc_c0_warehouse - location
    loc_c1_air loc_c1_customer  - location

    ;; trucks and airplanes
    truck0 truck1 - truck
    plane0 - airplane

    ;; package
    pkg0 - package
  )

  (:init
    ;; location -> city membership (static)
    (location_in_city loc_c0_air city0)
    (location_in_city loc_c0_warehouse city0)
    (location_in_city loc_c1_air city1)
    (location_in_city loc_c1_customer city1)

    ;; airports
    (airport loc_c0_air)
    (airport loc_c1_air)

    ;; different-city relation for airport-to-airport flights (explicit static facts)
    (different-city loc_c0_air loc_c1_air)
    (different-city loc_c1_air loc_c0_air)

    ;; initial vehicle and package positions
    (at-truck truck0 loc_c0_warehouse)
    (at-truck truck1 loc_c1_customer)   ;; truck already located at destination city to receive deliveries
    (at-plane plane0 loc_c0_air)
    (at-pkg pkg0 loc_c0_warehouse)

    ;; No ready tokens initially: pkg0 is not yet ready for airlift nor ground-delivery
  )

  (:goal (and
    ;; final delivery condition: package must be at the customer location in city1
    (at-pkg pkg0 loc_c1_customer)
  ))