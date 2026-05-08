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
        (not (lifting hoist0 crate0)) ; Ensuring negative facts are established
        (not (lifting hoist1 crate0))
        (not (lifting hoist2 crate0))
        (not (lifting hoist3 crate0))
        (not (lifting hoist0 crate1))
        (not (lifting hoist1 crate1))
        (not (lifting hoist2 crate1))
        (not (lifting hoist3 crate1))
        (not (lifting hoist0 crate2))
        (not (lifting hoist1 crate2))
        (not (lifting hoist2 crate2))
        (not (lifting hoist3 crate2))

        ;; Pallet locations
        (at pallet0 d0)
        (at pallet1 d1)
        (at pallet2 d2)
        (at pallet3 r0)
        
        ;; Crate locations and containment (none in trucks initially)
        (at crate0 d2)
        (at crate1 r0)
        (at crate2 r0)
        (not (in crate0 truck0)) (not (in crate0 truck1)) (not (in crate0 truck2))
        (not (in crate1 truck0)) (not (in crate1 truck1)) (not (in crate1 truck2))
        (not (in crate2 truck0)) (not (in crate2 truck1)) (not (in crate2 truck2))

        ;; Stacking and Clearance
        ;; Stated ON facts
        (on crate0 pallet2)
        (on crate1 pallet3)
        (on crate2 crate1)

        ;; Stated CLEAR facts: crate0, crate2, pallet0, pallet1 are clear.
        (clear crate0)
        (not (clear crate1)) ; crate2 is on crate1
        (clear crate2)
        
        (clear pallet0)
        (clear pallet1)
        (not (clear pallet2)) ; crate0 is on pallet2
        (not (clear pallet3)) ; crate1 is on pallet3
    )

    (:goal (and
        (on crate0 pallet0)
        (on crate1 pallet2)
        (on crate2 pallet1)
    ))

    (:metric minimize (total-cost))
)