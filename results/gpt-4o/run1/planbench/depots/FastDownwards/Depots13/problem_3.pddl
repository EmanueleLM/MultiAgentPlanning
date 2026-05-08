(define (problem logistics-problem)
    (:domain logistics-domain)
    (:objects
        depot0 depot1 depot2 distributor0 - place
        pallet0 pallet1 pallet2 pallet3 - surface
        crate0 crate1 crate2 - crate
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
    )
    (:init
        (at-crate crate0 depot2)
        (at-crate crate1 depot0)
        (at-crate crate2 depot1)

        (at-hoist hoist0 depot0)
        (at-hoist hoist1 depot1)
        (at-hoist hoist2 depot2)
        (at-hoist hoist3 distributor0)

        (at truck0 depot2)
        (at truck1 distributor0)
        (at truck2 distributor0)

        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        (clear crate0)
        (clear crate1)
        (clear pallet3)

        (on crate0 pallet2)
        (on crate1 pallet0)
        (on crate2 pallet1)
    )
    (:goal
        (and
            (on crate0 pallet1)
            (on-crate crate2 crate0)
        )
    )
)