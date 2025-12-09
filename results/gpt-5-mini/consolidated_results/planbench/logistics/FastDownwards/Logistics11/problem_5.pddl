(define (problem Logistics11-instance)
  (:domain Logistics11)

  (:objects
    package_0 package_1 package_2 - package
    truck_0 truck_1 - truck
    airplane_0 - airplane
    location_0_0 location_0_1 location_1_0 location_1_1 - location
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 - stage
  )

  (:init
    ;; airports
    (is-airport location_0_0)
    (is-airport location_1_0)

    ;; initial vehicle positions
    (at-airplane airplane_0 location_0_0)
    (at-truck truck_0 location_0_1)
    (at-truck truck_1 location_1_0)

    ;; initial package positions (packages not in vehicles)
    (at-package package_0 location_1_1)
    (at-package package_1 location_0_0)
    (at-package package_2 location_0_0)

    ;; same-city connectivity (explicit facts; trucks may move only within these)
    (same-city location_0_0 location_0_1)
    (same-city location_0_1 location_0_0)
    (same-city location_1_0 location_1_1)
    (same-city location_1_1 location_1_0)

    ;; air routes between airports (explicit; airplanes may fly only on these)
    (air-route location_0_0 location_1_0)
    (air-route location_1_0 location_0_0)

    ;; linear successor relation for discrete global stages
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)
    (succ s15 s16) (succ s16 s17) (succ s17 s18)

    ;; unique initial current stage
    (current s0)
  )

  (:goal (and
    (at-package package_0 location_0_1)
    (at-package package_1 location_1_1)
    (at-package package_2 location_1_0)
  ))
)