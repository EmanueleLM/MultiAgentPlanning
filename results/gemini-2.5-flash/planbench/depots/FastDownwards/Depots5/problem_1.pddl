(define (problem depots5)
    (:domain depots)
    (:objects
        depot0 - depot
        depot1 - depot
        depot2 - depot
        distributor0 - distributor

        hoist0 hoist1 hoist2 hoist3 - hoist

        crate0 crate1 crate2 - crate

        pallet0 pallet1 pallet2 pallet3 - pallet

        truck0 truck1 truck2 - truck
    )

    (:init
        ;; Initial locations for all objects that can move or have a specific fixed location
        (at crate0 distributor0)
        (at crate1 distributor0)
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
        (at truck2 depot1)

        ;; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ;; Explicitly stated clear surfaces
        (clear crate2)
        (clear pallet0)
        (clear pallet1)
        (clear pallet2)

        ;; Explicitly stated 'on' relations
        (on crate0 pallet3)
        (on crate1 crate0)
        (on crate2 crate1)

        ;; Implied 'not clear' facts derived from 'on' relations
        (not (clear pallet3)) ; because crate0 is on it
        (not (clear crate0))  ; because crate1 is on it
        (not (clear crate1))  ; because crate2 is on it
    )

    (:goal (and
        (on crate1 pallet1)
        (on crate2 pallet2)
    ))
)