(define (problem Depots13-P)
    (:domain Depots13)
    (:objects
        depot0 depot1 depot2 - place
        truck0 - truck
        hoist0 - hoist
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 - pallet
    )
    
    (:init
        (= (total-cost) 0)
        
        ;; Truck and Hoist setup
        (at truck0 depot0)
        (at hoist0 depot0)
        (available hoist0)

        ;; Initial State:
        
        ;; crate0@depot2 on pallet2
        (at crate0 depot2)
        (at pallet2 depot2)
        (on crate0 pallet2)
        (clear crate0) 

        ;; crate1@depot0 on pallet0
        (at crate1 depot0)
        (at pallet0 depot0)
        (on crate1 pallet0)
        (clear crate1)

        ;; crate2@depot1 on pallet1
        (at crate2 depot1)
        (at pallet1 depot1)
        (on crate2 pallet1)
        (clear crate2)
        
        ;; Pallets supporting crates are not clear (relying on CWA)
    )
    
    (:goal (and
        (on crate0 pallet1)
        (on crate2 crate0)
    ))
    
    (:metric minimize (total-cost))
)