(define (problem logistics-instance)
  (:domain logistics)

  (:objects
    truck_0 truck_1 - truck
    airplane_0 - plane
    package_0 package_1 - package
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    city_0 city_1 - city
    day0 day1 day2 - day
  )

  (:init
    ;; Airports as stated
    (airport location_0_0)
    (airport location_1_0)

    ;; Initial vehicle locations
    (at truck_0 location_0_0)
    (at truck_1 location_1_1)
    (at airplane_0 location_0_0)

    ;; Initial package locations
    (at package_0 location_0_0)
    (at package_1 location_0_0)

    ;; Truck connectivity within each city (bidirectional encoding)
    (same-city location_0_0 location_0_1)
    (same-city location_0_1 location_0_0)
    (same-city location_1_0 location_1_1)
    (same-city location_1_1 location_1_0)

    ;; Air connectivity between airports (bidirectional)
    (air-connected location_0_0 location_1_0)
    (air-connected location_1_0 location_0_0)

    ;; Discrete stage ordering
    (succ day0 day1)
    (succ day1 day2)

    ;; Starting stage
    (now day0)
  )

  (:goal (and
    ;; Terminal stage requirement must be satisfied exactly
    (now day2)

    ;; Delivery goals
    (at package_0 location_0_1)
    (at package_1 location_0_1)
  ))
)