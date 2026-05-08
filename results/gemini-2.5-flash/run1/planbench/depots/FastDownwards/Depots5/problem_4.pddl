(define (problem depots5-problem)
    (:domain depots5)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        hoist0 hoist1 hoist2 hoist3 - hoist
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 pallet3 - pallet
        truck0 truck1 truck2 - truck
    )
    (:init
        ; Object locations (specialized)
        (at_surface crate0 distributor0)
        (at_surface crate1 distributor0)
        (at_surface crate2 distributor0)
        (at_hoist hoist0 depot0)
        (at_hoist hoist1 depot1)
        (at_hoist hoist2 depot2)
        (at_hoist hoist3 distributor0)
        (at_surface pallet0 depot0)
        (at_surface pallet1 depot1)
        (at_surface pallet2 depot2)
        (at_surface pallet3 distributor0)
        (at_truck truck0 depot0)
        (at_truck truck1 depot0)
        (at_truck truck2 depot1)

        ; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Surface clear status (explicitly clear)
        (clear crate2) ; Topmost crate is clear
        (clear pallet0)
        (clear pallet1)
        (clear pallet2)

        ; Stacking relations
        (on crate0 pallet3)
        (on crate1 crate0)
        (on crate2 crate1)
    )
    (:goal (and
        (on crate1 pallet1)
        (on crate2 pallet2)
    ))