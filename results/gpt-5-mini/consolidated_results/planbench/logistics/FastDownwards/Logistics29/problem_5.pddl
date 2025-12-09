(define (problem logistics_problem)
  (:domain logistics_combined)

  (:objects
    ; cities
    city_0 city_1 - city

    ; locations
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location

    ; vehicles
    truck_0 truck_1 - truck
    airplane_0 - airplane

    ; packages
    package_0 package_1 package_2 package_3 - package

    ; discrete stages: provide 31 stages to allow up to 30 actions (stage_0 .. stage_30)
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9
    stage_10 stage_11 stage_12 stage_13 stage_14 stage_15 stage_16 stage_17 stage_18 stage_19
    stage_20 stage_21 stage_22 stage_23 stage_24 stage_25 stage_26 stage_27 stage_28 stage_29
    stage_30 - stage
  )

  (:init
    ; airports
    (airport location_0_0)
    (airport location_1_0)

    ; location -> city membership
    (in_city location_0_0 city_0)
    (in_city location_0_1 city_0)
    (in_city location_0_2 city_0)
    (in_city location_1_0 city_1)
    (in_city location_1_1 city_1)
    (in_city location_1_2 city_1)

    ; initial vehicle positions
    (at-airplane airplane_0 location_1_0)
    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_2)

    ; initial package locations (packages are at locations and not in any vehicle)
    (at-p package_0 location_0_1)
    (at-p package_1 location_1_0)
    (at-p package_2 location_0_1)
    (at-p package_3 location_0_0)

    ; explicit cross-city facts to require flights between different cities
    (diff-city city_0 city_1)
    (diff-city city_1 city_0)

    ; stage ordering (succ) and initial current-stage
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
    (succ stage_12 stage_13)
    (succ stage_13 stage_14)
    (succ stage_14 stage_15)
    (succ stage_15 stage_16)
    (succ stage_16 stage_17)
    (succ stage_17 stage_18)
    (succ stage_18 stage_19)
    (succ stage_19 stage_20)
    (succ stage_20 stage_21)
    (succ stage_21 stage_22)
    (succ stage_22 stage_23)
    (succ stage_23 stage_24)
    (succ stage_24 stage_25)
    (succ stage_25 stage_26)
    (succ stage_26 stage_27)
    (succ stage_27 stage_28)
    (succ stage_28 stage_29)
    (succ stage_29 stage_30)

    (current-stage stage_0)
  )

  (:goal (and
    (at-p package_0 location_1_2)
    (at-p package_1 location_0_1)
    (at-p package_2 location_1_2)
    (at-p package_3 location_0_2)
  ))
)