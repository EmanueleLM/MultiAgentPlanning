(define (problem depots14_problem)
    (:domain depots14)
    (:objects
        depot0 depot1 depot2 - depot ; Type changed from place to depot
        distributor0 - distributor ; Type changed from place to distributor

        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate

        hoist0 hoist1 hoist2 hoist3 - hoist
        truck0 truck1 truck2 - truck
    )
    (:init
        ; Places of pallets
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)

        ; Places of hoists
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)

        ; Places of trucks
        (at truck0 distributor0)
        (at truck1 depot0)
        (at truck2 depot0)

        ; Crates and their initial positions/stacking
        ; crate0 is at depot2, on pallet2
        (at crate0 depot2)
        (on crate0 pallet2)
        ; crate1 is at distributor0, on pallet3
        (at crate1 distributor0)
        (on crate1 pallet3)
        ; crate2 is at distributor0, on crate1
        (at crate2 distributor0)
        (on crate2 crate1)

        ; Hoists are available
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Clear states
        ; Explicitly stated clear:
        (clear crate0)
        (clear crate2)
        (clear pallet0)
        (clear pallet1)
        ; Implied not clear states, added for completeness:
        (not (clear pallet2)) ; because crate0 is on pallet2
        (not (clear pallet3)) ; because crate1 is on pallet3
        (not (clear crate1))  ; because crate2 is on crate1
    )
    (:goal (and
        (on crate0 pallet0)
        (on crate1 pallet2)
        (on crate2 pallet1)
    ))