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
        (at_surface pallet0 depot0)
        (at_surface pallet1 depot1)
        (at_surface pallet2 depot2)
        (at_surface pallet3 distributor0)

        ; Initial locations of movable objects
        (at_surface crate0 distributor0)
        (at_surface crate1 distributor0)
        (at_surface crate2 depot1)
        (at_hoist hoist0 depot0)
        (at_hoist hoist1 depot1)
        (at_hoist hoist2 depot2)
        (at_hoist hoist3 distributor0)
        (at_truck truck0 distributor0)
        (at_truck truck1 depot2)
        (at_truck truck2 distributor0)

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
)