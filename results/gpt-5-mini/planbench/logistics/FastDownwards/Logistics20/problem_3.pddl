(define (problem logistics20-problem)
  (:domain logistics20)

  (:objects
    city_0 city_1 - city

    location_0_0 location_0_1 location_0_2
    location_1_0 location_1_1 location_1_2 - location

    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane

    package_0 - package
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; airplanes at their airports
    (at-plane airplane_0 location_0_0)
    (at-plane airplane_1 location_1_0)

    ;; trucks at their initial locations
    (at-truck truck_0 location_0_1)
    (at-truck truck_1 location_1_0)

    ;; package initial location
    (at-package package_0 location_1_1)

    ;; location -> city membership
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_0_2 city_0)

    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
    (in-city location_1_2 city_1)

    ;; explicit flight routes between the two airports (both directions)
    (flight-route location_0_0 location_1_0)
    (flight-route location_1_0 location_0_0)
  )

  (:goal
    (and
      (at-package package_0 location_1_2)
    )
  )
)