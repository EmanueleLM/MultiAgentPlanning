(define (problem depots34)
    (:domain depots)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        hoist0 hoist1 hoist2 hoist3 - hoist
        truck0 truck1 truck2 - truck
    )
    (:init
        (connected depot0 depot1) (connected depot0 depot2) (connected depot0 distributor0)
        (connected depot1 depot0) (connected depot1 depot2) (connected depot1 distributor0)
        (connected depot2 depot0) (connected depot2 depot1) (connected depot2 distributor0)
        (connected distributor0 depot0) (connected distributor0 depot1) (connected distributor0 depot2)

        (at crate0 depot2)
        (at crate1 depot2)
        (at crate2 depot2)
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
        (at truck2 depot0)

        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        (on crate0 pallet2)
        (on crate1 crate0)
        (on crate2 crate1)

        (clear crate2)
        (clear pallet0)
        (clear pallet1)
        (clear pallet3)
        ; (not (clear pallet2)) is implied by (on crate0 pallet2) and CWA
        ; (not (clear crate0)) is implied by (on crate1 crate0) and CWA
        ; (not (clear crate1)) is implied by (on crate2 crate1) and CWA
    )
    (:goal (and
        (on crate0 crate2)
        (on crate2 pallet1)
    ))
)