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

        ; Explicit crate locations (due to crates now being locatable)
        ; crate0 is on pallet1, pallet1 is at depot1 -> crate0 is at depot1
        (at crate0 depot1)
        ; crate1 is on crate0, crate0 is at depot1 -> crate1 is at depot1
        (at crate1 depot1)
        ; crate2 is on pallet0, pallet0 is at depot0 -> crate2 is at depot0
        (at crate2 depot0)

        ; Explicitly stated clear status for surfaces (crates and pallets)
        (clear crate1)  ; Nothing is on crate1
        (clear crate2)  ; Nothing is on crate2
        (clear pallet2) ; Nothing is on pallet2
        (clear pallet3) ; Nothing is on pallet3
        
        ; Inferred 'not clear' states from initial stacking:
        ; crate0 is on pallet1, so pallet1 is not clear
        (not (clear pallet1))
        ; crate1 is on crate0, so crate0 is not clear
        (not (clear crate0))
        ; crate2 is on pallet0, so pallet0 is not clear
        (not (clear pallet0))
    )
    (:goal (and
        (on crate0 pallet2)
        (on crate1 pallet0)
        (on crate2 pallet1)
    ))
)