(define (problem Depots14)
    (:domain depots)
    (:objects
        d0 d1 d2 - depot
        r0 - distributor
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 pallet3 - pallet
    )
    
    (:init
        (= (total-cost) 0)

        ;; Truck locations
        (at truck0 r0)
        (at truck1 d0)
        (at truck2 d0)

        ;; Hoist locations and availability
        (at hoist0 d0) (available hoist0)
        (at hoist1 d1) (available hoist1)
        (at hoist2 d2) (available hoist2)
        (at hoist3 r0) (available hoist3)

        ;; Pallet locations
        (at pallet0 d0)
        (at pallet1 d1)
        (at pallet2 d2)
        (at pallet3 r0)
        
        ;; Crate locations
        (at crate0 d2)
        (at crate1 r0)
        (at crate2 r0)

        ;; Stacking and Clearance
        (on crate0 pallet2)
        (on crate1 pallet3)
        (on crate2 crate1)

        ;; Stated CLEAR facts (relying on CWA for negated facts)
        (clear crate0)
        (clear crate2)
        (clear pallet0)
        (clear pallet1)
    )

    (:goal (and
        (on crate0 pallet0)
        (on crate1 pallet2)
        (on crate2 pallet1)
    ))

    (:metric minimize (total-cost))
)