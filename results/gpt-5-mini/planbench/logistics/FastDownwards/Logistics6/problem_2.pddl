(define (problem transport_problem)
  (:domain transport_domain)

  (:objects
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    package_0 - package
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    city_0 city_1 - city
  )

  (:init
    ;; Airports
    (airport location_0_0)
    (airport location_1_0)

    ;; Airplanes initial locations
    (at-airplane airplane_0 location_1_0)
    (at-airplane airplane_1 location_0_0)

    ;; Trucks initial locations
    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_1)

    ;; Package initial location
    (at-package package_0 location_1_1)

    ;; Location membership to cities
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)
  )

  (:goal
    (and
      ;; Global goal: package_0 is at location_0_0 (physically at that location, not inside a vehicle)
      (at-package package_0 location_0_0)
    )
  )
)