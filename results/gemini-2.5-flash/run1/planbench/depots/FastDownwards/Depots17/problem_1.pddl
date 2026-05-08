(define (problem depots17-problem)
    (:domain depots17)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        crate0 crate1 crate2 - crate
        hoist0 hoist1 hoist2 hoist3 - hoist
        pallet0 pallet1 pallet2 pallet3 - pallet
        truck0 truck1 truck2 - truck
    )

    (:init
        ; Places and roads
        (road depot0 depot1)
        (road depot0 depot2)
        (road depot0 distributor0)
        (road depot1 depot0)
        (road depot1 depot2)
        (road depot1 distributor0)
        (road depot2 depot0)
        (road depot2 depot1)
        (road depot2 distributor0)
        (road distributor0 depot0)
        (road distributor0 depot1)
        (road distributor0 depot2)

        ; Object locations
        (at crate0 distributor0)
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
        (at truck0 distributor0)
        (at truck1 depot2)
        (at truck2 distributor0)

        ; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Initial stacking and clearance
        (on crate0 pallet3)
        (on crate1 crate0)
        (on crate2 pallet1)

        (clear crate1) ; as stated
        (clear crate2) ; as stated
        (clear pallet0) ; as stated
        (clear pallet2) ; as stated

        ; Inferred non-clear objects
        (not (clear pallet3)) ; because crate0 is on pallet3
        (not (clear crate0)) ; because crate1 is on crate0
        (not (clear pallet1)) ; because crate2 is on pallet1
    )

    (:goal (and
        (on crate0 pallet0)
        (on crate1 pallet2)
        (on crate2 pallet3)
    ))
)