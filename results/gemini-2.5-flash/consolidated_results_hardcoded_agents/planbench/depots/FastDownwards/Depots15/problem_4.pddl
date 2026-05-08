(define (problem depots15-p)
    (:domain depots15)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 pallet3 - pallet
    )
    (:init
        (= (total-cost) 0)

        ; Locations
        (at crate0 depot2) (at crate1 depot1) (at crate2 depot2)
        (at hoist0 depot0) (at hoist1 depot1) (at hoist2 depot2) (at hoist3 distributor0)
        (at pallet0 depot0) (at pallet1 depot1) (at pallet2 depot2) (at pallet3 distributor0)
        (at truck0 depot2) (at truck1 depot2) (at truck2 depot1)

        ; Availability
        (available hoist0) (available hoist1) (available hoist2) (available hoist3)

        ; Clearance (Topmost items or empty surfaces)
        (clear crate1) (clear crate2)
        (clear pallet0) (clear pallet3)
        
        ; Stacking
        (on crate0 pallet2)
        (on crate1 pallet1)
        (on crate2 crate0)
        ; Implied lack of clearance: (not (clear crate0)), (not (clear pallet1)), (not (clear pallet2))
    )
    (:goal (and
        (on crate0 pallet3)
        (on crate1 crate2)
        (on crate2 pallet2)
    ))
    (:metric minimize (total-cost))