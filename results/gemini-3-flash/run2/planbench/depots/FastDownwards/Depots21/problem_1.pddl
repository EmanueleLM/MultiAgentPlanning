(define (problem depots21_prob)
  (:domain depots21)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; Places of everything
    (at truck0 depot0)
    (at truck1 depot0)
    (at truck2 depot2)
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (at crate0 distributor0)
    (at crate1 depot1)
    (at crate2 distributor0)

    ;; Hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Surface stacking relations
    (on crate0 pallet3)
    (on crate1 pallet1)
    (on crate2 crate0)

    ;; Clear surfaces
    (clear pallet0)
    (clear pallet2)
    (clear crate1)
    (clear crate2)
    ;; pallet1, pallet3, and crate0 are not clear as something is on them.
  )

  (:goal
    (and
      (on crate0 pallet2)
      (on crate1 pallet0)
      (on crate2 crate1)
    )
  )
)