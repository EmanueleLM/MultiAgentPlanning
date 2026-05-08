(define (problem depots6-problem)
    (:domain depots6)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 pallet3 - pallet
        hoist0 hoist1 hoist2 hoist3 - hoist
        truck0 truck1 truck2 - truck
    )
    (:init
        ;; Roads (all places are directly connected)
        (road depot0 depot1) (road depot0 depot2) (road depot0 distributor0)
        (road depot1 depot0) (road depot1 depot2) (road depot1 distributor0)
        (road depot2 depot0) (road depot2 depot1) (road depot2 distributor0)
        (road distributor0 depot0) (road distributor0 depot1) (road distributor0 depot2)

        ;; Object Locations
        (at crate0 depot2)
        (at crate1 depot0)
        (at crate2 depot0)
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)
        (at truck0 distributor0)
        (at truck1 distributor0)
        (at truck2 depot2)

        ;; Hoist Availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ;; Stacking
        (on crate0 pallet2)
        (on crate1 pallet0)
        (on crate2 crate1)

        ;; Clear Status (Explicitly stated in problem, and inferred)
        (clear crate0) ; crate0 is clear on top
        (clear crate2) ; crate2 is clear on top
        (clear pallet1)
        (clear pallet3)
        ;; Inferred NOT clear predicates due to stacking:
        ;; (not (clear pallet2)) because (on crate0 pallet2)
        ;; (not (clear pallet0)) because (on crate1 pallet0)
        ;; (not (clear crate1)) because (on crate2 crate1)
    )
    (:goal (and
        (on crate0 crate2)
        (on crate1 pallet2)
        (on crate2 pallet1)
    ))
)