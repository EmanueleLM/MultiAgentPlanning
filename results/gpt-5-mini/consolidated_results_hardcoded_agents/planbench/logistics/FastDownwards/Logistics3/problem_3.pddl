(define (problem city-logistics-instance)
  (:domain city-logistics)

  (:objects
    city_0 city_1 - city
    location_0_0 location_1_0 - location
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    package_0 package_1 - package
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 - stage
  )

  (:init
    ;; City membership
    (in-city location_0_0 city_0)
    (in-city location_1_0 city_1)

    ;; Airports
    (airport location_0_0)
    (airport location_1_0)

    ;; Air routes (both directions)
    (air-route location_0_0 location_1_0)
    (air-route location_1_0 location_0_0)

    ;; Stage ordering
    (succ stage0 stage1)
    (succ stage1 stage2)
    (succ stage2 stage3)
    (succ stage3 stage4)
    (succ stage4 stage5)
    (succ stage5 stage6)

    ;; Start stage
    (current-stage stage0)

    ;; Initial vehicle positions
    (at-airplane airplane_0 location_0_0)
    (at-airplane airplane_1 location_0_0)
    (at-truck truck_0 location_0_0)
    (at-truck truck_1 location_1_0)

    ;; Initial package positions
    (at-package package_0 location_1_0)
    (at-package package_1 location_1_0)
  )

  (:goal (and
    (at-package package_0 location_1_0)
    (at-package package_1 location_0_0)
  ))
)