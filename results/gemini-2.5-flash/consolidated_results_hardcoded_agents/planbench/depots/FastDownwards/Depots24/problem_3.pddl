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
        
        ;; Surface locations (Crates and Pallets)
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)
        
        (at crate0 depot0)
        (at crate1 distributor0)
        (at crate2 depot2)
        
        ;; Hoist locations
        (hoist-at hoist0 depot0)
        (hoist-at hoist1 depot1)
        (hoist-at hoist2 depot2)
        (hoist-at hoist3 distributor0)

        ;; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)
        
        ;; Stacking and Clearance
        
        ;; crate0 is on pallet0
        (on crate0 pallet0)
        
        ;; crate1 is on pallet3
        (on crate1 pallet3)
        
        ;; crate2 is on pallet2
        (on crate2 pallet2)
        
        ;; Clearance status:
        (clear crate0)
        (clear crate1)
        (clear crate2)
        (clear pallet1)
        
    )

    (:goal (and
        (on crate0 crate2)
        (on crate1 pallet2)
        (on crate2 pallet0)
    ))

    (:metric minimize (total-cost))
)