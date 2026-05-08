(define (problem depots17)
    (:domain depots)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        crate0 crate1 crate2 - crate
        hoist0 hoist1 hoist2 hoist3 - hoist
        pallet0 pallet1 pallet2 pallet3 - pallet
        truck0 truck1 truck2 - truck
    )
    (:init
        ; Locations of places (static for pallets)
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)

        ; Initial locations of movable objects
        (at crate0 distributor0)
        (at crate1 distributor0)
        (at crate2 depot1)
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)
        (at truck0 distributor0)
        (at truck1 depot2)
        (at truck2 distributor0)

        ; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; On relations
        (on crate0 pallet3)
        (on crate1 crate0)
        (on crate2 pallet1)

        ; Clearance states as specified and inferred
        (clear crate1)
        (clear crate2)
        (clear pallet0)
        (clear pallet2)
        (not (clear crate0))   ; crate1 is on crate0
        (not (clear pallet1))  ; crate2 is on pallet1
        (not (clear pallet3))  ; crate0 is on pallet3
    )
    (:goal (and
        (on crate0 pallet0)
        (on crate1 pallet2)
        (on crate2 pallet3)
    ))