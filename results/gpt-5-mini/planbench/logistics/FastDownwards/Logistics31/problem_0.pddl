(define (problem jack_instance)
  (:domain jack_of_all_trades)

  (:objects
    package_0 package_1 package_2 package_3 - package
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    city_0 city_1 - city
  )

  (:init
    ;; airports
    (is_airport location_0_0)
    (is_airport location_1_0)

    ;; airplanes locations
    (airplane_at airplane_0 location_1_0)
    (airplane_at airplane_1 location_0_0)

    ;; packages at locations
    (package_at package_0 location_1_0)
    (package_at package_1 location_0_0)
    (package_at package_2 location_0_1)
    (package_at package_3 location_0_0)

    ;; trucks at locations
    (truck_at truck_0 location_0_1)
    (truck_at truck_1 location_1_0)

    ;; location membership in cities
    (location_in_city location_0_0 city_0)
    (location_in_city location_0_1 city_0)
    (location_in_city location_0_2 city_0)
    (location_in_city location_1_0 city_1)
    (location_in_city location_1_1 city_1)
    (location_in_city location_1_2 city_1)
  )

  (:goal (and
    (package_at package_0 location_1_2)
    (package_at package_1 location_0_2)
    (package_at package_2 location_1_1)
    (package_at package_3 location_1_0)
  ))
)