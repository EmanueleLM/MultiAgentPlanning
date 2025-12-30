(define (problem Depots27_P)
    (:domain Depots27)
    (:objects
        depot0 depot1 depot2 distributor0 - place
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
    )
    (:init
        ; Truck Locations
        (at truck0 depot0)
        (at truck1 depot0)
        (at truck2 depot1)

        ; Hoist Locations
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)
        
        ; Surface Locations (Pallets and Crates)
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)
        (at crate0 depot0)
        (at crate1 depot0)
        (at crate2 depot1)

        ; Stacking Configuration
        (on crate1 crate0)
        (on crate0 pallet0)
        (on crate2 pallet1)

        ; Clear Surfaces
        (clear crate1)
        (clear crate2)
        (clear pallet2)
        (clear pallet3)

        ; Availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)
        
        ; Initial Cost
        (= (total-cost) 0)
    )
    (:goal (and
        (on crate0 pallet3)
        (on crate1 pallet0)
    ))
    (:metric minimize (total-cost))