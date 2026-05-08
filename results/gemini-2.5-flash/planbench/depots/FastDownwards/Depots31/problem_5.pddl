(define (problem depots31-problem)
    (:domain depots31)
    (:objects
        depot0 - depot
        depot1 - depot
        depot2 - depot
        distributor0 - distributor
        crate0 - crate
        crate1 - crate
        crate2 - crate
        hoist0 - hoist
        hoist1 - hoist
        hoist2 - hoist
        hoist3 - hoist
        pallet0 - pallet
        pallet1 - pallet
        pallet2 - pallet
        pallet3 - pallet
        truck0 - truck
        truck1 - truck
        truck2 - truck
    )
    (:init
        ; Hoist locations
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)

        ; Pallet fixed locations
        (at_surface_loc pallet0 depot0)
        (at_surface_loc pallet1 depot1)
        (at_surface_loc pallet2 depot2)
        (at_surface_loc pallet3 distributor0)

        ; Truck locations
        (at truck0 distributor0)
        (at truck1 depot1)
        (at truck2 depot2)

        ; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Stacking and crate locations (explicitly stated, as implied facts are not derived in STRIPS)
        (on crate0 pallet1)
        (at_surface_loc crate0 depot1) ; Required for lift_crate precondition
        (on crate1 crate0)
        (at_surface_loc crate1 depot1) ; Required for lift_crate precondition
        (on crate2 pallet3)
        (at_surface_loc crate2 distributor0) ; Required for lift_crate precondition

        ; Clear status of surfaces (only clear ones are listed, others are implicitly not clear)
        (clear crate1)
        (clear crate2)
        (clear pallet0)
        (clear pallet2)

        ; Road connectivity (all distinct places are connected, explicitly listed for STRIPS)
        (road depot0 depot1) (road depot1 depot0)
        (road depot0 depot2) (road depot2 depot0)
        (road depot0 distributor0) (road distributor0 depot0)
        (road depot1 depot2) (road depot2 depot1)
        (road depot1 distributor0) (road distributor0 depot1)
        (road depot2 distributor0) (road distributor0 depot2)
    )
    (:goal (and
        (on crate0 pallet0)
        (on crate1 crate2)
        (on crate2 pallet3)
    ))
)