(define (problem transport_problem)
  (:domain multiagent_transport)

  (:objects
    ;; cities
    city_0 city_1 - city

    ;; locations: three per city
    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location

    ;; vehicles
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane

    ;; packages
    package_0 package_1 package_2 - package
  )

  (:init
    ;; city membership of locations (provided)
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)

    ;; airports (provided)
    (is-airport location_0_0)
    (is-airport location_1_0)

    ;; airplane initial positions (provided)
    (at-airplane airplane_0 location_1_0)
    (at-airplane airplane_1 location_0_0)

    ;; package initial positions (provided)
    (at-package package_0 location_1_2)
    (at-package package_1 location_0_2)
    (at-package package_2 location_0_2)

    ;; truck initial positions (provided)
    (at-truck truck_0 location_0_1)
    (at-truck truck_1 location_1_1)

    ;; truck assigned city (enforces trucks operate only within a single city)
    (truck-in-city truck_0 city_0)
    (truck-in-city truck_1 city_1)

    ;; explicit city-difference facts to enforce flights between different cities
    (diff-city city_0 city_1)
    (diff-city city_1 city_0)
  )

  (:goal
    (and
      ;; global goals (must be satisfied exactly)
      (at-package package_0 location_0_0)
      (at-package package_1 location_1_1)
      (at-package package_2 location_1_2)
    )
  )
)