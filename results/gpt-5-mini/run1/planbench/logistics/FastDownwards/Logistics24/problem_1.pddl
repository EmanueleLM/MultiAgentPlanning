(define (problem transport_problem)
  (:domain transport_domain)

  (:objects
    ;; packages
    package_0 package_1 package_2 - package

    ;; vehicles
    truck_0 truck_1 - truck
    airplane_0 - airplane

    ;; cities
    city_0 city_1 - city

    ;; locations in city_0
    location_0_0 location_0_1 location_0_2 - location
    ;; locations in city_1
    location_1_0 location_1_1 location_1_2 - location
  )

  (:init
    ;; location to city relations
    (loc_in_city location_0_0 city_0)
    (loc_in_city location_0_1 city_0)
    (loc_in_city location_0_2 city_0)

    (loc_in_city location_1_0 city_1)
    (loc_in_city location_1_1 city_1)
    (loc_in_city location_1_2 city_1)

    ;; airports (exactly those specified)
    (is_airport location_0_0)
    (is_airport location_1_0)

    ;; initial positions of vehicles
    (at airplane_0 location_1_0)
    (at truck_0 location_0_2)
    (at truck_1 location_1_2)

    ;; initial positions of packages (packages start at locations, not in vehicles)
    (at package_0 location_1_2)
    (at package_1 location_0_1)
    (at package_2 location_1_1)
  )

  (:goal (and
    (at package_0 location_1_0)
    (at package_1 location_1_0)
    (at package_2 location_1_2)
  ))
)