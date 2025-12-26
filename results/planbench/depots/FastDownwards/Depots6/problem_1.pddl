(define (problem depots-6-1)
    (:domain depots-6)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 pallet3 - pallet
        hoist0 hoist1 hoist2 hoist3 - hoist
        truck0 truck1 truck2 - truck
    )

    (:init
        ; Connectivity
        (connected depot0 depot1) (connected depot1 depot0)
        (connected depot0 depot2) (connected depot2 depot0)
        (connected depot0 distributor0) (connected distributor0 depot0)
        (connected depot1 depot2) (connected depot2 depot1)
        (connected depot1 distributor0) (connected distributor0 depot1)
        (connected depot2 distributor0) (connected distributor0 depot2)

        ; Locations
        (at crate0 depot2) (at crate1 depot0) (at crate2 depot0)
        (at hoist0 depot0) (at hoist1 depot1) (at hoist2 depot2) (at hoist3 distributor0)
        (at pallet0 depot0) (at pallet1 depot1) (at pallet2 depot2) (at pallet3 distributor0)
        (at truck0 distributor0) (at truck1 distributor0) (at truck2 depot2)

        ; Status: Availability
        (available hoist0) (available hoist1) (available hoist2) (available hoist3)

        ; Stacking:
        (on crate0 pallet2)
        (on crate1 pallet0)
        (on crate2 crate1)

        ; Clear status (Crate0, Crate2, Pallet1, Pallet3 are clear)
        (clear crate0) (clear crate2) (clear pallet1) (clear pallet3)

        (= (total-cost) 0)
    )

    (:goal (and
        (on crate0 crate2)
        (on crate1 pallet2)
        (on crate2 pallet1)
    ))

    (:metric minimize (total-cost))
)