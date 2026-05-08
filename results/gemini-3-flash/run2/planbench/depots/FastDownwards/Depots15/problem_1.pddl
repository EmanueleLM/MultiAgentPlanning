(define (problem depots15)
  (:domain depots)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )
  (:init
    ;; Places and their static contents
    (at pallet0 depot0)
    (clear pallet0)
    (at hoist0 depot0)
    (available hoist0)

    (at pallet1 depot1)
    (at hoist1 depot1)
    (available hoist1)

    (at pallet2 depot2)
    (at hoist2 depot2)
    (available hoist2)

    (at pallet3 distributor0)
    (clear pallet3)
    (at hoist3 distributor0)
    (available hoist3)

    ;; Trucks
    (at truck0 depot2)
    (at truck1 depot2)
    (at truck2 depot1)

    ;; Crates
    ;; crate0 at depot2 on pallet2
    (at crate0 depot2)
    (on crate0 pallet2)
    ;; crate1 at depot1 on pallet1
    (at crate1 depot1)
    (on crate1 pallet1)
    (clear crate1)
    ;; crate2 at depot2 on crate0
    (at crate2 depot2)
    (on crate2 crate0)
    (clear crate2)
  )
  (:goal
    (and
      (on crate0 pallet3)
      (on crate1 crate2)
      (on crate2 pallet2)
    )
  )
)