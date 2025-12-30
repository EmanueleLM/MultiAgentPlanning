(define (problem depots4-p)
    (:domain depots4)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        hoist0 hoist1 hoist2 hoist3 - hoist
        truck0 truck1 truck2 - truck
    )
    
    (:init
        ; Location of surfaces (crates/pallets), trucks, and hoists
        (at crate0 depot0) (at crate1 depot0) (at pallet0 depot0) (at hoist0 depot0)
        (at crate2 depot1) (at pallet1 depot1) (at truck1 depot1) (at hoist1 depot1)
        (at truck0 depot2) (at truck2 depot2) (at pallet2 depot2) (at hoist2 depot2)
        (at pallet3 distributor0) (at hoist3 distributor0)
        
        ; Stacking
        (on crate0 pallet0)
        (on crate1 crate0)
        (on crate2 pallet1)
        
        ; Availability
        (available hoist0) (available hoist1) (available hoist2) (available hoist3)

        ; Clarity
        (clear crate1)
        (clear crate2)
        (clear pallet2)
        (clear pallet3)
        
        ; Surfaces that are NOT clear based on initial stacking
        ; Note: We don't need to explicitly state (not (clear ...)) if we use negative preconditions/strips,
        ; but the presence of (on ...) implies lack of clarity. 
        ; We must ensure that surfaces not listed as clear are implicitly NOT clear.
        
        (= (total-cost) 0)
    )
    
    (:goal (and
        (on crate0 pallet1)
        (on crate1 crate0)
        (on crate2 pallet0)
    ))

    (:metric minimize (total-cost))
)