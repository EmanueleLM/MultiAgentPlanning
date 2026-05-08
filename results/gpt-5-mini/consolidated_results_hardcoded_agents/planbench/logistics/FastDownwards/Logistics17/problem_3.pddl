(define (problem logistics17-prob)
  (:domain logistics17)
  (:objects
    ; packages
    package_0 package_1 package_2 package_3 - package

    ; trucks (one per city)
    truck_0 truck_1 - truck

    ; airplanes (two as given in the specification)
    airplane_0 airplane_1 - airplane

    ; locations
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ; cities
    city_0 city_1 - city

    ; explicit stages to enforce ordered, contiguous progression (consume one stage per action)
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9 stage_10 stage_11 stage_12 - stage
  )

  (:init
    ;; City membership of locations
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)

    ;; Airports
    (is-airport location_0_0)
    (is-airport location_1_0)

    ;; Vehicles initial positions (both airplanes are at location_1_0 per specification)
    (at-airplane airplane_0 location_1_0)
    (at-airplane airplane_1 location_1_0)

    (at-truck truck_0 location_0_1)
    (at-truck truck_1 location_1_1)

    ;; Packages initial positions
    (at-package package_0 location_0_1)
    (at-package package_1 location_1_1)
    (at-package package_2 location_1_0)
    (at-package package_3 location_1_1)

    ;; Stage ordering (succ chain) and initial current stage
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)
    (succ stage_4 stage_5)
    (succ stage_5 stage_6)
    (succ stage_6 stage_7)
    (succ stage_7 stage_8)
    (succ stage_8 stage_9)
    (succ stage_9 stage_10)
    (succ stage_10 stage_11)
    (succ stage_11 stage_12)

    (current-stage stage_0)
  )

  (:goal (and
    (at-package package_0 location_0_0)
    (at-package package_1 location_1_0)
    (at-package package_2 location_0_1)
    (at-package package_3 location_1_1)
  ))
)