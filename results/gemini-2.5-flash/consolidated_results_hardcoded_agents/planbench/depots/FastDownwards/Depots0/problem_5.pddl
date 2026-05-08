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
        ; --- Connectivity (All places connected) ---
        (connected depot0 depot1) (connected depot1 depot0)
        (connected depot0 depot2) (connected depot2 depot0)
        (connected depot0 distributor0) (connected distributor0 depot0)
        (connected depot1 depot2) (connected depot2 depot1)
        (connected depot1 distributor0) (connected distributor0 depot1)
        (connected depot2 distributor0) (connected distributor0 depot2)

        ; --- Infrastructure (Hoist & Pallet location) ---
        (infrastructure depot0 hoist0 pallet0)
        (infrastructure depot1 hoist1 pallet1)
        (infrastructure depot2 hoist2 pallet2)
        (infrastructure distributor0 hoist3 pallet3)

        ; --- Mobile Locations ---
        (mobile-at crate0 depot1)
        (mobile-at crate1 depot1)
        (mobile-at crate2 depot0)
        
        (mobile-at truck0 depot1)
        (mobile-at truck1 depot1)
        (mobile-at truck2 distributor0)

        ; --- Hoist Availability ---
        (available hoist0) (available hoist1) (available hoist2) (available hoist3)
        
        ; --- Stacking Structure ---
        ; crate0 is on pallet1 (P1 not clear)
        (on crate0 pallet1)
        ; crate1 is on crate0 (C0 not clear)
        (on crate1 crate0)
        ; crate2 is on pallet0 (P0 not clear)
        (on crate2 pallet0)
        
        ; --- Clearness ---
        ; Crates on top are clear
        (clear crate1)
        (clear crate2)
        ; Unused pallets are clear
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