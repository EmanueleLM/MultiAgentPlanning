(define (problem depots25-problem)
  (:domain depots25)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; roads (symmetric connectivity between the existing places)
    (road-connected depot0 depot1)
    (road-connected depot1 depot0)
    (road-connected depot0 depot2)
    (road-connected depot2 depot0)
    (road-connected depot0 distributor0)
    (road-connected distributor0 depot0)
    (road-connected depot1 depot2)
    (road-connected depot2 depot1)
    (road-connected depot1 distributor0)
    (road-connected distributor0 depot1)
    (road-connected depot2 distributor0)
    (road-connected distributor0 depot2)

    ;; pallets and crates location (surfaces at places) -- using at-surface
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    (at-surface crate0 depot2)
    (at-surface crate1 depot2)
    (at-surface crate2 depot2)

    ;; stacking relations (crate on surface)
    (on crate0 pallet2)
    (on crate1 crate0)
    (on crate2 crate1)

    ;; clear/top-of-stack facts (only top-most surfaces are clear)
    (clear crate2)
    (clear pallet0)
    (clear pallet1)
    (clear pallet3)

    ;; trucks at places
    (at-truck truck0 distributor0)
    (at-truck truck1 depot1)
    (at-truck truck2 distributor0)

    ;; hoists at places and available initially
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    (hoist-free hoist0)
    (hoist-free hoist1)
    (hoist-free hoist2)
    (hoist-free hoist3)
  )

  (:goal (and
    (on crate1 crate2)
    (on crate2 pallet2)
  ))
)