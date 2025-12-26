(define (problem depots-p7)
    (:domain depots-domain)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        crate0 crate1 crate2 - crate
        hoist0 hoist1 hoist2 hoist3 - hoist
        pallet0 pallet1 pallet2 pallet3 - pallet
        truck0 truck1 truck2 - truck
    )

    (:init
        (= (total-cost) 0)

        ; Locations of mobile items (Trucks, Hoists, Crates, Pallets)
        (at crate0 depot1) (at crate1 distributor0) (at crate2 depot0)
        (at hoist0 depot0) (at hoist1 depot1) (at hoist2 depot2) (at hoist3 distributor0)
        (at pallet0 depot0) (at pallet1 depot1) (at pallet2 depot2) (at pallet3 distributor0)
        (at truck0 depot0) (at truck1 distributor0) (at truck2 depot1)

        ; Hoist availability
        (available hoist0) (available hoist1) (available hoist2) (available hoist3)

        ; Stacking relationship (Initial Stacks)
        (on crate0 pallet1) (on crate1 pallet3) (on crate2 pallet0)

        ; Clearance status (Topmost items or empty surfaces)
        (clear crate0) (clear crate1) (clear crate2)
        (clear pallet2)
    )

    (:goal
        (and
            (on crate0 pallet3)
            (on crate1 crate2)
            (on crate2 pallet1)
        )
    )

    (:metric minimize (total-cost))