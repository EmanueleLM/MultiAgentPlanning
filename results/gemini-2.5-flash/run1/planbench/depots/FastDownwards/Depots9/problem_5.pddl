(define (problem Depots9-Problem)
    (:domain Depots9)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 pallet3 - pallet
        hoist0 hoist1 hoist2 hoist3 - hoist
        truck0 truck1 truck2 - truck
    )

    (:init
        ; Connectivity (all places directly connected)
        (connected depot0 depot1) (connected depot1 depot0)
        (connected depot0 depot2) (connected depot2 depot0)
        (connected depot0 distributor0) (connected distributor0 depot0)

        (connected depot1 depot2) (connected depot2 depot1)
        (connected depot1 distributor0) (connected distributor0 depot1)

        (connected depot2 distributor0) (connected distributor0 depot2)

        ; Crate Locations (on a surface at a place)
        (at_surface crate0 depot1)
        (at_surface crate1 depot2)
        (at_surface crate2 distributor0)

        ; Hoist Status
        (at_hoist hoist0 depot0) (available hoist0)
        (at_hoist hoist1 depot1) (available hoist1)
        (at_hoist hoist2 depot2) (available hoist2)
        (at_hoist hoist3 distributor0) (available hoist3)

        ; Truck Status
        (at_truck truck0 distributor0)
        (at_truck truck1 depot2)
        (at_truck truck2 depot0)

        ; Pallet Status (pallets are fixed at specific depots/distributors, thus at_surface)
        (at_surface pallet0 depot0)
        (at_surface pallet1 depot1)
        (at_surface pallet2 depot2)
        (at_surface pallet3 distributor0)

        ; Initial Relationships
        (on crate0 pallet1)
        (on crate1 pallet2)
        (on crate2 pallet3)

        ; Initial 'clear' status as per specification
        (clear crate0)
        (clear crate1)
        (clear crate2)
        (clear pallet0)
        ; (pallet1, pallet2, pallet3 are not clear as they have crates on them, implied by absence)
    )

    (:goal (and
        (on crate0 pallet1)
        (on crate1 pallet2)
        (on crate2 pallet0)
    ))
)