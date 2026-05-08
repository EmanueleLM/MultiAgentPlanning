(define (problem deliver_packages)
  (:domain transport_combined)
  (:objects
    package_0 package_1 package_2 package_3 - package
    truck_0 truck_1 - truck
    airplane_0 - airplane
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    city_0 city_1 - city
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9 stage_10 stage_11 stage_12 stage_13 stage_14 stage_15 stage_16 stage_17 stage_18 stage_19 stage_20 stage_21 stage_22 - stage
  )
  (:init
    ;; stage ordering
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

    (current stage_0)

    ;; initial positions
    (at airplane_0 location_1_0)
    (at truck_0 location_0_0)
    (at truck_1 location_1_1)

    (at package_0 location_1_0)
    (at package_1 location_1_1)
    (at package_2 location_0_0)
    (at package_3 location_0_1)

    ;; city membership
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)

    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; different location facts (ordered pairs where locations are not identical)
    (different location_0_0 location_0_1)
    (different location_0_0 location_1_0)
    (different location_0_0 location_1_1)
    (different location_0_1 location_0_0)
    (different location_0_1 location_1_0)
    (different location_0_1 location_1_1)
    (different location_1_0 location_0_0)
    (different location_1_0 location_0_1)
    (different location_1_0 location_1_1)
    (different location_1_1 location_0_0)
    (different location_1_1 location_0_1)
    (different location_1_1 location_1_0)
  )
  (:goal (and
    (at package_0 location_0_1)
    (at package_1 location_0_1)
    (at package_2 location_1_0)
    (at package_3 location_1_0)
  ))
)