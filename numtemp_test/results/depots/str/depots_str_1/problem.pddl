(define (problem deliver-crates)
  (:domain hoist-truck-multiagent)

  (:objects
    depot0 depot1 distributor0 distributor1 - place

    truck0 truck1 truck2 truck3 - truck

    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 hoist6 hoist7 - hoist

    crate0 crate1 crate2 crate3 crate4 crate5 - crate

    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7 - pallet
  )

  (:init
    ; locations of hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 distributor0)
    (at hoist3 distributor1)
    (at hoist4 distributor1)
    (at hoist5 depot1)
    (at hoist6 depot1)
    (at hoist7 distributor1)

    ; hoists initially available
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)
    (hoist-available hoist4)
    (hoist-available hoist5)
    (hoist-available hoist6)
    (hoist-available hoist7)

    ; trucks at places
    (at truck2 depot0)
    (at truck0 depot1)
    (at truck1 depot1)
    (at truck3 distributor1)

    ; pallets at places
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 distributor0)
    (at pallet3 distributor1)
    (at pallet4 depot1)
    (at pallet5 distributor1)
    (at pallet6 depot1)
    (at pallet7 distributor0)

    ; initial stacks (on relations) and crate/pallet locations
    ; depot0 stack: [pallet0, crate2, crate5] (pallet0 bottom)
    (on crate2 pallet0)
    (on crate5 crate2)
    (at crate2 depot0)
    (at crate5 depot0)

    ; depot1 stacks: [pallet1, crate1, crate3], [pallet4, crate0], [pallet6]
    (on crate1 pallet1)
    (on crate3 crate1)
    (at crate1 depot1)
    (at crate3 depot1)

    (on crate0 pallet4)
    (at crate0 depot1)

    (at pallet6 depot1)

    ; distributor0 stacks: [pallet2, crate4], [pallet7]
    (on crate4 pallet2)
    (at crate4 distributor0)

    ; distributor1 stacks: [pallet3], [pallet5]
    ; (pallet3 and pallet5 already have their at facts above)

    ; clear surfaces (given)
    (clear crate0)
    (clear crate3)
    (clear crate4)
    (clear crate5)
    (clear pallet3)
    (clear pallet5)
    (clear pallet6)
    (clear pallet7)
  )

  (:goal (and
    (on crate4 crate3)
    (on crate3 pallet0)
    (on crate2 pallet1)
    (on crate5 pallet2)
    (on crate0 pallet3)
  )))