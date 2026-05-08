(define (problem transport_crates)
  (:domain logistics)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
  )
  (:init
    (connected depot0 depot1) (connected depot1 depot0)
    (connected depot0 depot2) (connected depot2 depot0)
    (connected depot0 distributor0) (connected distributor0 depot0)
    (connected depot1 depot2) (connected depot2 depot1)
    (connected depot1 distributor0) (connected distributor0 depot1)
    (connected depot2 distributor0) (connected distributor0 depot2)
    
    (at crate0 distributor0)
    (at crate1 depot0)
    (at crate2 depot2)
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (at truck0 depot2)
    (at truck1 depot2)
    (at truck2 depot0)

    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet1)

    (on crate0 pallet3)
    (on crate1 pallet0)
    (on crate2 pallet2)
  )
  (:goal (and
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 crate1)
  ))
)