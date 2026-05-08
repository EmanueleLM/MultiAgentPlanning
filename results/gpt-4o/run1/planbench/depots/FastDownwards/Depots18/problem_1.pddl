(define (problem logistics-instance)
    (:domain logistics)
    (:objects
        depot0 - place
        depot1 - place
        depot2 - place
        distributor0 - place
        pallet0 - pallet
        pallet1 - pallet
        pallet2 - pallet
        pallet3 - pallet
        crate0 - crate
        crate1 - crate
        crate2 - crate
        truck0 - truck
        truck1 - truck
        truck2 - truck
        hoist0 - hoist
        hoist1 - hoist
        hoist2 - hoist
        hoist3 - hoist
    )
    (:init
        (at crate0 depot1)
        (at crate1 depot0)
        (at crate2 distributor0)
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)
        (at truck0 depot0)
        (at truck1 depot0)
        (at truck2 distributor0)
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)
        (clear crate0)
        (clear crate1)
        (clear crate2)
        (clear pallet2)
        (on crate0 pallet1)
        (on crate1 pallet0)
        (on crate2 pallet3)
    )
    (:goal (and
        (on crate0 crate2)
        (on crate1 pallet2)
        (on crate2 pallet3)
    ))
)