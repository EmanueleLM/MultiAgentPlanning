(define (problem depots_instance)
    (:domain depots24)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
    )
    (:init
        ; Connectivity: Roads between all depots and distributors (full graph)
        (road depot0 depot1) (road depot1 depot0)
        (road depot0 depot2) (road depot2 depot0)
        (road depot0 distributor0) (road distributor0 depot0)
        (road depot1 depot2) (road depot2 depot1)
        (road depot1 distributor0) (road distributor0 depot1)
        (road depot2 distributor0) (road distributor0 depot2)

        ; Object locations
        (at crate0 depot0)
        (at crate1 distributor0)
        (at crate2 depot2)

        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)

        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)

        (at truck0 depot2)
        (at truck1 depot0)
        (at truck2 depot2)

        ; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Stacking and clearance initial state
        ; Crates are initially clear (nothing on them)
        (clear crate0)
        (clear crate1)
        (clear crate2)

        ; Pallet1 is explicitly clear (nothing on it and not explicitly stated in 'on' relations)
        (clear pallet1)

        ; Stacking: crate0 on pallet0, crate1 on pallet3, crate2 on pallet2
        (on crate0 pallet0)
        (on crate1 pallet3)
        (on crate2 pallet2)

        ; Implied lack of clearance for surfaces that have crates on them
        (not (clear pallet0))
        (not (clear pallet3))
        (not (clear pallet2))
    )
    (:goal (and
        (on crate0 crate2)
        (on crate1 pallet2)
        (on crate2 pallet0)
    ))
)