(define (problem depots12_problem)
    (:domain depots12)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        hoist0 hoist1 hoist2 hoist3 - hoist
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        truck0 truck1 truck2 - truck
    )
    (:init
        ;; Hoist initial states
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ;; Pallet initial states
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)
        (clear pallet0)
        (clear pallet1)
        ;; Explicitly state non-clear surfaces due to crates
        (not (clear pallet2)) ; crate0 is on pallet2
        (not (clear pallet3)) ; crate1 is on pallet3

        ;; Crate initial locations
        (at crate0 depot2)
        (at crate1 distributor0)
        (at crate2 distributor0)

        ;; Crate initial stacking relations and derived clear states
        (on crate0 pallet2)
        (clear crate0) ; crate0 has nothing on it
        
        (on crate1 pallet3)
        (not (clear crate1)) ; crate2 is on crate1

        (on crate2 crate1)
        (clear crate2) ; crate2 has nothing on it

        ;; Truck initial locations
        (at truck0 depot1)
        (at truck1 depot0)
        (at truck2 depot1)
    )
    (:goal (and
        (on crate0 crate1)
        (on crate1 pallet3)
        (on crate2 pallet1)
    ))
)