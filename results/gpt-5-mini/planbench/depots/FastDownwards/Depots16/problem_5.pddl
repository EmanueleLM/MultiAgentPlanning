(define (problem depots-orchestrator-problem)
  (:domain depots-orchestrator)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )
  (:init
    ; locations of pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ; crates locations and stacking
    (at crate0 depot0)
    (at crate1 depot2)
    (at crate2 depot0)
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 crate0)

    ; hoists and trucks initial positions
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (at truck0 depot0)
    (at truck1 depot1)
    (at truck2 depot2)

    ; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ; clear-top facts (nothing on top)
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)

    ; full connectivity among places (roads connect any two places)
    (reachable depot0 depot1)
    (reachable depot0 depot2)
    (reachable depot0 distributor0)
    (reachable depot1 depot0)
    (reachable depot1 depot2)
    (reachable depot1 distributor0)
    (reachable depot2 depot0)
    (reachable depot2 depot1)
    (reachable depot2 distributor0)
    (reachable distributor0 depot0)
    (reachable distributor0 depot1)
    (reachable distributor0 depot2)
  )

  (:goal (and
    (on crate0 crate1)
    (on crate1 pallet0)
    (on crate2 pallet2)
  ))
)