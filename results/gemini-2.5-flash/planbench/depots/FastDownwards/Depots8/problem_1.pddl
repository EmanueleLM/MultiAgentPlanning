(define (problem depots8-problem)
    (:domain depots8)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        hoist0 hoist1 hoist2 hoist3 - hoist
        truck0 truck1 truck2 - truck
    )
    (:init
        ; Place definitions for places
        ; (These are not needed as places are types and not "at" other places)

        ; Object locations
        (at crate0 depot1)
        (at crate1 distributor0)
        (at crate2 depot1)

        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)

        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)

        (at truck0 depot1)
        (at truck1 depot2)
        (at truck2 distributor0)

        ; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Clear status for surfaces
        (clear crate1)
        (clear crate2)
        (clear pallet0)
        (clear pallet2)
        ; Inferred 'not clear' statuses based on 'on' relations:
        ; crate0 is NOT clear because crate2 is on it.
        ; pallet1 is NOT clear because crate0 is on it.
        ; pallet3 is NOT clear because crate1 is on it.

        ; 'on' relations
        (on crate0 pallet1)
        (on crate1 pallet3)
        (on crate2 crate0)
    )
    (:goal (and
        (on crate0 pallet0)
        (on crate2 pallet1)
    ))
)