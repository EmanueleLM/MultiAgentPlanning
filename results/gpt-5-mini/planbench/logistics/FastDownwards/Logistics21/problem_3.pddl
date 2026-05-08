(define (problem logistics21_problem)
  (:domain logistics21)

  (:objects
    ;; packages
    package_0 package_1 - package

    ;; trucks (one per city)
    truck_0 truck_1 - truck

    ;; airplane(s)
    airplane_0 - plane

    ;; cities
    city_0 city_1 - city

    ;; all locations (airports are marked in :init with is_airport)
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
  )

  (:init
    ;; package initial locations
    (at_pkg package_0 location_1_1)
    (at_pkg package_1 location_1_2)

    ;; vehicle initial locations
    (at_truck truck_0 location_0_1)
    (at_truck truck_1 location_1_0)
    (at_plane airplane_0 location_0_0)

    ;; location -> city membership
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_0_2 city_0)

    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    (in_city location_1_2 city_1)

    ;; airports
    (is_airport location_0_0)
    (is_airport location_1_0)
  )

  (:goal (and
    (at_pkg package_0 location_0_2)
    (at_pkg package_1 location_0_0)
  ))
)