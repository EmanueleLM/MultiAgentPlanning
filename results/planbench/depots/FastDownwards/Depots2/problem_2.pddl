(define (problem Depots2-Problem)
    (:domain Depots2)
    (:objects
        depot0 depot1 depot2 distributor0 - place
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 pallet3 - pallet
    )
    
    (:init
        (= (total-cost) 0)
        
        ; Truck Locations
        (at truck0 depot2)
        (at truck1 depot0)
        (at truck2 depot2)

        ; Hoist Locations and Availability
        (at hoist0 depot0) (available hoist0)
        (at hoist1 depot1) (available hoist1)
        (at hoist2 depot2) (available hoist2)
        (at hoist3 distributor0) (available hoist3)

        ; Pallet Locations
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)

        ; Crate Locations
        (at crate0 depot2)
        (at crate1 depot0)
        (at crate2 depot2)

        ; Stacking Conditions
        (on crate0 pallet2) 
        (on crate1 pallet0) 
        (on crate2 crate0)

        ; Clearance Conditions (Provided clearances)
        (clear crate1)
        (clear crate2)
        (clear pallet1)
        (clear pallet3)
    )
    
    (:goal (and
        (on crate1 pallet0)
        (on crate2 pallet3)
    ))
    
    (:metric minimize (total-cost))
)