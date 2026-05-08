(define (problem depots11-problem)
    (:domain depots11)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        crate0 crate1 crate2 - crate
        hoist0 hoist1 hoist2 hoist3 - hoist
        pallet0 pallet1 pallet2 pallet3 - pallet
        truck0 truck1 truck2 - truck
    )
    (:init
        ; Object locations
        (at crate0 depot0)
        (at crate1 depot0)
        (at crate2 depot0)
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)
        (at truck0 distributor0)
        (at truck1 depot0)
        (at truck2 depot0)

        ; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Stacking relations
        (on crate0 pallet0)
        (on crate1 crate0)
        (on crate2 crate1)

        ; Clear status (explicitly stated)
        (clear crate2)
        (clear pallet1)
        (clear pallet2)
        (clear pallet3)

        ; Derived clear status (from stacking relations)
        (not (clear crate0)) ; because crate1 is on it
        (not (clear crate1)) ; because crate2 is on it
        (not (clear pallet0)) ; because crate0 is on it

        ; Road connectivity (full mesh between all specified places)
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
        (on crate0 pallet1)
        (on crate1 crate2)
        (on crate2 pallet0)
    ))