(define (problem depots19-problem)
    (:domain depots19)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        hoist0 hoist1 hoist2 hoist3 - hoist
        truck0 truck1 truck2 - truck
    )
    (:init
        ;; Locations
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
        (at truck0 depot0)
        (at truck1 depot2)
        (at truck2 distributor0)

        ;; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ;; Clear status
        (clear crate1)
        (clear crate2)
        (clear pallet1)
        (clear pallet3)
        ;; Note: pallet0, crate0, pallet2 are implicitly (not (clear ...)) due to objects on them.

        ;; Stacking
        (on crate0 pallet0)
        (on crate1 crate0)
        (on crate2 pallet2)
    )
    (:goal (and
        (on crate0 crate1)
        (on crate1 pallet1)
    ))
)