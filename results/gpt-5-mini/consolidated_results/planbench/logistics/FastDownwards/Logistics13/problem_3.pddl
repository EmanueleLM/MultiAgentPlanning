(define (problem transport_problem)
  (:domain multi_transport)

  (:objects
    ;; cities
    city_0 city_1 - city

    ;; locations
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ;; vehicles
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane

    ;; packages
    package_0 package_1 package_2 - package
  )

  (:init
    ;; Vehicles initial positions
    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_1)
    (at-plane airplane_0 location_1_0)
    (at-plane airplane_1 location_0_0)

    ;; Packages initial locations
    (at-pkg package_0 location_1_0)
    (at-pkg package_1 location_1_1)
    (at-pkg package_2 location_0_0)

    ;; City membership for each location
    (loc-in-city location_0_0 city_0)
    (loc-in-city location_0_1 city_0)
    (loc-in-city location_1_0 city_1)
    (loc-in-city location_1_1 city_1)

    ;; Each city has a designated airport location (explicit mapping)
    (city-airport city_0 location_0_0)
    (city-airport city_1 location_1_0)

    ;; Exactly one truck per city: assign trucks to their city (static)
    (truck-assigned truck_0 city_0)
    (truck-assigned truck_1 city_1)

    ;; Distinctness facts for locations (ordered pairs where locations differ)
    (distinct-loc location_0_0 location_0_1)
    (distinct-loc location_0_0 location_1_0)
    (distinct-loc location_0_0 location_1_1)
    (distinct-loc location_0_1 location_0_0)
    (distinct-loc location_0_1 location_1_0)
    (distinct-loc location_0_1 location_1_1)
    (distinct-loc location_1_0 location_0_0)
    (distinct-loc location_1_0 location_0_1)
    (distinct-loc location_1_0 location_1_1)
    (distinct-loc location_1_1 location_0_0)
    (distinct-loc location_1_1 location_0_1)
    (distinct-loc location_1_1 location_1_0)

    ;; Distinctness facts for cities (ordered pairs where cities differ)
    (distinct-city city_0 city_1)
    (distinct-city city_1 city_0)
  )

  (:goal
    (and
      (at-pkg package_0 location_0_1)
      (at-pkg package_1 location_0_1)
      (at-pkg package_2 location_0_1)
    )
  )
)