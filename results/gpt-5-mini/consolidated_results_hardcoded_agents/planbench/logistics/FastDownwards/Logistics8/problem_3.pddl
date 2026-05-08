(define (problem logistics-instance)
  (:domain logistics)

  (:objects
    ;; vehicles
    truck_0 truck_1 - truck
    airplane_0 - plane

    ;; packages
    package_0 package_1 - package

    ;; locations
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ;; cities (kept for completeness; connectivity encoded explicitly)
    city_0 city_1 - city

    ;; discrete stages
    day0 day1 day2 - stage
  )

  (:init
    ;; Airports
    (airport location_0_0)
    (airport location_1_0)

    ;; Initial vehicle positions
    (at-veh truck_0 location_0_0)
    (at-veh truck_1 location_1_1)
    (at-veh airplane_0 location_0_0)

    ;; Initial package positions
    (at-package package_0 location_0_0)
    (at-package package_1 location_0_0)

    ;; Truck local connectivity (bidirectional within each city)
    (same-city location_0_0 location_0_1)
    (same-city location_0_1 location_0_0)
    (same-city location_1_0 location_1_1)
    (same-city location_1_1 location_1_0)

    ;; Air connectivity between airports (bidirectional)
    (air-connected location_0_0 location_1_0)
    (air-connected location_1_0 location_0_0)

    ;; Explicit discrete stage ordering
    (succ day0 day1)
    (succ day1 day2)

    ;; Start at initial stage
    (now day0)
  )

  (:goal (and
    ;; Terminal condition: planning must reach the final stage exactly
    (now day2)

    ;; Delivery goals: both packages at location_0_1
    (at-package package_0 location_0_1)
    (at-package package_1 location_0_1)
  ))
)