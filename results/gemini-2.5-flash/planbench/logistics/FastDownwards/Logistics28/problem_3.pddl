(define (problem logistics-28)
  (:domain logistics)
  (:objects
    package_0 package_1 package_2 package_3 - package
    truck_0 truck_1 - truck
    airplane_0 - airplane
    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location
    city_0 city_1 - city
  )
  (:init
    ;; Airport definitions
    (is_airport location_0_0)
    (is_airport location_1_0)

    ;; Airplane location
    (at airplane_0 location_1_0)

    ;; Package locations
    (at package_0 location_1_2)
    (at package_1 location_0_0)
    (at package_2 location_0_2)
    (at package_3 location_1_1)

    ;; Truck locations
    (at truck_0 location_0_1)
    (at truck_1 location_1_1)

    ;; Location to city mapping
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_0_2 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    (in_city location_1_2 city_1)

    ;; Truck to city mapping (each city has exactly one truck)
    (truck_in_city truck_0 city_0)
    (truck_in_city truck_1 city_1)
  )
  (:goal
    (and
      (at package_0 location_1_1)
      (at package_1 location_1_0)
      (at package_2 location_0_0)
      (at package_3 location_0_2)
    )
  )
)