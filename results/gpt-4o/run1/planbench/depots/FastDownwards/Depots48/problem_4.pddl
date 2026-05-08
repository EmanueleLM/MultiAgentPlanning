(define (problem transport-crates)
    (:domain logistics)
    (:objects
        depot0 depot1 depot2 distributor0 - place
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 pallet3 - pallet
        hoist0 hoist1 hoist2 hoist3 - hoist
        truck0 truck1 truck2 - truck
    )
    
    (:init
        (at crate0 depot0)
        (on crate0 pallet0)
        (at crate1 depot2)
        (on crate1 pallet2)
        (at crate2 depot0)
        (on crate2 crate0)
        
        (hoist-at hoist0 depot0)
        (hoist-at hoist1 depot1)
        (hoist-at hoist2 depot2)
        (hoist-at hoist3 distributor0)
        
        (truck-at truck0 depot2)
        (truck-at truck1 depot2)
        (truck-at truck2 depot0)
        
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)
        
        (clear crate1)
        (clear crate2)
        (clear pallet1)
        (clear pallet3)
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)
    )
    
    (:goal (and
        (on crate0 crate1)
        (on crate1 pallet2)
        (on crate2 crate0)
    ))
)