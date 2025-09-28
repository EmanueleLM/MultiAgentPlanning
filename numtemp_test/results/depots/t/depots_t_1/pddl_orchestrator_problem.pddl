(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  ;; Objects
  (:objects
    depot0 depot1 depot2 distributor0 distributor1 distributor2 - place
    truck0 truck1 - truck
    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 - hoist
    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 - pallet
    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 - crate
  )

  ;; Initial state
  (:init
    ;; truck locations
    (at truck0 depot2)
    (at truck1 distributor0)

    ;; hoist locations (hoists stay at these places)
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)
    (hoist-at hoist4 distributor1)
    (hoist-at hoist5 distributor2)

    ;; surfaces marker for pallets and crates (so predicates can refer to them uniformly)
    (surface pallet0) (surface pallet1) (surface pallet2) (surface pallet3) (surface pallet4) (surface pallet5)
    (surface crate0) (surface crate1) (surface crate2) (surface crate3) (surface crate4) (surface crate5) (surface crate6) (surface crate7) (surface crate8) (surface crate9)

    ;; on-relations (initial stacks)
    (on crate3 crate0)
    (on crate4 crate2)
    (on crate5 crate4)
    (on crate9 crate5)
    (on crate7 crate6)
    (on crate8 crate7)
    (on crate1 pallet0)
    (on crate0 pallet1)
    (on crate2 pallet2)
    (on crate6 pallet5)

    ;; clear surfaces initially (top elements of each stack and explicitly given clears)
    ;; Given clear_surfaces: ['crate1', 'crate3', 'crate8', 'crate9', 'pallet3', 'pallet4']
    (clear crate1)
    (clear crate3)
    (clear crate8)
    (clear crate9)
    (clear pallet3)
    (clear pallet4)

    ;; hoist availability
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)
    (hoist-available hoist4)
    (hoist-available hoist5)

    ;; No crates start in any truck (in_truck none)

    ;; Numeric fluent initializations: speeds
    (= (speed truck0) 9)
    (= (speed truck1) 9)

    ;; hoist powers
    (= (power hoist0) 4)
    (= (power hoist1) 3)
    (= (power hoist2) 1)
    (= (power hoist3) 8)
    (= (power hoist4) 2)
    (= (power hoist5) 6)

    ;; crate weights
    (= (weight crate0) 42)
    (= (weight crate1) 6)
    (= (weight crate2) 74)
    (= (weight crate3) 64)
    (= (weight crate4) 61)
    (= (weight crate5) 79)
    (= (weight crate6) 29)
    (= (weight crate7) 77)
    (= (weight crate8) 19)
    (= (weight crate9) 98)

    ;; distances (directed table)
    ;; depot0 row
    (= (distance depot0 depot0) 0)
    (= (distance depot0 depot1) 1)
    (= (distance depot0 depot2) 7)
    (= (distance depot0 distributor0) 8)
    (= (distance depot0 distributor1) 8)
    (= (distance depot0 distributor2) 1)
    ;; depot1 row
    (= (distance depot1 depot0) 9)
    (= (distance depot1 depot1) 0)
    (= (distance depot1 depot2) 2)
    (= (distance depot1 distributor0) 7)
    (= (distance depot1 distributor1) 10)
    (= (distance depot1 distributor2) 6)
    ;; depot2 row
    (= (distance depot2 depot0) 6)
    (= (distance depot2 depot1) 9)
    (= (distance depot2 depot2) 0)
    (= (distance depot2 distributor0) 8)
    (= (distance depot2 distributor1) 5)
    (= (distance depot2 distributor2) 10)
    ;; distributor0 row
    (= (distance distributor0 depot0) 6)
    (= (distance distributor0 depot1) 4)
    (= (distance distributor0 depot2) 10)
    (= (distance distributor0 distributor0) 0)
    (= (distance distributor0 distributor1) 2)
    (= (distance distributor0 distributor2) 7)
    ;; distributor1 row
    (= (distance distributor1 depot0) 2)
    (= (distance distributor1 depot1) 9)
    (= (distance distributor1 depot2) 10)
    (= (distance distributor1 distributor0) 7)
    (= (distance distributor1 distributor1) 0)
    (= (distance distributor1 distributor2) 7)
    ;; distributor2 row
    (= (distance distributor2 depot0) 8)
    (= (distance distributor2 depot1) 7)
    (= (distance distributor2 depot2) 8)
    (= (distance distributor2 distributor0) 5)
    (= (distance distributor2 distributor1) 4)
    (= (distance distributor2 distributor2) 0)

    ;; total-time starts at 0 (accumulated objective)
    (= (total-time) 0)
  )

  ;; Goal: achieve the specified on relations (arrangements)
  (:goal (and
    (on crate7 crate1)
    (on crate9 crate2)
    (on crate6 crate5)
    (on crate0 crate7)
    (on crate3 crate9)
    (on crate4 pallet0)
    (on crate5 pallet2)
    (on crate8 pallet3)
    (on crate1 pallet4)
    (on crate2 pallet5)
  ))

  ;; Objective: minimize total-time (accumulated durations)
  (:metric minimize (total-time))
)