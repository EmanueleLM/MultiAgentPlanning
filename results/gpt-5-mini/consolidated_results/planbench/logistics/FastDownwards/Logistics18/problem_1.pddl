(define (problem deliver_package_0)
  (:domain cargo_orchestrator)

  (:objects
    city_0 city_1 - city

    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location

    truck_0 truck_1 - truck
    airplane_0 - airplane
    package_0 - package
  )

  (:init
    (location-in-city location_0_0 city_0)
    (location-in-city location_0_1 city_0)
    (location-in-city location_0_2 city_0)

    (location-in-city location_1_0 city_1)
    (location-in-city location_1_1 city_1)
    (location-in-city location_1_2 city_1)

    (airport location_0_0)
    (airport location_1_0)

    (truck-of-city truck_0 city_0)
    (truck-of-city truck_1 city_1)

    (truck-at truck_0 location_0_2)
    (truck-at truck_1 location_1_0)

    (airplane-at airplane_0 location_1_0)

    (pkg-at package_0 location_0_1)
  )

  (:goal (and
    (pkg-at package_0 location_1_2)
  ))
)