(define (problem Depots19)
    (:domain Depots)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        hoist0 hoist1 hoist2 hoist3 - hoist
        truck0 truck1 truck2 - truck
    )
    (:init
        ; Locations of Surfaces (Pallets and Crates)
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)
        (at crate0 depot0)
        (at crate1 depot0)
        (at crate2 depot2)

        ; Locations of Movable Objects (Trucks and Hoists)
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)
        (at truck0 depot0)
        (at truck1 depot2)
        (at truck2 distributor0)

        ; Hoist Availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Stacking relationships
        (on crate0 pallet0)
        (on crate1 crate0)
        (on crate2 pallet2)

        ; Clearance facts
        (clear crate1)
        (clear crate2)
        (clear pallet1)
        (clear pallet3)
    )
    (:goal (and
        (on crate0 crate1)
        (on crate1 pallet1)
    ))
)