(define (problem Logistics11-instance)
  (:domain Logistics11)

  (:objects
    ;; packages
    package_0 package_1 package_2 - package

    ;; trucks and airplane
    truck_0 truck_1 - truck
    airplane_0 - airplane

    ;; locations (including airports)
    location_0_0 location_0_1 location_1_0 location_1_1 - location

    ;; explicit stages to enforce ordered progression per package
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 - stage
  )

  (:init
    ;; airports
    (is-airport location_0_0)
    (is-airport location_1_0)

    ;; initial vehicle positions
    (at-airplane airplane_0 location_0_0)
    (at-truck truck_0 location_0_1)
    (at-truck truck_1 location_1_0)

    ;; initial package positions
    (at-package package_0 location_1_1)
    (at-package package_1 location_0_0)
    (at-package package_2 location_0_0)

    ;; same-city connectivity (fully connected within each city)
    ;; city_0: location_0_0 <-> location_0_1
    (same-city location_0_0 location_0_1)
    (same-city location_0_1 location_0_0)

    ;; city_1: location_1_0 <-> location_1_1
    (same-city location_1_0 location_1_1)
    (same-city location_1_1 location_1_0)

    ;; air routes between airports (both directions)
    (air-route location_0_0 location_1_0)
    (air-route location_1_0 location_0_0)

    ;; successor relation for stages
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
    (succ s7 s8)
    (succ s8 s9)

    ;; initial stage for every package: s0
    (stage package_0 s0)
    (stage package_1 s0)
    (stage package_2 s0)
  )

  (:goal (and
    ;; final package locations as specified by the problem statement
    (at-package package_0 location_0_1)
    (at-package package_1 location_1_1)
    (at-package package_2 location_1_0)
  ))
)