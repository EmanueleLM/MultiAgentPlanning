(define (problem logistics37_problem)
  (:domain logistics37)

  (:objects
    package_0 package_1 package_2 package_3 package_4 package_5 - package
    truck_0 truck_1 - truck
    airplane_0 - airplane
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    city_0 city_1 - city
  )

  (:init
    ;; airports (one per city as specified)
    (airport location_0_0)
    (airport location_1_0)

    ;; airplane initial location
    (at_airplane airplane_0 location_0_0)

    ;; packages at their start locations
    (at package_0 location_1_0)
    (at package_1 location_1_1)
    (at package_2 location_1_2)
    (at package_3 location_1_1)
    (at package_4 location_0_1)
    (at package_5 location_0_1)

    ;; trucks at their start locations (one truck per city as stated)
    (at_truck truck_0 location_0_0)
    (at_truck truck_1 location_1_1)

    ;; location -> city mapping
    (location_in_city location_0_0 city_0)
    (location_in_city location_0_1 city_0)
    (location_in_city location_0_2 city_0)
    (location_in_city location_1_0 city_1)
    (location_in_city location_1_1 city_1)
    (location_in_city location_1_2 city_1)

    ;; same_city reflexive facts (we keep same_city only true for identical cities;
    ;; fly requires NOT same_city to ensure flights go between different cities)
    (same_city city_0 city_0)
    (same_city city_1 city_1)
  )

  (:goal (and
    (at package_0 location_0_0)
    (at package_1 location_1_1)
    (at package_2 location_0_2)
    (at package_3 location_0_0)
    (at package_4 location_1_0)
    (at package_5 location_0_1)
  ))
)