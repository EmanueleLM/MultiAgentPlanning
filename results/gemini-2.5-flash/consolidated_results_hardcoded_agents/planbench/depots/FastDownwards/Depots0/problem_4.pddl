(define (problem depots-logistics-task-minimized)
    (:domain logistics-depots-optimized)

    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        
        truck0 truck1 truck2 - truck
        
        hoist0 hoist1 hoist2 hoist3 - hoist
        
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
    )

    (:init
        ; --- Connectivity (12 facts) ---
        (connected depot0 depot1) (connected depot1 depot0)
        (connected depot0 depot2) (connected depot2 depot0)
        (connected depot0 distributor0) (connected distributor0 depot0)
        (connected depot1 depot2) (connected depot2 depot1)
        (connected depot1 distributor0) (connected distributor0 depot1)
        (connected depot2 distributor0) (connected distributor0 depot2)

        ; --- Fixed Resource Infrastructure (4 facts) ---
        ; Encodes H and PL location simultaneously, saving 4 'at' facts.
        (infrastructure depot0 hoist0 pallet0)
        (infrastructure depot1 hoist1 pallet1)
        (infrastructure depot2 hoist2 pallet2)
        (infrastructure distributor0 hoist3 pallet3)

        ; --- Mobile Locations (Crates and Trucks - 6 facts) ---
        (mobile-at crate0 depot1)
        (mobile-at crate1 depot1)
        (mobile-at crate2 depot0)
        
        (mobile-at truck0 depot1)
        (mobile-at truck1 depot1)
        (mobile-at truck2 distributor0)

        ; --- Status and Stacking ---
        ; Hoist Availability (4 facts)
        (available hoist0) (available hoist1) (available hoist2) (available hoist3)
        
        ; Stacking structure (3 facts)
        (on crate0 pallet1)
        (on crate1 crate0)
        (on crate2 pallet0)
        
        ; Clearness (4 facts: Crate tops and unused pallets)
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
)