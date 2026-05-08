(define (problem logistics14_problem)
  (:domain logistics14)

  (:objects
    ;; packages
    package_0 package_1 package_2 package_3 - package

    ;; vehicles
    truck_0 truck_1 - truck
    airplane_0 - airplane

    ;; locations
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ;; cities
    city_0 city_1 - city
  )

  (:init
    ;; Airports
    (airport location_0_0)
    (airport location_1_0)

    ;; Location -> city membership
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)

    ;; Truck -> city binding (one truck per city)
    (truck-in-city truck_0 city_0)
    (truck-in-city truck_1 city_1)

    ;; Initial vehicle positions
    (truck-at truck_0 location_0_0)
    (truck-at truck_1 location_1_1)
    (plane-at airplane_0 location_1_0)

    ;; Initial package positions
    (package-at package_0 location_1_0)
    (package-at package_1 location_1_1)
    (package-at package_2 location_0_0)
    (package-at package_3 location_0_1)
  )

  (:goal
    (and
      (package-at package_0 location_0_1)
      (package-at package_1 location_0_1)
      (package-at package_2 location_1_0)
      (package-at package_3 location_1_0)
    )
  )
)