(define (problem integrated_transport_problem)
  (:domain integrated_transport)

  (:objects
    package_0 package_1 - package

    truck_0 truck_1 - truck
    airplane_0 - airplane

    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location

    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9
    stage_10 stage_11 stage_12 stage_13 stage_14 stage_15 stage_16 stage_17 stage_18 stage_19
    stage_20 stage_21 stage_22 stage_23 stage_24 stage_25 - stage
  )

  (:init
    (road_loc location_0_0)
    (road_loc location_0_1)
    (road_loc location_0_2)
    (road_loc location_1_0)
    (road_loc location_1_1)
    (road_loc location_1_2)

    (airport_loc location_0_0)
    (airport_loc location_1_0)

    (road_connected location_0_0 location_0_1)
    (road_connected location_0_1 location_0_0)
    (road_connected location_0_0 location_0_2)
    (road_connected location_0_2 location_0_0)
    (road_connected location_0_1 location_0_2)
    (road_connected location_0_2 location_0_1)

    (road_connected location_1_0 location_1_1)
    (road_connected location_1_1 location_1_0)
    (road_connected location_1_0 location_1_2)
    (road_connected location_1_2 location_1_0)
    (road_connected location_1_1 location_1_2)
    (road_connected location_1_2 location_1_1)

    (air_connected location_0_0 location_1_0)
    (air_connected location_1_0 location_0_0)

    (atplane airplane_0 location_0_0)
    (attruck truck_0 location_0_1)
    (attruck truck_1 location_1_0)

    (atpkg package_0 location_1_1)
    (atpkg package_1 location_1_2)

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

    (current-stage stage_0)
  )

  (:goal (and
           (atpkg package_0 location_0_2)
           (atpkg package_1 location_0_0)
         ))
)