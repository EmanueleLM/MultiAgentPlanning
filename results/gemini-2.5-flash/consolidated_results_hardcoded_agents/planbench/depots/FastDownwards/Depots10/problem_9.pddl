(define (problem depots10-p0)
    (:domain logistics-depots)
    (:objects
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 pallet3 - pallet
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
        depot0 depot1 depot2 - depot
        distributor0 - distributor
    )
    
    (:init
        (= (total-cost) 0)

        ;; Connections (All places connected to all others)
        (connected depot0 depot1) (connected depot1 depot0)
        (connected depot0 depot2) (connected depot2 depot0)
        (connected depot0 distributor0) (connected distributor0 depot0)
        
        (connected depot1 depot2) (connected depot2 depot1)
        (connected depot1 distributor0) (connected distributor0 depot1)

        (connected depot2 distributor0) (connected distributor0 depot2)
        
        ;; Truck locations
        (at truck0 depot2)
        (at truck1 distributor0)
        (at truck2 depot1)

        ;; Hoist locations and status
        (at hoist0 depot0) (available hoist0)
        (at hoist1 depot1) (available hoist1)
        (at hoist2 depot2) (available hoist2)
        (at hoist3 distributor0) (available hoist3)

        ;; Pallet locations (Surfaces)
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)
        
        ;; Crate locations (Required for Lift/Drop/Load consistency)
        (at crate0 depot1)
        (at crate1 depot1)
        (at crate2 depot0)
        
        ;; Initial Stacking
        (on crate0 pallet1)
        (on crate1 crate0)
        (on crate2 pallet0)
        
        ;; Clear Status
        (clear crate1) ; Top of stack D1
        (clear crate2) ; Top of stack D0
        
        (clear pallet2) ; D2 surface
        (clear pallet3) ; Distributor surface
    )
    
    (:goal (and
        (on crate0 pallet2)
        (on crate1 pallet0)
        (on crate2 pallet1)
    ))

    (:metric minimize (total-cost))
)