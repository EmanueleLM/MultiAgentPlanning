(define (problem depots-p21)
    (:domain depots)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 pallet3 - pallet
    )

    (:init
        (= (total-cost) 0)

        ; Connectivity (All pairs connected)
        (connected depot0 depot1) (connected depot1 depot0)
        (connected depot0 depot2) (connected depot2 depot0)
        (connected depot0 distributor0) (connected distributor0 depot0)
        (connected depot1 depot2) (connected depot2 depot1)
        (connected depot1 distributor0) (connected distributor0 depot1)
        (connected depot2 distributor0) (connected distributor0 depot2)

        ; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Locations
        (at crate0 distributor0)
        (at crate1 depot1)
        (at crate2 distributor0)

        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)

        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)

        (at truck0 depot0)
        (at truck1 depot0)
        (at truck2 depot2)

        ; Relationships (On)
        (on crate0 pallet3)
        (on crate1 pallet1)
        (on crate2 crate0)

        ; Clearance (Items with nothing on them)
        (clear crate1)
        (clear crate2)
        (clear pallet0)
        (clear pallet2)
    )

    (:goal (and
        (on crate0 pallet2)
        (on crate1 pallet0)
        (on crate2 crate1)
    ))

    (:metric minimize (total-cost))
)