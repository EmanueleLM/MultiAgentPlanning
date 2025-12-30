(define (problem Depots13-P)
    (:domain Depots13)
    (:objects
        depot0 depot1 depot2 distributor0 - place
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 pallet3 - pallet
    )
    
    (:init
        (= (total-cost) 0)
        
        ;; Truck locations (truck0 @ depot2, truck1 @ distributor0, truck2 @ distributor0)
        (at truck0 depot2) 
        (at truck1 distributor0)
        (at truck2 distributor0)
        
        ;; Hoist locations and availability
        (at hoist0 depot0) (available hoist0)
        (at hoist1 depot1) (available hoist1)
        (at hoist2 depot2) (available hoist2)
        (at hoist3 distributor0) (available hoist3)
        
        ;; Pallet locations and clearance (P3 clear)
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0) (clear pallet3)

        ;; Crate locations, stacking, and clearance
        
        ;; crate0 @ depot2 on pallet2
        (at crate0 depot2)
        (on crate0 pallet2)
        (clear crate0) 
        ;; pallet2 is not clear implicitly

        ;; crate1 @ depot0 on pallet0
        (at crate1 depot0)
        (on crate1 pallet0)
        (clear crate1)
        ;; pallet0 is not clear implicitly

        ;; crate2 @ depot1 on pallet1
        (at crate2 depot1)
        (on crate2 pallet1)
        (clear crate2)
        ;; pallet1 is not clear implicitly
    )
    
    (:goal (and
        (on crate0 pallet1)
        (on crate2 crate0)
    ))
    
    (:metric minimize (total-cost))
)