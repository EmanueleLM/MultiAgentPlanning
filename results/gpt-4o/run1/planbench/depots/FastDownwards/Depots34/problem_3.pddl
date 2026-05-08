(define (problem logistics-instance)
  (:domain logistics)
  
  (:objects
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
    depot0 depot1 depot2 distributor0 - place
  )
  
  (:init
    (at crate0 depot2)
    (at crate1 depot2)
    (at crate2 depot2)
    (on crate0 pallet2)
    (on crate1 crate0)
    (on crate2 crate1)
    (at hoist0 depot0)
    (available hoist0)
    (at hoist1 depot1)
    (available hoist1)
    (at hoist2 depot2)
    (available hoist2)
    (at hoist3 distributor0)
    (available hoist3)
    (clear pallet0)
    (at pallet0 depot0)
    (clear pallet1)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (clear pallet3)
    (at pallet3 distributor0)
    (at truck0 depot1)
    (at truck1 depot1)
    (at truck2 depot0)
    (connected depot0 depot1)
    (connected depot1 depot0)
    (connected depot0 depot2)
    (connected depot2 depot0)
    (connected depot0 distributor0)
    (connected distributor0 depot0)
    (connected depot1 depot2)
    (connected depot2 depot1)
    (connected depot1 distributor0)
    (connected distributor0 depot1)
    (connected depot2 distributor0)
    (connected distributor0 depot2)
  )
  
  (:goal (and
    (on crate0 crate2)
    (on crate2 pallet1)
  ))
)