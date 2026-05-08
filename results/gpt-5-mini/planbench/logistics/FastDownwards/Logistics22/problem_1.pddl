(define (problem logistics22_problem)
  (:domain logistics22)

  (:objects
    truck_0 truck_1 - truck
    plane_0 - plane
    package_0 package_1 - package
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    city_0 city_1 - city
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; vehicle positions
    (at plane_0 location_1_0)
    (at truck_0 location_0_2)
    (at truck_1 location_1_2)

    ;; package ground positions
    (at-pkg package_0 location_0_1)
    (at-pkg package_1 location_1_2)

    ;; vehicle capacities (each vehicle can carry at most one package; modeled via free predicate)
    (free plane_0)
    (free truck_0)
    (free truck_1)

    ;; location -> city assignment
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)
  )

  (:goal (and
    (at-pkg package_0 location_0_2)
    (at-pkg package_1 location_1_0)
  ))
)