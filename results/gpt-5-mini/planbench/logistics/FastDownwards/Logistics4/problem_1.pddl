(define (problem logistics-multi-problem)
  (:domain logistics_multiagent)
  (:objects
    ;; cities
    city_0 city_1 - city
    ;; locations (two per city)
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    ;; trucks (one per city)
    truck_0 truck_1 - truck
    ;; airplanes
    airplane_0 - airplane
    ;; packages
    package_0 - package
  )
  (:init
    ;; location -> city
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)

    ;; airports
    (is_airport location_0_0)
    (is_airport location_1_0)

    ;; trucks assigned to cities and initial positions
    (truck_in_city truck_0 city_0)
    (truck_in_city truck_1 city_1)
    (at_truck truck_0 location_0_0)
    (at_truck truck_1 location_1_0)

    ;; airplane initial position (at airport in city_1)
    (at_plane airplane_0 location_1_0)

    ;; package initial state: at location_1_0
    (at package_0 location_1_0)
  )
  (:goal (and
    (at package_0 location_1_1)
  ))
)