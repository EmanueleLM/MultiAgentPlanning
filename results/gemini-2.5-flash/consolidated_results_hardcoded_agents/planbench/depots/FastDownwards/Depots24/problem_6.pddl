(define (problem Depots24-0)
    (:domain Depots24)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
    )

    (:init
        (= (total-cost) 0)
        
        ;; Truck locations
        (at truck0 depot2)
        (at truck1 depot0)
        (at truck2 depot2)
        
        ;; Surface locations
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)
        
        (at crate0 depot0)
        (at crate1 distributor0)
        (at crate2 depot2)
        
        ;; Hoist locations and availability
        (hoist-at hoist0 depot0)
        (available hoist0)
        (hoist-at hoist1 depot1)
        (available hoist1)
        (hoist-at hoist2 depot2)
        (available hoist2)
        (hoist-at hoist3 distributor0)
        (available hoist3)
        
        ;; Stacking (on) and Clearance (clear)
        
        ;; Stacking: Crate is on surface
        (on crate0 pallet0)
        (on crate1 pallet3)
        (on crate2 pallet2)
        
        ;; Clearance: Top items are clear
        (clear crate0)
        (clear crate1)
        (clear crate2)
        (clear pallet1) ; pallet1 is empty
    )

    (:goal (and
        (on crate0 crate2)
        (on crate1 pallet2)
        (on crate2 pallet0)
    ))

    (:metric minimize (total-cost))
)