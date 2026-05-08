(define (problem logistics_multiagent_problem)
  (:domain logistics_multiagent)

  (:objects
    ;; cities
    city_0 city_1 - city

    ;; locations per city
    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location

    ;; vehicles
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane

    ;; packages
    package_0 package_1 package_2 - package
  )

  (:init
    ;; airport designations
    (airport location_0_0)
    (airport location_1_0)

    ;; location to city membership (static)
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)

    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)

    ;; explicit driveable connectivity for trucks (any two different locations inside same city)
    ;; city_0 pairs
    (driveable location_0_0 location_0_1)
    (driveable location_0_0 location_0_2)
    (driveable location_0_1 location_0_0)
    (driveable location_0_1 location_0_2)
    (driveable location_0_2 location_0_0)
    (driveable location_0_2 location_0_1)

    ;; city_1 pairs
    (driveable location_1_0 location_1_1)
    (driveable location_1_0 location_1_2)
    (driveable location_1_1 location_1_0)
    (driveable location_1_1 location_1_2)
    (driveable location_1_2 location_1_0)
    (driveable location_1_2 location_1_1)

    ;; explicit air routes between airports (bidirectional)
    (air-route location_0_0 location_1_0)
    (air-route location_1_0 location_0_0)

    ;; initial vehicle positions
    (at-plane airplane_0 location_1_0)   ;; airplane_0 at location_1_0 (airport in city_1)
    (at-plane airplane_1 location_0_0)   ;; airplane_1 at location_0_0 (airport in city_0)

    (at-truck truck_0 location_0_1)
    (at-truck truck_1 location_1_1)

    ;; initial package positions
    (at-pkg package_0 location_1_2)
    (at-pkg package_1 location_0_2)
    (at-pkg package_2 location_0_2)
  )

  (:goal
    (and
      ;; Global goal: final package placement as mandated
      (at-pkg package_0 location_0_0)
      (at-pkg package_1 location_1_1)
      (at-pkg package_2 location_1_2)
    )
  )
)