(define (problem logistics_multiagent_problem)
  (:domain logistics_multiagent)

  (:objects
    city_0 city_1 - city

    location_0_0 location_0_1 location_1_0 location_1_1 - location

    truck_0 truck_1 - truck
    airplane_0 airplane_1 - plane

    package_0 package_1 package_2 - package

    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9
    stage_10 stage_11 stage_12 stage_13 stage_14 stage_15 stage_16 stage_17 stage_18 stage_19
    stage_20 stage_21 stage_22 stage_23 stage_24 stage_25 - stage
  )

  (:init
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)

    (is-airport location_0_0)
    (is-airport location_1_0)

    (at-plane airplane_0 location_0_0)
    (at-plane airplane_1 location_1_0)
    (at-truck truck_0 location_0_1)
    (at-truck truck_1 location_1_0)

    (at-pkg package_0 location_1_1)
    (at-pkg package_1 location_0_0)
    (at-pkg package_2 location_0_0)

    (next stage_0 stage_1)
    (next stage_1 stage_2)
    (next stage_2 stage_3)
    (next stage_3 stage_4)
    (next stage_4 stage_5)
    (next stage_5 stage_6)
    (next stage_6 stage_7)
    (next stage_7 stage_8)
    (next stage_8 stage_9)
    (next stage_9 stage_10)
    (next stage_10 stage_11)
    (next stage_11 stage_12)
    (next stage_12 stage_13)
    (next stage_13 stage_14)
    (next stage_14 stage_15)
    (next stage_15 stage_16)
    (next stage_16 stage_17)
    (next stage_17 stage_18)
    (next stage_18 stage_19)
    (next stage_19 stage_20)
    (next stage_20 stage_21)
    (next stage_21 stage_22)
    (next stage_22 stage_23)
    (next stage_23 stage_24)
    (next stage_24 stage_25)

    (cur-stage stage_0)
  )

  (:goal (and
    (at-pkg package_0 location_0_1)
    (at-pkg package_1 location_1_1)
    (at-pkg package_2 location_1_0)
  ))
)