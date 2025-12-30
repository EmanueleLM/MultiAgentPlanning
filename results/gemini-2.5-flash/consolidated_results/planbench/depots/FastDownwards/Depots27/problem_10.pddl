(define (problem Depots27_Problem)
    (:domain Depots27)
    (:objects
        depot0 - depot
        depot1 - depot
        depot2 - depot
        distributor0 - distributor

        truck0 truck1 truck2 - truck
        
        hoist0 hoist1 hoist2 hoist3 - hoist
        
        pallet0 pallet1 pallet2 pallet3 - pallet
        
        crate0 crate1 crate2 - crate
    )
    
    (:init
        (= (total-cost) 0)

        ; --- Truck Locations ---
        (at truck0 depot0)
        (at truck1 depot0)
        (at truck2 depot1)

        ; --- Hoist Locations (Fixed) ---
        (at-hoist hoist0 depot0)
        (at-hoist hoist1 depot1)
        (at-hoist hoist2 depot2)
        (at-hoist hoist3 distributor0)
        
        ; --- Hoist Availability ---
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)
        
        ; --- Stacking Configuration ---
        ; Crate 1 is on Crate 0, Crate 0 is on Pallet 0 (at depot0)
        (on crate1 crate0)
        (on crate0 pallet0)
        
        ; Crate 2 is on Pallet 1 (at depot1)
        (on crate2 pallet1)
        
        ; --- Clear Surfaces ---
        ; Specified clear objects: crate1, crate2, pallet2, pallet3.
        (clear crate1)
        (clear crate2)
        (clear pallet2)
        (clear pallet3)
    )
    
    (:goal (and
        (on crate0 pallet3)
        (on crate1 pallet0)
    ))
    
    (:metric minimize (total-cost))
)