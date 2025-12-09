(define (problem deliver_packages)
  (:domain logistics_integrated)

  (:objects
    ;; cities and locations
    city_0 city_1 - city
    location_0_0 location_1_0 - location

    ;; vehicles and packages
    truck_0 truck_1 - truck
    airplane_0 - airplane
    package_0 package_1 - package

    ;; discrete ordered stages (planner must progress contiguously)
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 - stage
  )

  (:init
    ;; Airports (static)
    (is_airport location_0_0)
    (is_airport location_1_0)

    ;; Location to city membership (static)
    (location_in_city location_0_0 city_0)
    (location_in_city location_1_0 city_1)

    ;; Initial positions
    (at-airplane airplane_0 location_1_0)
    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_0)

    (at-package package_0 location_1_0)
    (at-package package_1 location_1_0)

    ;; Truck-to-city static assignment (one truck per city as given by initial facts)
    (truck_belongs_to_city truck_0 city_0)
    (truck_belongs_to_city truck_1 city_1)

    ;; Stage succession chain (hard ordered progression)
    (stage_succ stage_0 stage_1)
    (stage_succ stage_1 stage_2)
    (stage_succ stage_2 stage_3)
    (stage_succ stage_3 stage_4)
    (stage_succ stage_4 stage_5)

    ;; Start stage
    (current-stage stage_0)
  )

  ;; Goal: both packages at location_0_0 and final stage reached exactly
  (:goal (and
    (at-package package_0 location_0_0)
    (at-package package_1 location_0_0)
    (current-stage stage_5)
  ))
)