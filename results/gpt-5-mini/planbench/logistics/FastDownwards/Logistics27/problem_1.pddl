(define (problem logistics-instance-1)
  (:domain logistics27)

  (:objects
    ;; cities
    city_0 city_1 - city

    ;; locations
    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location

    ;; trucks and airplanes
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane

    ;; packages
    package_0 package_1 package_2 - package
  )

  (:init
    ;; airports (one airport per city as specified)
    (airport location_0_0)
    (airport location_1_0)

    ;; vehicles initial positions
    (airplane-at airplane_0 location_0_0)
    (airplane-at airplane_1 location_1_0)
    (truck-at truck_0 location_0_1)
    (truck-at truck_1 location_1_1)

    ;; package initial locations (packages not inside vehicles)
    (package-at package_0 location_1_2)
    (package-at package_1 location_0_0)
    (package-at package_2 location_0_2)

    ;; location -> city membership
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)
  )

  (:goal (and
    (package-at package_0 location_1_1)
    (package-at package_1 location_1_1)
    (package-at package_2 location_1_0)
  ))
)