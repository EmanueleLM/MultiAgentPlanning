(define (problem depots-9)
    (:domain depots)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        crate0 crate1 crate2 - crate
        hoist0 hoist1 hoist2 hoist3 - hoist
        pallet0 pallet1 pallet2 pallet3 - pallet
        truck0 truck1 truck2 - truck
    )
    (:init
        (= (total-cost) 0)
        ; Initial Location Status
        (at crate0 depot1)
        (at crate1 depot2)
        (at crate2 distributor0)

        ; Initial Hoist Status
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Initial Truck Status
        (at truck0 distributor0)
        (at truck1 depot2)
        (at truck2 depot0)

        ; Initial Pallet Status
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)

        ; Initial Relationships
        (on crate0 pallet1)
        (on crate1 pallet2)
        (on crate2 pallet3)

        (clear crate0)
        (clear crate1)
        (clear crate2)
        (clear pallet0)
    )
    (:goal (and
        (on crate0 pallet1)
        (on crate1 pallet2)
        (on crate2 pallet0)
    ))
    (:metric minimize (total-cost))
)