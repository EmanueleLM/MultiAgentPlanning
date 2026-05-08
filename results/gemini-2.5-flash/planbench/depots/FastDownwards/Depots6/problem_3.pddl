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

        ;; Hoist Availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ;; Stacking (Crate locations are derived from these and pallet/crate locations)
        ;; crate0 is at depot2 because it's on pallet2, which is at depot2
        (on crate0 pallet2)
        ;; crate1 is at depot0 because it's on pallet0, which is at depot0
        (on crate1 pallet0)
        ;; crate2 is at depot0 because it's on crate1, which is on pallet0, which is at depot0
        (on crate2 crate1)

        ;; Clear Status (Explicitly stated in problem, and inferred by closed world assumption)
        (clear crate0)  ; crate0 is clear on top
        (clear crate2)  ; crate2 is clear on top
        (clear pallet1) ; pallet1 is clear
        (clear pallet3) ; pallet3 is clear
        ;; The following are implicitly NOT clear:
        ;; pallet2 (crate0 is on it)
        ;; pallet0 (crate1 is on it)
        ;; crate1 (crate2 is on it)
    )
    (:goal (and
        (on crate0 crate2)
        (on crate1 pallet2)
        (on crate2 pallet1)
    ))