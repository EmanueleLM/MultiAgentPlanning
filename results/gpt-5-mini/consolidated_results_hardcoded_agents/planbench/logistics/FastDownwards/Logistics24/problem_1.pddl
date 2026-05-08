(define (problem logistics_orchestrated_problem)
  (:domain logistics_orchestrated)

  (:objects
    ; Packages
    package_0 package_1 package_2 - package

    ; Trucks (one per city as per environment)
    truck_0 truck_1 - truck

    ; Airplanes
    airplane_0 - airplane

    ; Locations (each city has three locations)
    location_0_0 location_0_1 location_0_2 location_1_0 location_1_1 location_1_2 - location

    ; Cities
    city_0 city_1 - city

    ; Discrete stages (time horizon large enough to cover required steps)
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9
    stage_10 stage_11 stage_12 stage_13 stage_14 stage_15 stage_16 stage_17 stage_18 stage_19 stage_20 - stage
  )

  (:init
    ; Location to city mapping (as given)
    (loc-in-city location_0_0 city_0)
    (loc-in-city location_0_1 city_0)
    (loc-in-city location_0_2 city_0)
    (loc-in-city location_1_0 city_1)
    (loc-in-city location_1_1 city_1)
    (loc-in-city location_1_2 city_1)

    ; Airports: exactly the ones specified in the human statement
    (airport location_0_0)
    (airport location_1_0)

    ; Vehicles initial positions (exact facts as provided)
    (at-airplane airplane_0 location_1_0)
    (at-truck truck_0 location_0_2)
    (at-truck truck_1 location_1_2)

    ; Packages initial positions (exact facts as provided)
    (at-package package_0 location_1_2)
    (at-package package_1 location_0_1)
    (at-package package_2 location_1_1)

    ; Stage ordering (succ chain)
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

    ; Start at stage_0 (global current-stage token)
    (current-stage stage_0)
  )

  (:goal (and
    ; Terminal conditions required exactly by the user's goal
    (at-package package_0 location_1_0)
    (at-package package_1 location_1_0)
    (at-package package_2 location_1_2)
  ))
)