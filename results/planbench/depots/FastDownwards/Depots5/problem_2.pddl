(define (problem depots5-problem)
(:domain depots-domain)
(:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    hoist0 hoist1 hoist2 hoist3 - hoist
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
    truck0 truck1 truck2 - truck
)
(:init
    ;; Locations
    (at crate0 distributor0) (at crate1 distributor0) (at crate2 distributor0)
    (at hoist0 depot0) (at hoist1 depot1) (at hoist2 depot2) (at hoist3 distributor0)
    (at pallet0 depot0) (at pallet1 depot1) (at pallet2 depot2) (at pallet3 distributor0)
    (at truck0 depot0) (at truck1 depot0) (at truck2 depot1)

    ;; Hoist Availability
    (available hoist0) (available hoist1) (available hoist2) (available hoist3)

    ;; Clearance
    (clear crate2)
    (clear pallet0) (clear pallet1) (clear pallet2)

    ;; Stacking
    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 crate1)
    
    ;; Initial Cost
    (= (total-cost) 0)
)
(:goal
    (and
        (on crate1 pallet1)
        (on crate2 pallet2)
    )
)
(:metric minimize (total-cost))
)