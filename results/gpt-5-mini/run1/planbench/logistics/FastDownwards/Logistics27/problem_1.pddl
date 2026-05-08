(define (problem logistics27-problem)
  (:domain logistics-27)

  (:objects
    ;; packages
    package_0 package_1 package_2 - package

    ;; trucks (one per city as stated)
    truck_0 truck_1 - truck

    ;; airplanes (one per city as stated)
    airplane_0 airplane_1 - airplane

    ;; locations: location_<city>_<index>
    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location

    ;; cities
    city_0 city_1 - city
  )

  (:init
    ;; Vehicle positions
    (vehicle-at airplane_0 location_0_0)
    (vehicle-at airplane_1 location_1_0)
    (vehicle-at truck_0 location_0_1)
    (vehicle-at truck_1 location_1_1)

    ;; Package initial positions
    (at package_0 location_1_2)
    (at package_1 location_0_0)
    (at package_2 location_0_2)

    ;; Airports
    (airport location_0_0)
    (airport location_1_0)

    ;; Location -> city membership (explicit connectivity constraint)
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)
  )

  (:goal (and
    (at package_0 location_1_1)
    (at package_1 location_1_1)
    (at package_2 location_1_0)
  ))
)