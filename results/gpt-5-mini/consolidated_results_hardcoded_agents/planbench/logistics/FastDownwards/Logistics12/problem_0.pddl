(define (problem logistics_multiagent_problem)
  (:domain logistics_multiagent)

  (:objects
    ; cities
    city_0 city_1 - city

    ; locations (two locations per city)
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ; vehicles
    truck_0 truck_1 - truck
    plane_0 - plane

    ; packages
    package_0 package_1 package_2 - package
  )

  (:init
    ; location -> city membership
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)

    ; airports (one airport in each city, placed at the first location)
    (is-airport location_0_0)
    (is-airport location_1_0)

    ; initial vehicle positions
    (at truck_0 location_0_0)
    (at truck_1 location_1_0)
    (at plane_0 location_0_0)

    ; initial package positions (public environment info)
    (at-pkg package_0 location_0_0)
    (at-pkg package_1 location_0_1)
    (at-pkg package_2 location_1_1)
  )

  (:goal (and
    ; mandated terminal conditions:
    (at-pkg package_0 location_0_1)
    (at-pkg package_1 location_1_1)
    (at-pkg package_2 location_1_0)
  ))
)