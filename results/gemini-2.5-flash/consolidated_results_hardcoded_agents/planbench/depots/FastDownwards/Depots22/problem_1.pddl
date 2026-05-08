(define (problem Depots22-P1)
    (:domain Depots22)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
    )

    (:init
        (= (total-cost) 0)
        
        ;; Connectivity (All places connected)
        (connected depot0 depot1) (connected depot1 depot0)
        (connected depot0 depot2) (connected depot2 depot0)
        (connected depot0 distributor0) (connected distributor0 depot0)
        (connected depot1 depot2) (connected depot2 depot1)
        (connected depot1 distributor0) (connected distributor0 depot1)
        (connected depot2 distributor0) (connected distributor0 depot2)

        ;; Hoists (Available & Location)
        (available hoist0) (at hoist0 depot0)
        (available hoist1) (at hoist1 depot1)
        (available hoist2) (at hoist2 depot2)
        (available hoist3) (at hoist3 distributor0)

        ;; Trucks (Location)
        (at truck0 distributor0)
        (at truck1 depot1)
        (at truck2 depot1)

        ;; Pallets (Location)
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)

        ;; Crates (Location & Stacking)
        (at crate0 depot1)
        (at crate1 depot2)
        (at crate2 distributor0)

        ;; Stacking relations
        (on crate0 pallet1)
        (on crate1 pallet2)
        (on crate2 pallet3)

        ;; Clearance (Crates 0, 1, 2, and pallet0 are clear. Pallets 1, 2, 3 are not clear)
        (clear crate0)
        (clear crate1)
        (clear crate2)
        (clear pallet0)
    )

    (:goal (and
        (on crate0 crate1)
        (on crate1 pallet0)
    ))

    (:metric minimize (total-cost))
)