(define (problem logistics-problem)
  (:domain logistics)

  (:objects
    package_0 package_1 package_2 - package
    truck_0 truck_1 - truck
    plane_0 - airplane
    location_0_0 location_0_1 location_1_0 location_1_1 location_1_2 - location
    city_0 city_1 - city
  )

  (:init
    ;; city membership of locations
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)

    ;; airports
    (airport location_0_1)
    (airport location_1_1)

    ;; road connectivity (explicit, directional facts for solver)
    (road location_0_0 location_0_1)
    (road location_0_1 location_0_0)
    (road location_1_1 location_1_0)
    (road location_1_0 location_1_1)
    (road location_1_1 location_1_2)
    (road location_1_2 location_1_1)

    ;; initial positions of vehicles
    (at truck_0 location_0_0)
    (at truck_1 location_1_1)
    (at plane_0 location_0_1)

    ;; initial positions of packages (exact initial facts)
    (at package_0 location_0_0)
    (at package_1 location_0_1)
    (at package_2 location_0_1)
  )

  (:goal (and
    (at package_0 location_1_0)
    (at package_1 location_1_0)
    (at package_2 location_1_2)
  ))
)