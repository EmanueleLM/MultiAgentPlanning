(define (problem depots8-instance)
    (:domain depots8)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        hoist0 hoist1 hoist2 hoist3 - hoist
        truck0 truck1 truck2 - truck
    )
    (:init
        (= (total-cost) 0)
        
        ; Locations of Pallets
        (at pallet0 depot0) (at pallet1 depot1) (at pallet2 depot2) (at pallet3 distributor0)

        ; Locations of Hoists and Availability
        (at hoist0 depot0) (available hoist0)
        (at hoist1 depot1) (available hoist1)
        (at hoist2 depot2) (available hoist2)
        (at hoist3 distributor0) (available hoist3)

        ; Locations of Trucks
        (at truck0 depot1)
        (at truck1 depot2)
        (at truck2 distributor0)

        ; Connectivity
        (connected depot0 depot1) (connected depot1 depot0)
        (connected depot0 depot2) (connected depot2 depot0)
        (connected depot0 distributor0) (connected distributor0 depot0)
        (connected depot1 depot2) (connected depot2 depot1)
        (connected depot1 distributor0) (connected distributor0 depot1)
        (connected depot2 distributor0) (connected distributor0 depot2)

        ; Initial Crate State
        (at crate0 depot1) (on crate0 pallet1)
        (at crate1 distributor0) (on crate1 pallet3)
        (at crate2 depot1) (on crate2 crate0)
        
        ; Object Clear Status
        (clear crate1)
        (clear crate2)
        (clear pallet0)
        (clear pallet2)
    )
    (:goal (and
        (on crate0 pallet0)
        (on crate2 pallet1)
    ))
    (:metric minimize (total-cost))
)