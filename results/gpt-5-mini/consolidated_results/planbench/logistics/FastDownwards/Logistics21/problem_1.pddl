(define (problem integrated_transport_problem)
  (:domain integrated_transport)

  (:objects
    ; packages
    package_0 package_1 - package

    ; trucks and airplanes
    truck_0 truck_1 - truck
    airplane_0 - airplane

    ; locations (city_0: location_0_0, location_0_1, location_0_2; city_1: location_1_0, location_1_1, location_1_2)
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location

    ; discrete stages (enough stages to sequence actions)
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9 stage_10 - stage
  )

  (:init
    ;; location types
    (road_loc location_0_0)
    (road_loc location_0_1)
    (road_loc location_0_2)
    (road_loc location_1_0)
    (road_loc location_1_1)
    (road_loc location_1_2)

    (airport_loc location_0_0)  ; airport of city_0
    (airport_loc location_1_0)  ; airport of city_1

    ;; road connectivity: all pairs within each city are directly connected (bidirectional)
    ;; city_0 connections
    (road_connected location_0_0 location_0_1)
    (road_connected location_0_1 location_0_0)
    (road_connected location_0_0 location_0_2)
    (road_connected location_0_2 location_0_0)
    (road_connected location_0_1 location_0_2)
    (road_connected location_0_2 location_0_1)

    ;; city_1 connections
    (road_connected location_1_0 location_1_1)
    (road_connected location_1_1 location_1_0)
    (road_connected location_1_0 location_1_2)
    (road_connected location_1_2 location_1_0)
    (road_connected location_1_1 location_1_2)
    (road_connected location_1_2 location_1_1)

    ;; air connectivity between city airports (bidirectional)
    (air_connected location_0_0 location_1_0)
    (air_connected location_1_0 location_0_0)

    ;; initial positions of vehicles and packages (from specification)
    (atplane airplane_0 location_0_0)
    (attruck truck_0 location_0_1)
    (attruck truck_1 location_1_0)

    (atpkg package_0 location_1_1)
    (atpkg package_1 location_1_2)

    ;; stage successor chain and initial current stage
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

    (current-stage stage_0)
  )

  (:goal (and
           (atpkg package_0 location_0_2)
           (atpkg package_1 location_0_0)
         ))
)