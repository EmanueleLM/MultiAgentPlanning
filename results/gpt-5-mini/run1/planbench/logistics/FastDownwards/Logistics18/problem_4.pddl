(define (problem logistics18-instance)
  (:domain logistics18)

  (:objects
    package_0 - package
    truck_0 truck_1 - truck
    airplane_0 - airplane
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    city_0 city_1 - city
  )

  (:init
    ;; city membership of locations
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_0_2 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    (in_city location_1_2 city_1)

    ;; airports (declared in the instance)
    (is_airport location_0_0)
    (is_airport location_1_0)

    ;; truck-to-city assignment (one truck per city as given)
    (belongs_to_city truck_0 city_0)
    (belongs_to_city truck_1 city_1)

    ;; initial locations of vehicles
    (truck_at truck_0 location_0_2)
    (truck_at truck_1 location_1_0)
    (airplane_at airplane_0 location_1_0)

    ;; package initial location
    (at_pkg package_0 location_0_1)
  )

  (:goal (and
    (at_pkg package_0 location_1_2)
  ))
)