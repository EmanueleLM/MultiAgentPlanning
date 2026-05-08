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
        ; Object locations
        (at crate0 distributor0)
        (at crate1 distributor0)
        (at crate2 distributor0)
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)
        (at truck0 depot0)
        (at truck1 depot0)
        (at truck2 depot1)

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

        ; Implied (not clear) initial facts due to stacking:
        ; (not (clear pallet3)) because crate0 is on it
        ; (not (clear crate0)) because crate1 is on it
        ; (not (clear crate1)) because crate2 is on it
        ; These are handled by PDDL's closed-world assumption (not explicitly stated means false).
    )
    (:goal (and
        (on crate1 pallet1)
        (on crate2 pallet2)
    ))
)