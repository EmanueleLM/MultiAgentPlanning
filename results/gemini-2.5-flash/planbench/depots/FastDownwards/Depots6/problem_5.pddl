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
        ;; Roads (all places are directly connected bidirectionally)
        (road depot0 depot1) (road depot0 depot2) (road depot0 distributor0)
        (road depot1 depot0) (road depot1 depot2) (road depot1 distributor0)
        (road depot2 depot0) (road depot2 depot1) (road depot2 distributor0)
        (road distributor0 depot0) (road distributor0 depot1) (road distributor0 depot2)

        ;; Object Locations for locatable entities
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

        ;; Crate Locations (explicitly stated, consistent with what they are on)
        (at crate0 depot2) ; crate0 is on pallet2, pallet2 is at depot2
        (at crate1 depot0) ; crate1 is on pallet0, pallet0 is at depot0
        (at crate2 depot0) ; crate2 is on crate1, crate1 is at depot0

        ;; Hoist Availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ;; Stacking
        (on crate0 pallet2)
        (on crate1 pallet0)
        (on crate2 crate1)

        ;; Clear Status
        (clear crate0)
        (clear crate2)
        (clear pallet1)
        (clear pallet3)
        ;; The following are implicitly NOT clear due to objects on them (no (clear X) fact present):
        ;; pallet0 (because crate1 is on it)
        ;; pallet2 (because crate0 is on it)
        ;; crate1 (because crate2 is on it)
    )
    (:goal (and
        (on crate0 crate2)
        (on crate1 pallet2)
        (on crate2 pallet1)
    ))
)