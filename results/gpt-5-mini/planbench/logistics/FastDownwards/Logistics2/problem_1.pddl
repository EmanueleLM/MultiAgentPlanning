(define (problem logistics-instance)
  (:domain truck_airplane_logistics)

  (:objects
    ;; cities
    city_0 city_1 - city

    ;; locations
    location_0_0 location_1_0 - location

    ;; vehicles
    truck_0 truck_1 - truck
    airplane_0 - airplane

    ;; packages
    package_0 package_1 - package
  )

  (:init
    ;; airport flags
    (airport location_0_0)
    (airport location_1_0)

    ;; location -> city membership
    (location_in_city location_0_0 city_0)
    (location_in_city location_1_0 city_1)

    ;; connectivity: flight from city_1's airport to city_0's airport
    (flight_conn location_1_0 location_0_0)

    ;; initial positions
    (at_veh airplane_0 location_1_0)
    (at_pkg package_0 location_1_0)
    (at_pkg package_1 location_1_0)
    (at_veh truck_0 location_0_0)
    (at_veh truck_1 location_1_0)
  )

  (:goal
    (and
      (at_pkg package_0 location_0_0)
      (at_pkg package_1 location_0_0)
    )
  )
)