(define (problem transport_problem)
  (:domain transport_domain)

  (:objects
    package_0 - package
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    city_0 city_1 - city
  )

  (:init
    (airport location_0_0)
    (airport location_1_0)

    (plane-at airplane_0 location_1_0)
    (plane-at airplane_1 location_0_0)

    (truck-at truck_0 location_0_0)
    (truck-at truck_1 location_1_1)

    (pkg-at package_0 location_1_1)

    (loc-in-city location_0_0 city_0)
    (loc-in-city location_0_1 city_0)
    (loc-in-city location_1_0 city_1)
    (loc-in-city location_1_1 city_1)
  )

  (:goal (and
    (pkg-at package_0 location_0_0)
  ))
)