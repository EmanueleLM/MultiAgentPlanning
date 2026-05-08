(define (problem Depots25-problem)
    (:domain Depots25)
    (:objects
        depot0 depot1 depot2 distributor0 - place
        crate0 crate1 crate2 - crate
        hoist0 hoist1 hoist2 hoist3 - hoist
        pallet0 pallet1 pallet2 pallet3 - pallet
        truck0 truck1 truck2 - truck
    )
    (:init
        ;; Initial Locations
        (at crate0 depot2)
        (at crate1 depot2)
        (at crate2 depot2)

        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)

        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)

        (at truck0 distributor0)
        (at truck1 depot1)
        (at truck2 distributor0)

        ;; Initial State Predicates
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        (clear crate2) ; Crate2 is at the top of its stack, so it's clear
        (clear pallet0)
        (clear pallet1)
        (clear pallet3)

        ;; Initial Stacking
        (on crate0 pallet2)
        (on crate1 crate0)
        (on crate2 crate1)
        ;; Implied (not (clear ...)) predicates from stacking:
        ;; (not (clear pallet2)) because crate0 is on it.
        ;; (not (clear crate0)) because crate1 is on it.
        ;; (not (clear crate1)) because crate2 is on it.
        ;; These are implicitly false because they are not listed as true.
    )
    (:goal (and
        (on crate1 crate2)
        (on crate2 pallet2)
    ))
)