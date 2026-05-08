(define (problem city_logistics_problem)
  (:domain city_logistics)

  (:objects
    ;; cities
    city_0 city_1 - city

    ;; locations and airports
    location_0_0 location_1_0 - location
    location_0_0 - airport
    location_1_0 - airport

    ;; vehicles
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane

    ;; packages
    package_0 package_1 - package
  )

  (:init
    ;; membership
    (city city_0)
    (city city_1)
    (location location_0_0)
    (location location_1_0)
    (airport location_0_0)
    (airport location_1_0)
    (in_city location_0_0 city_0)
    (in_city location_1_0 city_1)

    (truck truck_0)
    (truck truck_1)
    (airplane airplane_0)
    (airplane airplane_1)
    (package package_0)
    (package package_1)

    ;; truck assignments
    (truck_assigned_to_city truck_0 city_0)
    (truck_assigned_to_city truck_1 city_1)

    ;; connectivity: air routes are bidirectional
    (air_route location_0_0 location_1_0)
    (air_route location_1_0 location_0_0)

    ;; connected_by_truck: empty set (no intra-city edges) -- intentionally omitted

    ;; initial locations (vehicles and packages)
    (at_vehicle airplane_0 location_0_0)
    (at_vehicle airplane_1 location_0_0)
    (at_vehicle truck_0 location_0_0)
    (at_vehicle truck_1 location_1_0)

    (at_package package_0 location_1_0)
    (at_package package_1 location_1_0)

    ;; package_at initial facts (maintained explicitly to reflect the auditor's unified view)
    (package_at package_0 location_1_0)
    (package_at package_1 location_1_0)
  )

  ;; Goal: per auditor recommendation use package_at(p,l)
  (:goal (and
    (package_at package_0 location_1_0)
    (package_at package_1 location_0_0)
  ))
)