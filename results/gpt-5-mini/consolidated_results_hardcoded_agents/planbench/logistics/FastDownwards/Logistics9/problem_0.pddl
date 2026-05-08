(define (problem deliver_packages_instance)
  (:domain orchestrator_transport)

  (:objects
    city_0 city_1 - city

    location_0_0 location_0_1 location_1_0 location_1_1 - location

    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    package_0 package_1 - package
  )

  (:init
    ;; location to city membership
    (location_in_city location_0_0 city_0)
    (location_in_city location_0_1 city_0)
    (location_in_city location_1_0 city_1)
    (location_in_city location_1_1 city_1)

    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; initial vehicle locations
    (truck_at truck_0 location_0_0)
    (truck_at truck_1 location_1_0)
    (airplane_at airplane_0 location_1_0)
    (airplane_at airplane_1 location_0_0)

    ;; initial package locations
    (package_at package_0 location_0_0)
    (package_at package_1 location_1_1)
  )

  (:goal (and
    (package_at package_0 location_0_1)
    (package_at package_1 location_1_0)
  ))
)