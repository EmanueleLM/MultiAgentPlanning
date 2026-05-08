(define (problem depots38-problem)
        (:domain depots38)
        (:objects
            depot0 - depot
            depot1 - depot
            depot2 - depot
            distributor0 - distributor
            pallet0 - pallet
            pallet1 - pallet
            pallet2 - pallet
            pallet3 - pallet
            crate0 - crate
            crate1 - crate
            crate2 - crate
            hoist0 - hoist
            hoist1 - hoist
            hoist2 - hoist
            hoist3 - hoist
            truck0 - truck
            truck1 - truck
            truck2 - truck
        )
        (:init
            (at crate0 depot0)
            (at crate1 depot0)
            (at crate2 depot2)
            (at hoist0 depot0)
            (at hoist1 depot1)
            (at hoist2 depot2)
            (at hoist3 distributor0)
            (at pallet0 depot0)
            (at pallet1 depot1)
            (at pallet2 depot2)
            (at pallet3 distributor0)
            (at truck0 depot2)
            (at truck1 distributor0)
            (at truck2 depot0)
            (available hoist0)
            (available hoist1)
            (available hoist2)
            (available hoist3)
            (clear crate1)
            (clear crate2)
            (clear pallet1)
            (clear pallet3)
            (on crate0 pallet0)
            (on crate1 crate0)
            (on crate2 pallet2)
            (not (clear pallet0)) ; Implied by (on crate0 pallet0)
            (not (clear crate0))  ; Implied by (on crate1 crate0)
            (not (clear pallet2)) ; Implied by (on crate2 pallet2)
        )
        (:goal
            (and (on crate0 pallet1)
                 (on crate2 crate0)))
    )