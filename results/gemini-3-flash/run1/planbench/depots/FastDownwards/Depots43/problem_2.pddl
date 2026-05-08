(define (problem depots43)
    (:domain depots)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
    )
    (:init
        ;; Places and their static components
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)
        
        ;; Truck locations
        (at truck0 depot2)
        (at truck1 depot2)
        (at truck2 depot0)
        
        ;; Hoist locations and state
        (at hoist0 depot0)
        (available hoist0)
        (at hoist1 depot1)
        (available hoist1)
        (at hoist2 depot2)
        (available hoist2)
        (at hoist3 distributor0)
        (available hoist3)
        
        ;; Crate locations and stacking state
        (at crate0 distributor0)
        (on crate0 pallet3)
        (clear crate0)
        
        (at crate1 depot0)
        (on crate1 pallet0)
        (clear crate1)
        
        (at crate2 depot2)
        (on crate2 pallet2)
        (clear crate2)
        
        ;; Pallets without crates are clear
        (clear pallet1)
        ;; Note: pallet0, pallet2, and pallet3 are NOT clear as crates are on them.
    )
    (:goal
        (and
            (on crate0 pallet0)
            (on crate1 pallet2)
            (on crate2 crate1)
        )
    )
)