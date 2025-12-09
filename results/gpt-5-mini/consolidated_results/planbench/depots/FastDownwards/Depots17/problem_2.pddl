(define (problem depots17-problem)
  (:domain depots17)
  (:objects
    ; places
    depot0 depot1 depot2 distributor0 - place

    ; pallets and crates (subtypes of surface)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ; hoists and trucks
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck

    ; discrete ordered stages (explicit)
    t0 t1 t2 t3 t4 t5 t6 t7 - stage
  )

  (:init
    ;; successor (ordered) relation among stages
    (next t0 t1)
    (next t1 t2)
    (next t2 t3)
    (next t3 t4)
    (next t4 t5)
    (next t5 t6)
    (next t6 t7)

    ;; initial spatial facts (global)
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    (at-surface crate0 distributor0)
    (at-surface crate1 distributor0)
    (at-surface crate2 depot1)

    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 pallet1)

    ;; clear/top status as provided (global)
    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet2)

    ;; hoist and truck locations (global)
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    (at-truck truck0 distributor0)
    (at-truck truck1 depot2)
    (at-truck truck2 distributor0)

    ;; resource availability tokens at the initial stage t0
    (free-hoist hoist0 t0)
    (free-hoist hoist1 t0)
    (free-hoist hoist2 t0)
    (free-hoist hoist3 t0)

    (free-truck truck0 t0)
    (free-truck truck1 t0)
    (free-truck truck2 t0)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 pallet3)
  ))
)