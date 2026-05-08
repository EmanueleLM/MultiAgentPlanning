(define (problem Depots11-P1)
    (:domain Depots11)
    (:objects
        depot0 depot1 depot2 distributor0 - place
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
    )
    (:init
        (= (total-cost) 0)

        ; Places: All Depots and Distributors are Places. Roads implicitly connect all Places.
        
        ; Pallets are Surfaces at fixed Locations
        (located pallet0 depot0)
        (located pallet1 depot1)
        (located pallet2 depot2)
        (located pallet3 distributor0)

        ; Truck Locations
        (at truck0 distributor0)
        (at truck1 depot0)
        (at truck2 depot0)

        ; Hoist Locations and Availability
        (at hoist0 depot0) (available hoist0)
        (at hoist1 depot1) (available hoist1)
        (at hoist2 depot2) (available hoist2)
        (at hoist3 distributor0) (available hoist3)

        ; Initial Stacking (Depot0)
        (on crate0 pallet0)
        (on crate1 crate0)
        (on crate2 crate1)
        
        ; Explicit location of resting crates
        (located crate0 depot0)
        (located crate1 depot0)
        (located crate2 depot0)

        ; Clear status
        (clear crate2) ; Crate2 is on top
        (clear pallet1)
        (clear pallet2)
        (clear pallet3)
        ; pallet0, crate0, crate1 are NOT clear
    )
    (:goal (and
        (on crate0 pallet1)
        (on crate1 crate2)
        (on crate2 pallet0)
    ))
    (:metric minimize (total-cost))
)