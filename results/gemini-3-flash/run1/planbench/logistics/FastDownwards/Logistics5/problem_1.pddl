(define (problem logistics_5)
  (:domain logistics)
  (:objects
    city_0 city_1 - city
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    package_0 - package
    truck_0 truck_1 - truck
    airplane_0 - airplane
  )

  (:init
    ;; Airplane starts at the city_0 airport
    (at airplane_0 location_0_0)
    (is_airport location_0_0)

    ;; Package starts at city_0, location_0_1
    (at package_0 location_0_1)

    ;; Truck_0 is in city_0
    (at truck_0 location_0_0)
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)

    ;; Truck_1 is in city_1
    (at truck_1 location_1_1)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)

    ;; Airport definitions
    (is_airport location_1_0)
  )

  (:goal
    (at package_0 location_1_0)
  )
)