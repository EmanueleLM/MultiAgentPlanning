(define (problem transport_problem)
  (:domain transport_domain)
  (:objects
    ;; trucks
    truck_0 truck_1 - truck
    ;; airplanes
    airplane_0 airplane_1 - airplane
    ;; packages
    package_0 package_1 - package
    ;; locations (city_0: location_0_0, location_0_1, location_0_2; city_1: location_1_0, location_1_1, location_1_2)
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
    ;; cities
    city_0 city_1 - city
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; in-city assignments
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)

    ;; initial vehicle locations (from human specification)
    (at-plane airplane_0 location_1_0)
    (at-plane airplane_1 location_1_0)
    (at-truck truck_0 location_0_2)
    (at-truck truck_1 location_1_2)

    ;; initial package locations (start positions)
    (at-package package_0 location_1_2)
    (at-package package_1 location_0_1)

    ;; roads: trucks can drive between any two distinct locations inside the same city.
    ;; city_0 roads (directed)
    (road location_0_0 location_0_1)
    (road location_0_0 location_0_2)
    (road location_0_1 location_0_0)
    (road location_0_1 location_0_2)
    (road location_0_2 location_0_0)
    (road location_0_2 location_0_1)

    ;; city_1 roads (directed)
    (road location_1_0 location_1_1)
    (road location_1_0 location_1_2)
    (road location_1_1 location_1_0)
    (road location_1_1 location_1_2)
    (road location_1_2 location_1_0)
    (road location_1_2 location_1_1)

    ;; air routes: between airports (both directions)
    (air-route location_0_0 location_1_0)
    (air-route location_1_0 location_0_0)
  )

  (:goal
    (and
      (at-package package_0 location_1_1)
      (at-package package_1 location_1_0)
    )
  )
)