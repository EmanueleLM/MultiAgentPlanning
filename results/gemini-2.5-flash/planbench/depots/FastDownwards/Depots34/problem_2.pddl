(define (problem depots34)
    (:domain depots)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        hoist0 hoist1 hoist2 hoist3 - hoist
        truck0 truck1 truck2 - truck
    )
    (:init
        ; Connectivity: "Depots and distributors are directly connected by roads"
        (connected depot0 depot1) (connected depot0 depot2) (connected depot0 distributor0)
        (connected depot1 depot0) (connected depot1 depot2) (connected depot1 distributor0)
        (connected depot2 depot0) (connected depot2 depot1) (connected depot2 distributor0)
        (connected distributor0 depot0) (connected distributor0 depot1) (connected distributor0 depot2)

        ; Object locations
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
        (at truck0 depot1)
        (at truck1 depot1)
        (at truck2 depot0)

        ; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Initial stacking
        (on crate0 pallet2)
        (on crate1 crate0)
        (on crate2 crate1)

        ; Initial clear states (as specified and inferred)
        (clear crate2) ; As stated, and consistent with being top of its stack
        (clear pallet0)
        (clear pallet1)
        (clear pallet3)
        ; Inferred non-clear states based on initial stacking
        (not (clear pallet2)) ; crate0 is on pallet2
        (not (clear crate0))  ; crate1 is on crate0
        (not (clear crate1))  ; crate2 is on crate1
    )
    (:goal (and
        (on crate0 crate2)
        (on crate2 pallet1)
    ))
)