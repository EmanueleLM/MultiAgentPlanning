(define (problem transport_problem)
  (:domain transport_domain)

  (:objects
    package_0 - package
    truck_0 truck_1 - truck
    airplane_0 airplane_1 - airplane
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    city_0 city_1 - city
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 - stage
  )

  (:init
    ;; airports
    (airport location_0_0)
    (airport location_1_0)

    ;; airplane locations
    (plane-at airplane_0 location_1_0)
    (plane-at airplane_1 location_0_0)

    ;; truck locations
    (truck-at truck_0 location_0_0)
    (truck-at truck_1 location_1_1)

    ;; package initial location
    (pkg-at package_0 location_1_1)

    ;; location membership
    (loc-in-city location_0_0 city_0)
    (loc-in-city location_0_1 city_0)
    (loc-in-city location_1_0 city_1)
    (loc-in-city location_1_1 city_1)

    ;; stage ordering (explicit discrete time progression)
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)
    (succ stage_4 stage_5)
    (succ stage_5 stage_6)

    ;; initial active stage
    (current stage_0)
  )

  (:goal (and
    (pkg-at package_0 location_0_0)
  ))
)