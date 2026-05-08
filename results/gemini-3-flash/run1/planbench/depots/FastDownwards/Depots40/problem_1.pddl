(define (problem depots40)
    (:domain depots)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
    )

    (:init
        ;; Places and their contents
        (at pallet0 depot0)
        (at truck0 depot0)
        (at hoist0 depot0)
        (available hoist0)
        (clear pallet0)

        (at pallet1 depot1)
        (at truck2 depot1)
        (at hoist1 depot1)
        (at crate2 depot1)
        (on crate2 pallet1)
        (available hoist1)
        (clear crate2)

        (at pallet2 depot2)
        (at truck1 depot2)
        (at hoist2 depot2)
        (available hoist2)
        (clear pallet2)

        (at pallet3 distributor0)
        (at hoist3 distributor0)
        (at crate0 distributor0)
        (at crate1 distributor0)
        (on crate0 pallet3)
        (on crate1 crate0)
        (available hoist3)
        (clear crate1)
    )

    (:goal (and
        (on crate0 pallet1)
        (on crate1 pallet3)
        (on crate2 pallet2)
    ))
)