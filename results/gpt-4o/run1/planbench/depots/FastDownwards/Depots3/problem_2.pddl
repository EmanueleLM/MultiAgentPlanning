(define (problem logistics-instance)
  (:domain logistics)

  (:objects
    depot0 depot1 depot2 distributor0 - place
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    (at crate0 depot2)
    (at crate1 distributor0)
    (at crate2 depot1)
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (at truck0 depot1)
    (at truck1 depot1)
    (at truck2 depot1)
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (on crate0 pallet2)
    (on crate1 pallet3)
    (on crate2 pallet1)
    
    (connected depot0 depot1)
    (connected depot1 depot0)
    (connected depot1 depot2)
    (connected depot2 depot1)
    (connected depot0 depot2)
    (connected depot2 depot0)
    (connected distributor0 depot0)
    (connected depot0 distributor0)
    (connected distributor0 depot1)
    (connected depot1 distributor0)
    (connected distributor0 depot2)
    (connected depot2 distributor0)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate1 pallet1)
    (on crate2 pallet3)
  ))
)