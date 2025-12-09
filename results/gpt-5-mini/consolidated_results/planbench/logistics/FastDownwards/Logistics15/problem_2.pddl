(define (problem logistics-instance-1)
  (:domain logistics-ns)

  (:objects
    ;; trucks and plane
    truck_0 truck_1 - truck
    airplane_0 - plane

    ;; packages
    package_0 package_1 package_2 package_3 - package

    ;; locations: location_C_L where first index is city, second is local index
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ;; cities
    city_0 city_1 - city

    ;; explicit discrete stages for linear time progression (extended to allow sufficient actions)
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9
    stage_10 stage_11 stage_12 stage_13 stage_14 stage_15 stage_16 stage_17 stage_18 stage_19
    stage_20 stage_21 stage_22 stage_23 stage_24 stage_25 stage_26 stage_27 stage_28 stage_29 - stage
  )

  (:init
    ;; (informational) type predicates
    (truck truck_0)
    (truck truck_1)
    (plane airplane_0)
    (package package_0)
    (package package_1)
    (package package_2)
    (package package_3)
    (location location_0_0)
    (location location_0_1)
    (location location_1_0)
    (location location_1_1)
    (city city_0)
    (city city_1)
    (stage stage_0)
    (stage stage_1)
    (stage stage_2)
    (stage stage_3)
    (stage stage_4)
    (stage stage_5)
    (stage stage_6)
    (stage stage_7)
    (stage stage_8)
    (stage stage_9)
    (stage stage_10)
    (stage stage_11)
    (stage stage_12)
    (stage stage_13)
    (stage stage_14)
    (stage stage_15)
    (stage stage_16)
    (stage stage_17)
    (stage stage_18)
    (stage stage_19)
    (stage stage_20)
    (stage stage_21)
    (stage stage_22)
    (stage stage_23)
    (stage stage_24)
    (stage stage_25)
    (stage stage_26)
    (stage stage_27)
    (stage stage_28)
    (stage stage_29)

    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; location -> city membership
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)

    ;; initial positions of vehicles
    (at-plane airplane_0 location_0_0)
    (at-truck truck_0 location_0_1)
    (at-truck truck_1 location_1_1)

    ;; initial package locations (no package starts inside any vehicle)
    (at-pack package_0 location_1_1)
    (at-pack package_1 location_1_0)
    (at-pack package_2 location_1_1)
    (at-pack package_3 location_0_0)

    ;; discrete time next relations (linear chain)
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
    (next stage_25 stage_26)
    (next stage_26 stage_27)
    (next stage_27 stage_28)
    (next stage_28 stage_29)

    ;; start at stage_0; every action consumes the current-stage and advances to its successor
    (current-stage stage_0)
  )

  (:goal (and
    ;; terminal conditions required exactly as specified
    (at-pack package_0 location_0_0)
    (at-pack package_1 location_1_1)
    (at-pack package_2 location_0_1)
    (at-pack package_3 location_1_1)
  ))
)