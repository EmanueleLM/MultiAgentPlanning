(define (problem logistics-problem) 

  (:domain logistics)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck)

  (:init
    (at depot0 crate0)
    (at depot0 crate1)
    (at distributor0 crate2)
    (at depot0 hoist0)
    (at depot1 hoist1)
    (at depot2 hoist2)
    (at distributor0 hoist3)
    (at depot0 pallet0)
    (at depot1 pallet1)
    (at depot2 pallet2)
    (at distributor0 pallet3)
    (at distributor0 truck0)
    (at depot1 truck1)
    (at distributor0 truck2)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet2)
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet3))

  (:goal (and 
    (on crate0 pallet2)
    (on crate1 crate0)
    (on crate2 pallet0))))