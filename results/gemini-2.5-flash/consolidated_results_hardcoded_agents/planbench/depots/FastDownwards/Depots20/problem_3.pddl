(define (problem depots-instance)
    (:domain depots-logistics)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 pallet3 - pallet
        
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
    )
    
    (:init
        ; Crate Locations
        (at crate0 depot1)
        (at crate1 depot2)
        (at crate2 depot0)
        
        ; Hoist Locations
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)
        
        ; Pallet Locations
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)
        
        ; Truck Locations
        (at truck0 depot1)
        (at truck1 depot2)
        (at truck2 distributor0)
        
        ; Hoist Availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)
        
        ; Clarity Status (Pallets 0, 1, 2 are not clear implicitly because they have crates on them)
        (clear crate0)
        (clear crate1)
        (clear crate2)
        (clear pallet3)
        
        ; Initial Loadings
        (on crate0 pallet1)
        (on crate1 pallet2)
        (on crate2 pallet0)
    )
    
    (:goal (and
        (on crate0 pallet2)
        (on crate1 pallet1)
        (on crate2 pallet0)
    ))
)