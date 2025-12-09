(define (problem depots17-problem)
  (:domain depots17)
  (:objects
    depot0 depot1 depot2 distributor0 - place

    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck

    t0 t1 t2 t3 t4 t5 t6 t7 - stage
  )

  (:init
    ; stage succession
    (next t0 t1)
    (next t1 t2)
    (next t2 t3)
    (next t3 t4)
    (next t4 t5)
    (next t5 t6)
    (next t6 t7)

    ; surfaces (pallets) located at places at stage t0
    (at-surface pallet0 depot0 t0)
    (at-surface pallet1 depot1 t0)
    (at-surface pallet2 depot2 t0)
    (at-surface pallet3 distributor0 t0)

    ; crates initially on surfaces at t0 (stacking)
    (on crate0 pallet3 t0)
    (on crate1 crate0 t0)
    (on crate2 pallet1 t0)

    ; clear facts at t0
    (clear crate1 t0)
    (clear crate2 t0)
    (clear pallet0 t0)
    (clear pallet2 t0)

    ; hoists and trucks locations at t0
    (at-hoist hoist0 depot0 t0)
    (at-hoist hoist1 depot1 t0)
    (at-hoist hoist2 depot2 t0)
    (at-hoist hoist3 distributor0 t0)

    (at-truck truck0 distributor0 t0)
    (at-truck truck1 depot2 t0)
    (at-truck truck2 distributor0 t0)

    ; hoist and truck availability at t0
    (free-hoist hoist0 t0)
    (free-hoist hoist1 t0)
    (free-hoist hoist2 t0)
    (free-hoist hoist3 t0)

    (free-truck truck0 t0)
    (free-truck truck1 t0)
    (free-truck truck2 t0)
  )

  (:goal (and
    (on crate0 pallet0 t7)
    (on crate1 pallet2 t7)
    (on crate2 pallet3 t7)
  ))
)