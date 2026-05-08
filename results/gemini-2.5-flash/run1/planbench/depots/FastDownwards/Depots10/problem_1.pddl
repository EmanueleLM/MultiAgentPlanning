(define (problem depots10-problem)
    (:domain depots)
    (:objects
        depot0 depot1 depot2 distributor0 - place
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
    )
    (:init
        ; Truck locations
        (at truck0 depot2)
        (at truck1 distributor0)
        (at truck2 depot1)

        ; Hoist locations
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)

        ; Pallet locations
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)

        ; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Initial stacking
        (on crate0 pallet1)
        (on crate1 crate0)
        (on crate2 pallet0)

        ; Clear status for surfaces (crates and pallets)
        ; Based on initial stacking:
        ; crate0 is on pallet1 => pallet1 is NOT clear
        ; crate1 is on crate0 => crate0 is NOT clear
        ; crate2 is on pallet0 => pallet0 is NOT clear
        ; Explicitly given as clear: crate1, crate2, pallet2, pallet3
        (clear crate1)
        (clear crate2)
        (clear pallet2)
        (clear pallet3)
    )
    (:goal (and
        (on crate0 pallet2)
        (on crate1 pallet0)
        (on crate2 pallet1)
    ))
)