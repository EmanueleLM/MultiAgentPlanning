(define (problem deliver_packages_instance)
  (:domain orchestrator_transport)

  (:objects
    city_0 city_1 - city

    location_0_0 location_0_1 location_1_0 location_1_1 - location

    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    package_0 package_1 - package

    ;; explicit discrete stages: provide enough ordered stages for the required ordering.
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 - stage
  )

  (:init
    ;; location to city membership
    (location_in_city location_0_0 city_0)
    (location_in_city location_0_1 city_0)
    (location_in_city location_1_0 city_1)
    (location_in_city location_1_1 city_1)

    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; initial vehicle locations
    (truck_at truck_0 location_0_0)
    (truck_at truck_1 location_1_0)
    (airplane_at airplane_0 location_1_0)
    (airplane_at airplane_1 location_0_0)

    ;; initial package locations
    (package_at package_0 location_0_0)
    (package_at package_1 location_1_1)

    ;; stage ordering relation (explicit successor links)
    (next stage0 stage1)
    (next stage1 stage2)
    (next stage2 stage3)
    (next stage3 stage4)
    (next stage4 stage5)
    (next stage5 stage6)
    (next stage6 stage7)

    ;; initial current stage
    (current_stage stage0)
  )

  (:goal (and
    (package_at package_0 location_0_1)
    (package_at package_1 location_1_0)
  ))
)