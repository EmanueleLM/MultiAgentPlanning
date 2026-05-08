(define (problem depots28)
    (:domain depots)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
    )

    (:init
        ;; Hoists locations and status
        (at hoist0 depot0)
        (available hoist0)
        (at hoist1 depot1)
        (available hoist1)
        (at hoist2 depot2)
        (available hoist2)
        (at hoist3 distributor0)
        (available hoist3)

        ;; Pallets locations
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)

        ;; Trucks locations
        (at truck0 depot1)
        (at truck1 depot1)
        (at truck2 depot0)

        ;; Crates locations and stacking
        (at crate0 distributor0)
        (on crate0 pallet3)
        
        (at crate1 distributor0)
        (on crate1 crate0)
        
        (at crate2 depot1)
        (on crate2 pallet1)

        ;; Clear surfaces
        (clear pallet0)
        (clear pallet2)
        (clear crate1)
        (clear crate2)
        ;; Note: pallet1, pallet3, and crate0 are NOT clear
    )

    (:goal
        (and
            (on crate0 crate2)
            (on crate1 crate0)
            (on crate2 pallet0)
        )
    )
)