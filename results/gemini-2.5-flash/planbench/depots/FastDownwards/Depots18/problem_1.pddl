(define (problem depots-18)
    (:domain depots)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 pallet3 - pallet
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
    )
    (:init
        ;; Initial locations
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

        ;; Initial availability of hoists
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ;; Initial stacking relations
        (on crate0 pallet1)
        (on crate1 pallet0)
        (on crate2 pallet3)

        ;; Initial clear status of surfaces
        (clear crate0)
        (clear crate1)
        (clear crate2)
        (clear pallet2) ; Pallet2 is initially empty/clear

        ;; Inferred non-clear status based on stacking
        (not (clear pallet0)) ; Crate1 is on pallet0
        (not (clear pallet1)) ; Crate0 is on pallet1
        (not (clear pallet3)) ; Crate2 is on pallet3
    )
    (:goal (and
        (on crate0 crate2)
        (on crate1 pallet2)
        (on crate2 pallet3)
    ))
)