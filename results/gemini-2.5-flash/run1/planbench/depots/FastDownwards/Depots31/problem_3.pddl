(define (problem depots31-problem)
    (:domain depots31)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        hoist0 hoist1 hoist2 hoist3 - hoist
        truck0 truck1 truck2 - truck
    )
    (:init
        (at_loc crate0 depot1)
        (at_loc crate1 depot1)
        (at_loc crate2 distributor0)
        (at_loc hoist0 depot0)
        (at_loc hoist1 depot1)
        (at_loc hoist2 depot2)
        (at_loc hoist3 distributor0)
        (at_loc pallet0 depot0)
        (at_loc pallet1 depot1)
        (at_loc pallet2 depot2)
        (at_loc pallet3 distributor0)
        (at_loc truck0 distributor0)
        (at_loc truck1 depot1)
        (at_loc truck2 depot2)

        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        (on crate0 pallet1)
        (on crate1 crate0)
        (on crate2 pallet3)
        (clear crate1)
        (clear crate2)
        (clear pallet0)
        (clear pallet2)

        (connected depot0 depot1)
        (connected depot0 depot2)
        (connected depot0 distributor0)
        (connected depot1 depot0)
        (connected depot1 depot2)
        (connected depot1 distributor0)
        (connected depot2 depot0)
        (connected depot2 depot1)
        (connected depot2 distributor0)
        (connected distributor0 depot0)
        (connected distributor0 depot1)
        (connected distributor0 depot2)
    )
    (:goal (and
        (on crate0 pallet0)
        (on crate1 crate2)
        (on crate2 pallet3)
    ))