(define (problem depots35-problem)
    (:domain depots35)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        hoist0 hoist1 hoist2 hoist3 - hoist
        truck0 truck1 truck2 - truck
    )
    (:init
        ;; Object locations
        (at crate0 depot2)
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

        (at truck0 depot0)
        (at truck1 distributor0)
        (at truck2 depot1)

        ;; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ;; Surface clarity (explicitly clear initially, or not clear due to stacking)
        (clear crate1)
        (clear crate2)
        (clear pallet0)
        (clear pallet1)

        ;; Stacking relations
        (on crate0 pallet2)
        (not (clear pallet2))
        (on crate1 pallet3)
        (not (clear pallet3))
        (on crate2 crate0)
        (not (clear crate0))

        ;; Road connections (all places are mutually connected)
        (road depot0 depot1)
        (road depot1 depot0)
        (road depot0 depot2)
        (road depot2 depot0)
        (road depot0 distributor0)
        (road distributor0 depot0)
        (road depot1 depot2)
        (road depot2 depot1)
        (road depot1 distributor0)
        (road distributor0 depot1)
        (road depot2 distributor0)
        (road distributor0 depot2)
    )
    (:goal (and
        (on crate0 pallet0)
        (on crate1 pallet1)
    ))
)