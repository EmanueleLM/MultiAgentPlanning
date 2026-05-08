(define (problem stacking-problem)
  (:domain hoist-stacking)
  (:objects
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
    depot0 depot1 depot2 distributor0 - location
  )
  (:init
    ; initial locations
    (at crate0 depot0)
    (at crate1 depot0)
    (at crate2 depot0)

    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    (at truck0 distributor0)
    (at truck1 depot0)
    (at truck2 depot0)

    ; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ; clear/top-of-stack facts (only those given are true)
    (clear crate2)
    (clear pallet1)
    (clear pallet2)
    (clear pallet3)

    ; stacking relations as given
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 crate1)
  )

  (:goal (and
    (on crate0 pallet1)
    (on crate1 crate2)
    (on crate2 pallet0)
  ))
)