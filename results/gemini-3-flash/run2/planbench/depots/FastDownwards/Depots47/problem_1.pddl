(define (problem depots47_problem)
  (:domain depots47)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; Crate locations and surfaces
    (at crate0 depot2)
    (on crate0 pallet2)
    (clear crate0)

    (at crate1 depot1)
    (on crate1 pallet1)
    (clear crate1)

    (at crate2 depot0)
    (on crate2 pallet0)
    (clear crate2)

    ;; Pallet locations and clear status
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (clear pallet3)

    ;; Hoist locations and status
    (at hoist0 depot0)
    (available hoist0)
    (at hoist1 depot1)
    (available hoist1)
    (at hoist2 depot2)
    (available hoist2)
    (at hoist3 distributor0)
    (available hoist3)

    ;; Truck locations
    (at truck0 distributor0)
    (at truck1 depot1)
    (at truck2 distributor0)
  )

  (:goal
    (and
      (on crate0 pallet2)
      (on crate1 pallet0)
      (on crate2 pallet3)
    )
  )
)