(define (problem Depots28_Problem)
    (:domain Depots28)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
    )
    (:init
        (= (total-cost) 0)

        ;; Roads (Fully connected network)
        (road depot0 depot1) (road depot1 depot0)
        (road depot0 depot2) (road depot2 depot0)
        (road depot0 distributor0) (road distributor0 depot0)
        (road depot1 depot2) (road depot2 depot1)
        (road depot1 distributor0) (road distributor0 depot1)
        (road depot2 distributor0) (road distributor0 depot2)

        ;; Locations
        (at crate0 distributor0)
        (at crate1 distributor0)
        (at crate2 depot1)
        
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)
        
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)
        
        (at truck0 depot1)
        (at truck1 depot1)
        (at truck2 depot0)

        ;; Status/Stacking
        (available hoist0) (available hoist1) (available hoist2) (available hoist3)

        (clear crate1)
        (clear crate2)
        (clear pallet0)
        (clear pallet2)

        (on crate0 pallet3)
        (on crate1 crate0)
        (on crate2 pallet1)
    )
    (:goal (and
        (on crate0 crate2)
        (on crate1 crate0)
        (on crate2 pallet0)
        
        ;; Required final location (Depot0, implied by crate2 on pallet0, and pallet0 at depot0)
        (at crate0 depot0)
        (at crate1 depot0)
        (at crate2 depot0)
    ))
    (:metric minimize (total-cost))
)