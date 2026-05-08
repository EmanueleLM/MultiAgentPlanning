(define (problem Depots12-Logistics)
    (:domain logistics-depots)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        
        hoist0 hoist1 hoist2 hoist3 - hoist
        truck0 truck1 truck2 - truck
    )
    
    (:init
        ;; Place definitions implied by type hierarchy
        
        ;; Truck locations
        (at truck0 depot1)
        (at truck1 depot0)
        (at truck2 depot1)
        
        ;; Hoist locations and availability
        (at hoist0 depot0) (available hoist0)
        (at hoist1 depot1) (available hoist1)
        (at hoist2 depot2) (available hoist2)
        (at hoist3 distributor0) (available hoist3)

        ;; Pallet locations 
        (at pallet0 depot0) 
        (at pallet1 depot1) 
        (at pallet2 depot2)
        (at pallet3 distributor0)
        
        ;; Crate locations
        (at crate0 depot2) 
        (at crate1 distributor0)
        (at crate2 distributor0) 
        
        ;; Stacking and Clearance:
        ;; Initial configuration: crate0 on pallet2, crate1 on pallet3, crate2 on crate1.

        (on crate0 pallet2) 
        (on crate1 pallet3)
        (on crate2 crate1)

        ;; Explicitly clear surfaces:
        (clear crate0) 
        (clear crate2) 
        (clear pallet0) 
        (clear pallet1) 
    )
    
    (:goal (and
        (on crate0 crate1)
        (on crate1 pallet3)
        (on crate2 pallet1)
    ))
)