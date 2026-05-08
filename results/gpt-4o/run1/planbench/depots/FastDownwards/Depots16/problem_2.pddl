(define (problem logistics_problem)
    (:domain logistics)
    (:objects
        depot0 depot1 depot2 distributor0 - place
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 pallet3 - pallet
    )
    (:init
        ; Locations
        (at crate0 depot0)
        (at crate1 depot2)
        (at crate2 depot0)
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)
        (truck_at truck0 depot0)
        (truck_at truck1 depot1)
        (truck_at truck2 depot2)

        ; Hoist availability
        (hoist_available hoist0)
        (hoist_available hoist1)
        (hoist_available hoist2)
        (hoist_available hoist3)

        ; Clear status
        (clear crate1)
        (clear crate2)
        (clear pallet1)
        (clear pallet3)

        ; On status
        (on crate0 pallet0)
        (on crate1 pallet2)
        (on crate2 crate0)
    )
    (:goal
        (and
            (on crate0 crate1)
            (on crate1 pallet0)
            (on crate2 pallet2)
        )
    )
)