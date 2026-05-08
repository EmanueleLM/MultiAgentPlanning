(define (problem logistics_problem)
  (:domain logistics_orchestrated)

  (:objects
    ;; cities
    city_0 city_1 - city

    ;; locations
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location

    ;; trucks
    truck_0 truck_1 - truck

    ;; airplane
    airplane_0 - airplane

    ;; packages
    package_0 package_1 package_2 package_3 - package
  )

  (:init
    ;; Location -> City membership
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_0_2 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    (in_city location_1_2 city_1)

    ;; Airports (one per city as described)
    (airport location_0_0)
    (airport location_1_0)

    ;; Exactly-one truck per city (assigned)
    (truck_in_city truck_0 city_0)
    (truck_in_city truck_1 city_1)

    ;; Initial locations of vehicles
    (at_truck truck_0 location_0_0)
    (at_truck truck_1 location_1_2)
    (at_airplane airplane_0 location_1_0)

    ;; Initial locations of packages (and marked free)
    (at_package package_0 location_0_1)
    (at_package package_1 location_1_0)
    (at_package package_2 location_0_1)
    (at_package package_3 location_0_0)

    (free package_0)
    (free package_1)
    (free package_2)
    (free package_3)

    ;; Distinct city facts (explicit)
    (different_city city_0 city_1)
    (different_city city_1 city_0)
  )

  (:goal
    (and
      (at_package package_0 location_1_2)
      (at_package package_1 location_0_1)
      (at_package package_2 location_1_2)
      (at_package package_3 location_0_2)
    )
  )
)