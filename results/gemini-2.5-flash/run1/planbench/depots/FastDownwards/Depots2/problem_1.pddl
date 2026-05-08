(define (problem depots-instance)
    (:domain depots)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 pallet3 - pallet
    )
    (:init
        ; Object Locations
        (at crate0 depot2)
        (at crate1 depot0)
        (at crate2 depot2)
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)
        (at truck0 depot2)
        (at truck1 depot0)
        (at truck2 depot2)

        ; Hoist Availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Surface Clearance (explicitly clear surfaces)
        (clear crate1)
        (clear crate2)
        (clear pallet1)
        (clear pallet3)

        ; Stacking (implicitly makes other surfaces not clear)
        (on crate0 pallet2)   ; Implies (not (clear pallet2))
        (on crate1 pallet0)   ; Implies (not (clear pallet0))
        (on crate2 crate0)    ; Implies (not (clear crate0))

        ; Implicitly no crates in trucks, no hoists lifting anything.
    )
    (:goal (and
        (on crate1 pallet0) ; This is an initial state, so it must be maintained.
        (on crate2 pallet3)
    ))
)