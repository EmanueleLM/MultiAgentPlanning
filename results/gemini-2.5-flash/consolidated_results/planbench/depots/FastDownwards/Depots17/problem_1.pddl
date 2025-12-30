(define (problem Depots17-P)
    (:domain Depots17)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        crate0 crate1 crate2 - crate
        hoist0 hoist1 hoist2 hoist3 - hoist
        pallet0 pallet1 pallet2 pallet3 - pallet
        truck0 truck1 truck2 - truck
    )
    
    (:init
        ; Connectivity (Full connectivity assumed)
        (road depot0 depot1) (road depot1 depot0)
        (road depot0 depot2) (road depot2 depot0)
        (road depot0 distributor0) (road distributor0 depot0)
        (road depot1 depot2) (road depot2 depot1)
        (road depot1 distributor0) (road distributor0 depot1)
        (road depot2 distributor0) (road distributor0 depot2)

        ; Truck locations
        (at truck0 distributor0)
        (at truck1 depot2)
        (at truck2 distributor0)

        ; Hoist locations and availability
        (at hoist0 depot0) (available hoist0)
        (at hoist1 depot1) (available hoist1)
        (at hoist2 depot2) (available hoist2)
        (at hoist3 distributor0) (available hoist3)

        ; Pallet locations and clearance
        (at pallet0 depot0) (clear pallet0)
        (at pallet1 depot1) 
        (at pallet2 depot2) (clear pallet2)
        (at pallet3 distributor0) 

        ; Crate locations, stacking, and clearance
        ; crate0 is at distributor0, on pallet3. (Not clear, crate1 on top)
        (at crate0 distributor0)
        (on crate0 pallet3) 
        
        ; crate1 is at distributor0, on crate0, and is clear.
        (at crate1 distributor0)
        (on crate1 crate0) 
        (clear crate1)
        
        ; crate2 is at depot1, on pallet1, and is clear.
        (at crate2 depot1)
        (on crate2 pallet1)
        (clear crate2)

        (= (total-cost) 0)
    )

    (:goal (and
        (on crate0 pallet0)
        (on crate1 pallet2)
        (on crate2 pallet3)
    ))
    
    (:metric minimize (total-cost))
)