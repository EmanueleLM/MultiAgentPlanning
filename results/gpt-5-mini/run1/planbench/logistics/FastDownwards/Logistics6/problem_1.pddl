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
    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; airplane initial locations
    (at_airplane airplane_0 location_1_0)
    (at_airplane airplane_1 location_0_0)

    ;; package initial ground location
    (at_package package_0 location_1_1)

    ;; trucks initial locations
    (at_truck truck_0 location_0_0)
    (at_truck truck_1 location_1_1)

    ;; location -> city membership facts
    (location_in_city location_0_0 city_0)
    (location_in_city location_0_1 city_0)
    (location_in_city location_1_0 city_1)
    (location_in_city location_1_1 city_1)
  )

  (:goal (and
    ;; Global goal: package_0 at location_0_0
    (at_package package_0 location_0_0)
  ))
)