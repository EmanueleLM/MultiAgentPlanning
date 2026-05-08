(define (problem logistics9_problem)
  (:domain logistics9)
  (:objects
    city_0 city_1 - city
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    package_0 package_1 - package
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
  )
  (:init
    ;; Airports
    (is_airport location_0_0)
    (is_airport location_1_0)

    ;; Locations in cities
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)

    ;; Truck assignments to cities (derived from "In each city there is exactly one truck")
    (assigned_to_city truck_0 city_0)
    (assigned_to_city truck_1 city_1)

    ;; Initial positions of vehicles
    (at airplane_0 location_1_0)
    (at airplane_1 location_0_0)
    (at truck_0 location_0_0)
    (at truck_1 location_1_0)

    ;; Initial positions of packages
    (at package_0 location_0_0)
    (at package_1 location_1_1)
  )
  (:goal (and
    (at package_0 location_0_1)
    (at package_1 location_1_0)
  ))
)