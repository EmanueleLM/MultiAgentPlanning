(define (problem depots_problem)
    (:domain depots_domain)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        hoist0 hoist1 hoist2 hoist3 - hoist
        truck0 truck1 truck2 - truck
    )
    (:init
        ;; Connectivity: All places are directly connected
        (connected depot0 depot1) (connected depot0 depot2) (connected depot0 distributor0)
        (connected depot1 depot0) (connected depot1 depot2) (connected depot1 distributor0)
        (connected depot2 depot0) (connected depot2 depot1) (connected depot2 distributor0)
        (connected distributor0 depot0) (connected distributor0 depot1) (connected distributor0 depot2)

        ;; Object Locations
        (at crate0 depot1)
        (at crate1 distributor0)
        (at crate2 depot1)

        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)

        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)

        (at truck0 depot1)
        (at truck1 depot2)
        (at truck2 distributor0)

        ;; Hoist Availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ;; On relations and derived clear/not clear states based on initial stacking
        ;; crate0 is on pallet1. Implies pallet1 is not clear, and crate0 is at depot1.
        (on crate0 pallet1)
        (not (clear pallet1))

        ;; crate1 is on pallet3. Implies pallet3 is not clear, and crate1 is at distributor0.
        (on crate1 pallet3)
        (not (clear pallet3))
        (clear crate1) ; Explicitly stated in problem

        ;; crate2 is on crate0. Implies crate0 is not clear, and crate2 is at depot1.
        (on crate2 crate0)
        (not (clear crate0))
        (clear crate2) ; Explicitly stated in problem

        ;; Other explicitly stated clear states
        (clear pallet0)
        (clear pallet2)
    )
    (:goal (and
        (on crate0 pallet0)
        (on crate2 pallet1)
    ))