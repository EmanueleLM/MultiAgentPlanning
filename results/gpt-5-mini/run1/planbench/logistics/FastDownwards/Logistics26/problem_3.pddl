(define (problem logistics26_problem)
  (:domain logistics26)

  (:objects
    city_0 city_1 - city
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    package_0 package_1 package_2 - package
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; vehicle positions
    (at_plane airplane_0 location_1_0)
    (at_plane airplane_1 location_0_0)
    (at_truck truck_0 location_0_1)
    (at_truck truck_1 location_1_1)

    ;; package positions
    (at_pkg package_0 location_1_2)
    (at_pkg package_1 location_0_2)
    (at_pkg package_2 location_0_2)

    ;; location -> city membership
    (loc_in_city location_0_0 city_0)
    (loc_in_city location_0_1 city_0)
    (loc_in_city location_0_2 city_0)
    (loc_in_city location_1_0 city_1)
    (loc_in_city location_1_1 city_1)
    (loc_in_city location_1_2 city_1)
  )

  (:goal (and
    (at_pkg package_0 location_0_0)
    (at_pkg package_1 location_1_1)
    (at_pkg package_2 location_1_2)
  ))
)