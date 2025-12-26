(define (problem depots-logistics-task)
    (:domain logistics-depots)

    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        
        truck0 truck1 truck2 - truck
        
        hoist0 hoist1 hoist2 hoist3 - hoist
        
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
    )

    (:init
        ; --- Connectivity (All places connected to all others, implied by specification) ---
        (connected depot0 depot1) (connected depot1 depot0)
        (connected depot0 depot2) (connected depot2 depot0) ; FIXED SYNTAX ERROR
        (connected depot0 distributor0) (connected distributor0 depot0)
        (connected depot1 depot2) (connected depot2 depot1)
        (connected depot1 distributor0) (connected distributor0 depot1)
        (connected depot2 distributor0) (connected distributor0 depot2)

        ; --- Locations ---
        (at crate0 depot1)
        (at crate1 depot1)
        (at crate2 depot0)
        
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
        (at truck2 distributor0)

        ; --- Status and Stacking ---
        ; Hoist Availability
        (available hoist0) (available hoist1) (available hoist2) (available hoist3)
        
        ; Stacking structure
        (on crate0 pallet1)
        (on crate1 crate0)
        (on crate2 pallet0)
        
        ; Clearness (Explicitly stated facts)
        (clear crate1)
        (clear crate2)
        (clear pallet2)
        (clear pallet3)
    )

    (:goal
        (and
            (on crate1 pallet1)
            (on crate2 pallet3)
        )
    )