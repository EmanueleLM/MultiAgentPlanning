(define (problem Depots24-0)
    (:domain Depots24)
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
        
        ;; Truck locations
        (at truck0 depot2)
        (at truck1 depot0)
        (at truck2 depot2)
        
        ;; Hoist locations
        (hoist-at hoist0 depot0)
        (hoist-at hoist1 depot1)
        (hoist-at hoist2 depot2)
        (hoist-at hoist3 distributor0)

        ;; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)
        
        ;; Stacking and Clearance
        
        ;; crate0 is on pallet0 (depot0)
        (on crate0 pallet0)
        
        ;; crate1 is on pallet3 (distributor0)
        (on crate1 pallet3)
        
        ;; crate2 is on pallet2 (depot2)
        (on crate2 pallet2)
        
        ;; Clearance status:
        ;; Crates C0, C1, C2 are clear.
        (clear crate0)
        (clear crate1)
        (clear crate2)
        
        ;; Pallet clearance: P1 is clear. P0, P2, P3 are not clear (since they hold a crate).
        (clear pallet1)
        
    )

    (:goal (and
        (on crate0 crate2)
        (on crate1 pallet2)
        (on crate2 pallet0)
    ))

    (:metric minimize (total-cost))
)