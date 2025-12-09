(define (problem transport-multimodal-problem)
  (:domain transport-multimodal)

  (:objects
    ;; cargo
    c1 - cargo

    ;; trucks and airplane
    t1 t2 - truck
    p1 - airplane

    ;; locations: cities and airports (all typed as location)
    city1 city2 airport1 airport2 - location

    ;; stages to enforce strict sequential progression
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 - stage
  )

  ;; initial facts
  (:init
    ;; initial locations of vehicles
    (at t1 city1)        ;; origin-side truck
    (at t2 airport2)     ;; destination-side truck (waiting at dest airport)
    (at p1 airport1)     ;; airplane at origin airport

    ;; cargo initially at origin city
    (at-cargo c1 city1)

    ;; vehicles initially empty
    (empty t1)
    (empty t2)
    (empty p1)

    ;; connectivity (roads and air routes)
    ;; roads: city1 <-> airport1, airport2 <-> city2
    (road city1 airport1)
    (road airport1 city1)
    (road airport2 city2)
    (road city2 airport2)

    ;; air-route between origin and destination airports
    (air-route airport1 airport2)
    (air-route airport2 airport1)

    ;; initial stage for cargo: s0
    (stage c1 s0)
  )

  ;; goal: cargo at destination city and final stage reached
  (:goal (and
    (at-cargo c1 city2)
    (stage c1 s9)
  ))