(define (problem logistics_19_prob)
  (:domain logistics_19)
  (:objects
    package_0 - package
    truck_0 truck_1 - truck
    airplane_0 - airplane
    city_0 city_1 - city
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location
  )

  (:init
    ;; Airplane and package initial positions
    (at airplane_0 location_0_0)
    (at package_0 location_1_0)

    ;; Truck initial positions
    (at truck_0 location_0_0)
    (at truck_1 location_1_2)

    ;; Airport definitions
    (is_airport location_0_0)
    (is_airport location_1_0)

    ;; City 0 locations
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_0_2 city_0)

    ;; City 1 locations
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    (in_city location_1_2 city_1)
  )

  (:goal (at package_0 location_1_1))
)