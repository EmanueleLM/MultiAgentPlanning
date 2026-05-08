(define (problem depots10-prob)
  (:domain depots10)

  (:objects
    depot0 depot1 depot2 distributor0 - place

    pallet0 pallet1 pallet2 pallet3 - pallet

    crate0 crate1 crate2 - crate

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    (at crate0 depot1)
    (on crate0 pallet1)

    (at crate1 depot1)
    (on crate1 crate0)

    (at crate2 depot0)
    (on crate2 pallet0)

    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    (at truck0 depot2)
    (at truck1 distributor0)
    (at truck2 depot1)

    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    (clear crate1)
    (clear crate2)
    (surface-clear pallet2)
    (surface-clear pallet3)
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 pallet1)
  ))
)