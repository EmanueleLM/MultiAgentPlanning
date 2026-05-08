(define (problem jack_of_all_trades_instance)
  (:domain jack_of_all_trades)
  (:objects
    package_0 package_1 - package
    truck_0 truck_1 truck_2 - truck
    airplane_0 airplane_1 - airplane
    location_0_0 location_1_0 location_2_0 - location
    city_0 city_1 city_2 - city
  )
  (:init
    ;; airports
    (is_airport location_0_0)
    (is_airport location_1_0)
    (is_airport location_2_0)

    ;; airplanes at locations
    (plane_at airplane_0 location_1_0)
    (plane_at airplane_1 location_2_0)

    ;; packages at locations
    (package_at package_0 location_2_0)
    (package_at package_1 location_1_0)

    ;; trucks at locations
    (truck_at truck_0 location_0_0)
    (truck_at truck_1 location_1_0)
    (truck_at truck_2 location_2_0)

    ;; location to city membership
    (location_in_city location_0_0 city_0)
    (location_in_city location_1_0 city_1)
    (location_in_city location_2_0 city_2)
  )
  (:goal (and
    (package_at package_0 location_2_0)
    (package_at package_1 location_0_0)
  ))
)