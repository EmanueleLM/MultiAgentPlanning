(define (problem deliver_packages)
  (:domain transport_combined)
  (:objects
    ;; Packages
    package_0 package_1 package_2 package_3 - package

    ;; Trucks and airplanes
    truck_0 truck_1 - truck
    airplane_0 - airplane

    ;; Locations
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ;; Cities
    city_0 city_1 - city

    ;; Discrete stages (explicit timeline). The chain length bounds the plan horizon.
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 - stage
  )
  (:init
    ;; Global stages and successor relation
    (stage stage_0)
    (stage stage_1)
    (stage stage_2)
    (stage stage_3)
    (stage stage_4)
    (stage stage_5)
    (stage stage_6)
    (stage stage_7)

    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)
    (succ stage_4 stage_5)
    (succ stage_5 stage_6)
    (succ stage_6 stage_7)

    ;; Start at stage_0
    (current stage_0)

    ;; Vehicles initial locations
    (at airplane_0 location_1_0)
    (at truck_0 location_0_0)
    (at truck_1 location_1_1)

    ;; Packages initial locations (not in vehicles)
    (at package_0 location_1_0)
    (at package_1 location_1_1)
    (at package_2 location_0_0)
    (at package_3 location_0_1)

    (free package_0)
    (free package_1)
    (free package_2)
    (free package_3)

    ;; Location to city mapping
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
    (in-city location_1_0 city_1)
    (in-city location_1_1 city_1)

    ;; Airport locations
    (airport location_0_0)
    (airport location_1_0)
  )

  (:goal (and
    (at package_0 location_0_1)
    (at package_1 location_0_1)
    (at package_2 location_1_0)
    (at package_3 location_1_0)
  ))
)