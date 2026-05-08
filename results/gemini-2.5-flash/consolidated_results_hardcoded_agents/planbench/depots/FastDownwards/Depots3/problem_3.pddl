(define (problem Depots3-Logistics)
    (:domain logistics-depots)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        
        truck0 truck1 truck2 - truck
        
        hoist0 hoist1 hoist2 hoist3 - hoist
        
        crate0 crate1 crate2 - crate
        
        pallet0 pallet1 pallet2 pallet3 - pallet
    )
    
    (:init
        ;; Place definitions (implicitly connected)
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)

        ;; Hoist locations
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)
        
        ;; Truck locations (All at depot1)
        (at truck0 depot1)
        (at truck1 depot1)
        (at truck2 depot1)
        
        ;; Crate locations
        (at crate0 depot2)
        (at crate1 distributor0)
        (at crate2 depot1)
        
        ;; Status: Available Hoists
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)
        
        ;; Status: Clear Crates and Surfaces
        (clear crate0)
        (clear crate1)
        (clear crate2)
        (clear pallet0)
        
        ;; Initial placement
        (on crate0 pallet2) 
        (on crate1 pallet3) 
        (on crate2 pallet1)
        
        ;; Surfaces occupied by crates are NOT clear
        (not (clear pallet1))
        (not (clear pallet2))
        (not (clear pallet3))
    )
    
    (:goal (and
        (on crate0 pallet0)
        (on crate1 pallet1)
        (on crate2 pallet3)
    ))
)