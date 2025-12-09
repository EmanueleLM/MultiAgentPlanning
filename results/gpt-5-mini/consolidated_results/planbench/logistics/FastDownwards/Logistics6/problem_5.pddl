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

    ;; airplane initial positions
    (plane-at airplane_0 location_1_0)
    (plane-at airplane_1 location_0_0)

    ;; truck initial positions
    (truck-at truck_0 location_0_0)
    (truck-at truck_1 location_1_1)

    ;; package initial position
    (pkg-at package_0 location_1_1)

    ;; location membership to cities
    (loc-in-city location_0_0 city_0)
    (loc-in-city location_0_1 city_0)
    (loc-in-city location_1_0 city_1)
    (loc-in-city location_1_1 city_1)

    ;; truck-to-city mapping (explicit constraint used by drive/load/unload)
    (truck-in-city truck_0 city_0)
    (truck-in-city truck_1 city_1)

    ;; identity predicates to namespace actions to specific vehicles
    (is-truck0 truck_0)
    (is-truck1 truck_1)
    (is-plane0 airplane_0)
    (is-plane1 airplane_1)

    ;; discrete stage ordering (forces contiguous progression)
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)
    (succ stage_4 stage_5)
    (succ stage_5 stage_6)

    ;; initial active stage
    (current stage_0)
  )

  (:goal
    (and
      (pkg-at package_0 location_0_0)
    )
  )
)