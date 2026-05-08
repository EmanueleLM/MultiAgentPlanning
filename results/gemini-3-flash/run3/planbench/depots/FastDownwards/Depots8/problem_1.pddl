(define (problem depots8_prob)
  (:domain depots8)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    ;; Places of pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; Places of hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; Places of trucks
    (at truck0 depot1)
    (at truck1 depot2)
    (at truck2 distributor0)

    ;; Places of crates
    (at crate0 depot1)
    (at crate1 distributor0)
    (at crate2 depot1)

    ;; Hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Surface status and relations
    (on crate0 pallet1)
    (on crate1 pallet3)
    (on crate2 crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet2)
    ;; (pallet1 is not clear, pallet3 is not clear, crate0 is not clear)
  )

  (:goal
    (and
      (on crate0 pallet0)
      (on crate2 pallet1)
    )
  )
)