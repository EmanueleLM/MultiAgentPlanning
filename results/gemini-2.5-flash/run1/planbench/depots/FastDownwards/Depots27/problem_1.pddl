(define (problem depots-27-problem)
    (:domain depots-domain)
    (:objects
        depot0 depot1 depot2 distributor0 - location
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
    )
    (:init
        ;; Initial locations
        (at truck0 depot0)
        (at truck1 depot0)
        (at truck2 depot1)

        (at hoist0 depot0)
        (at pallet0 depot0)
        (at crate0 depot0)
        (at crate1 depot0)

        (at hoist1 depot1)
        (at pallet1 depot1)
        (at crate2 depot1)

        (at hoist2 depot2)
        (at pallet2 depot2)

        (at hoist3 distributor0)
        (at pallet3 distributor0)

        ;; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ;; Stacking information
        (on crate1 crate0)
        (on crate0 pallet0)
        (on crate2 pallet1)

        ;; Clear objects (ready to be lifted or stacked upon)
        (clear crate1)
        (clear crate2)
        (clear pallet2)
        (clear pallet3)

        ;; All places are connected (fully connected graph)
        (connected depot0 depot1)
        (connected depot1 depot0)
        (connected depot0 depot2)
        (connected depot2 depot0)
        (connected depot0 distributor0)
        (connected distributor0 depot0)
        (connected depot1 depot2)
        (connected depot2 depot1)
        (connected depot1 distributor0)
        (connected distributor0 depot1)
        (connected depot2 distributor0)
        (connected distributor0 depot2)

        ;; Initialize total-cost
        (= (total-cost) 0)
    )
    (:goal (and
        (on crate0 pallet3)
        (on crate1 pallet0)
    ))
    (:metric minimize (total-cost))
)