(define (problem depots9-p1)
    (:domain depots9)
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

        ; Truck Locations
        (at truck0 distributor0)
        (at truck1 depot2)
        (at truck2 depot0)

        ; Hoist Locations and Availability
        (at hoist0 depot0) (available hoist0)
        (at hoist1 depot1) (available hoist1)
        (at hoist2 depot2) (available hoist2)
        (at hoist3 distributor0) (available hoist3)

        ; Pallet Locations
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)

        ; Crate Locations
        (at crate0 depot1)
        (at crate1 depot2)
        (at crate2 distributor0)

        ; Relationships and Clearance
        (on crate0 pallet1)
        (on crate1 pallet2)
        (on crate2 pallet3)

        ; Surfaces that are clear (Crates are always clear unless something is on them, 
        ; which is not supported by the current action set/types)
        (clear crate0)
        (clear crate1)
        (clear crate2)
        (clear pallet0)
    )

    (:goal (and
        (on crate0 pallet1)
        (on crate1 pallet2)
        (on crate2 pallet0)
    ))

    (:metric minimize (total-cost))
)