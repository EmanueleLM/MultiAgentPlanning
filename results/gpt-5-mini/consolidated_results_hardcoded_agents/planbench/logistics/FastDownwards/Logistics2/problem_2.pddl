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

    ;; discrete stages: fixed ordered chain of stages the planner must traverse
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 - stage
  )

  (:init
    ;; Airports
    (is_airport location_0_0)
    (is_airport location_1_0)

    ;; Location-city membership
    (location_in_city location_0_0 city_0)
    (location_in_city location_1_0 city_1)

    ;; Initial positions of vehicles and packages (explicit per-type at predicates)
    (at-airplane airplane_0 location_1_0)
    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_0)

    (at-package package_0 location_1_0)
    (at-package package_1 location_1_0)

    ;; Trucks static assignment to their cities (one truck per city)
    (truck_belongs_to_city truck_0 city_0)
    (truck_belongs_to_city truck_1 city_1)

    ;; Stage succession chain (hard ordered progression)
    (stage_succ stage_0 stage_1)
    (stage_succ stage_1 stage_2)
    (stage_succ stage_2 stage_3)
    (stage_succ stage_3 stage_4)
    (stage_succ stage_4 stage_5)

    ;; Start at the first stage
    (current-stage stage_0)
  )

  ;; Goal: both packages must be at location_0_0 AND the plan must have advanced to the terminal stage
  (:goal (and
    (at-package package_0 location_0_0)
    (at-package package_1 location_0_0)
    (current-stage stage_5)
  ))
)