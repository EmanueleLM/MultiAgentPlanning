(define (problem logistics_multiagent_problem)
  (:domain logistics_multiagent)

  (:objects
    ; cities
    city_0 city_1 - city

    ; locations
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ; vehicles: one truck and one airplane per city (names from specification)
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - plane

    ; packages
    package_0 package_1 package_2 - package
  )

  (:init
    ; location -> city membership
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)

    ; airports
    (is-airport location_0_0)
    (is-airport location_1_0)

    ; initial vehicle positions (as given)
    (at airplane_0 location_0_0)
    (at airplane_1 location_1_0)
    (at truck_0 location_0_1)
    (at truck_1 location_1_0)

    ; initial package positions (as given)
    (at-pkg package_0 location_1_1)
    (at-pkg package_1 location_0_0)
    (at-pkg package_2 location_0_0)
  )

  (:goal (and
    (at-pkg package_0 location_0_1)
    (at-pkg package_1 location_1_1)
    (at-pkg package_2 location_1_0)
  ))
)