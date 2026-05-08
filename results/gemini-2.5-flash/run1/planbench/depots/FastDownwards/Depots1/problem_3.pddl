(define (problem depots1-instance)
    (:domain depots1)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
    )
    (:init
        ; Locations (at)
        (at crate0 depot0)
        (at crate1 depot0)
        (at crate2 depot2)

        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)

        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)

        (at truck0 depot0)
        (at truck1 depot1)
        (at truck2 depot0)

        ; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Clear status
        (clear crate1)
        (clear crate2)
        (clear pallet1)
        (clear pallet3)

        ; Stacking (on)
        (on crate0 pallet0)
        (on crate1 crate0)
        (on crate2 pallet2)

        ; Inferred non-clear status based on 'on' relations
        (not (clear pallet0))
        (not (clear crate0)) ; crate1 is on crate0
        (not (clear pallet2))
    )
    (:goal (and
        (on crate0 pallet3)
        (on crate1 pallet0)
        (on crate2 crate0)
    ))
)