(define (problem depots0-instance)
    (:domain depots0)

    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 pallet3 - pallet
        hoist0 hoist1 hoist2 hoist3 - hoist
        truck0 truck1 truck2 - truck
    )

    (:init
        ; Locations of all objects
        (at crate0 depot1)
        (at crate1 depot1)
        (at crate2 depot0)
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)
        (at truck0 depot1)
        (at truck1 depot1)
        (at truck2 distributor0)

        ; Hoist availability
        (hoist_available hoist0)
        (hoist_available hoist1)
        (hoist_available hoist2)
        (hoist_available hoist3)

        ; Initial stacking configuration
        (on crate0 pallet1)
        (on crate1 crate0)
        (on crate2 pallet0)

        ; Initial clearness conditions explicitly stated or derived from stacking
        (clear crate1)   ; Nothing is on crate1
        (clear crate2)   ; Nothing is on crate2
        (clear pallet2)  ; Nothing is on pallet2
        (clear pallet3)  ; Nothing is on pallet3

        ; Derived 'not clear' conditions based on initial stacking
        (not (clear pallet1)) ; crate0 is on pallet1
        (not (clear crate0))  ; crate1 is on crate0
        (not (clear pallet0)) ; crate2 is on pallet0
    )

    (:goal (and
        (on crate1 pallet1)
        (on crate2 pallet3)
    ))
)