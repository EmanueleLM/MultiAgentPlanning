(define (problem depots26-p)
    (:domain depots26)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 pallet3 - pallet
        hoist0 hoist1 hoist2 hoist3 - hoist
        truck0 truck1 truck2 - truck
    )
    
    (:init
        ;; Locations
        (at crate0 depot0) (at crate1 depot1) (at crate2 distributor0)
        (at hoist0 depot0) (at hoist1 depot1) (at hoist2 depot2) (at hoist3 distributor0)
        (at pallet0 depot0) (at pallet1 depot1) (at pallet2 depot2) (at pallet3 distributor0)
        (at truck0 depot0) (at truck1 depot1) (at truck2 depot0)

        ;; Hoist status
        (available hoist0) (available hoist1) (available hoist2) (available hoist3)
        
        ;; Clearance status
        (clear crate0) (clear crate1) (clear crate2) 
        (clear pallet2) ; Pallets 0, 1, 3 are occupied initially

        ;; Stacking status
        (on crate0 pallet0)
        (on crate1 pallet1)
        (on crate2 pallet3)
    )
    
    (:goal (and
        (on crate0 pallet2)
        (on crate1 pallet3)
        (on crate2 pallet1)
    ))
)