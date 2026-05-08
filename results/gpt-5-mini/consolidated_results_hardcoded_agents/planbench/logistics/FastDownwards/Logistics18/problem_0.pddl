(define (problem deliver_package_0)
  (:domain cargo_orchestrator)

  (:objects
    ; cities
    city_0 city_1 - city

    ; locations (each city has three locations; one per city is the airport)
    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location

    ; vehicles and packages
    truck_0 truck_1 - truck
    airplane_0 - airplane
    package_0 - package
  )

  (:init
    ; --- static city membership
    (location-in-city location_0_0 city_0)
    (location-in-city location_0_1 city_0)
    (location-in-city location_0_2 city_0)

    (location-in-city location_1_0 city_1)
    (location-in-city location_1_1 city_1)
    (location-in-city location_1_2 city_1)

    ; --- airports (one per city as specified)
    (airport location_0_0)
    (airport location_1_0)

    ; --- truck ownership: exactly one truck per city (static)
    (truck-of-city truck_0 city_0)
    (truck-of-city truck_1 city_1)

    ; --- initial dynamic state
    (truck-at truck_0 location_0_2)
    (truck-at truck_1 location_1_0)

    (airplane-at airplane_0 location_1_0)

    (pkg-at package_0 location_0_1)
    (pkg-free package_0)
  )

  (:goal (and
    (pkg-at package_0 location_1_2)
  ))
)