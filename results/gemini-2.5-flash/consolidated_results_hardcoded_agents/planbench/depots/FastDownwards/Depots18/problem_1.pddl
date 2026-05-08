(define (problem depots18-p)
    (:domain depots18)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 pallet3 - pallet
    )
    (:init
        ; Truck locations
        (at truck0 depot0)
        (at truck1 depot0)
        (at truck2 distributor0)

        ; Hoist locations and availability
        (at hoist0 depot0) (available hoist0)
        (at hoist1 depot1) (available hoist1)
        (at hoist2 depot2) (available hoist2)
        (at hoist3 distributor0) (available hoist3)

        ; Crate locations
        (at crate0 depot1)
        (at crate1 depot0)
        (at crate2 distributor0)
        
        ; Pallet locations
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)
        
        ; Stacking
        (on crate0 pallet1)
        (on crate1 pallet0)
        (on crate2 pallet3)

        ; Clear status: crate0, crate1, crate2 are clear. pallet2 is clear (empty).
        (clear crate0)
        (clear crate1)
        (clear crate2)
        (clear pallet2)
    )
    (:goal (and
        (on crate0 crate2)
        (on crate1 pallet2)
        (on crate2 pallet3)
    ))
)