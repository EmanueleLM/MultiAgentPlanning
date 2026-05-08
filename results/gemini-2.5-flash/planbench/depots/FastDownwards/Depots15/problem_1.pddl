(define (problem depots15)
    (:domain depots)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        crate0 crate1 crate2 - crate
        hoist0 hoist1 hoist2 hoist3 - hoist
        pallet0 pallet1 pallet2 pallet3 - pallet
        truck0 truck1 truck2 - truck
    )
    (:init
        ; Truck locations
        (at_place truck0 depot2)
        (at_place truck1 depot2)
        (at_place truck2 depot1)

        ; Hoist locations and availability
        (at_place hoist0 depot0)
        (hoist_available hoist0)
        (at_place hoist1 depot1)
        (hoist_available hoist1)
        (at_place hoist2 depot2)
        (hoist_available hoist2)
        (at_place hoist3 distributor0)
        (hoist_available hoist3)

        ; Crate locations
        (at_place crate0 depot2)
        (at_place crate1 depot1)
        (at_place crate2 depot2)

        ; Pallet locations
        (at_place pallet0 depot0)
        (at_place pallet1 depot1)
        (at_place pallet2 depot2)
        (at_place pallet3 distributor0)

        ; Stacking relations
        (on crate0 pallet2)
        (on crate1 pallet1)
        (on crate2 crate0)

        ; Clear status for surfaces
        (clear crate1) ; nothing on crate1
        (clear crate2) ; nothing on crate2
        (clear pallet0) ; nothing on pallet0
        (clear pallet3) ; nothing on pallet3
        ; Implied not clear: pallet1 (crate1 on it), pallet2 (crate0 on it), crate0 (crate2 on it)
    )
    (:goal
        (and
            (on crate0 pallet3)
            (on crate1 crate2)
            (on crate2 pallet2)
        )
    )
)