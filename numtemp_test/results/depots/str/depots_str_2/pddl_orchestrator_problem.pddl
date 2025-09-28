(define (problem warehousing-instance)
  (:domain multiagent-warehousing)
  (:objects
    depot0 depot1 distributor0 distributor1 - place
    truck0 truck1 truck2 truck3
    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 hoist6 hoist7
    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7
    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9
  )

  (:init
    ;; locations: at
    ;; depot0
    (at crate3 depot0)
    (at hoist0 depot0)
    (at hoist4 depot0)
    (at hoist5 depot0)
    (at hoist6 depot0)
    (at pallet0 depot0)
    (at pallet6 depot0)
    (at truck3 depot0)

    ;; depot1
    (at crate4 depot1)
    (at hoist1 depot1)
    (at pallet1 depot1)
    (at truck0 depot1)
    (at truck2 depot1)

    ;; distributor0
    (at crate2 distributor0)
    (at crate9 distributor0)
    (at hoist2 distributor0)
    (at pallet2 distributor0)
    (at pallet4 distributor0)

    ;; distributor1
    (at crate0 distributor1)
    (at crate1 distributor1)
    (at crate5 distributor1)
    (at crate6 distributor1)
    (at crate7 distributor1)
    (at crate8 distributor1)
    (at hoist3 distributor1)
    (at hoist7 distributor1)
    (at pallet3 distributor1)
    (at pallet5 distributor1)
    (at pallet7 distributor1)
    (at truck1 distributor1)

    ;; on relations (stacking)
    (on crate5 crate0)
    (on crate7 crate5)
    (on crate8 crate6)
    (on crate4 pallet1)
    (on crate9 pallet2)
    (on crate0 pallet3)
    (on crate2 pallet4)
    (on crate1 pallet5)
    (on crate3 pallet6)
    (on crate6 pallet7)

    ;; hoists available
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)
    (hoist-available hoist4)
    (hoist-available hoist5)
    (hoist-available hoist6)
    (hoist-available hoist7)

    ;; clear surfaces (given)
    (clear crate1)
    (clear crate2)
    (clear crate3)
    (clear crate4)
    (clear crate7)
    (clear crate8)
    (clear crate9)
    (clear pallet0)
  )

  (:goal (and
    (on crate7 crate3)
    (on crate3 crate8)
    (on crate4 pallet0)
    (on crate6 pallet1)
    (on crate2 pallet4)
    (on crate8 pallet6)
    (on crate1 pallet7)
  ))
)