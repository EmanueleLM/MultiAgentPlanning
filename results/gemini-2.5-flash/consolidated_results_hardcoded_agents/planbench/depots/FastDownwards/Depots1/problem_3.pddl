(define (problem depots1-p)
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
        (= (total-cost) 0)

        ; Locations
        (at crate0 depot0) (at crate1 depot0) (at crate2 depot2)
        (at hoist0 depot0) (at hoist1 depot1) (at hoist2 depot2) (at hoist3 distributor0)
        (at pallet0 depot0) (at pallet1 depot1) (at pallet2 depot2) (at pallet3 distributor0)
        (at truck0 depot0) (at truck1 depot1) (at truck2 depot0)

        ; Availability
        (available hoist0) (available hoist1) (available hoist2) (available hoist3)

        ; Stacking
        (on crate0 pallet0)
        (on crate1 crate0)
        (on crate2 pallet2)

        ; Clear status
        (clear crate1)
        (clear crate2)
        (clear pallet1)
        (clear pallet3)
    )
    (:goal (and
        (on crate0 pallet3)
        (on crate1 pallet0)
        (on crate2 crate0)
    ))
    (:metric minimize (total-cost))
)