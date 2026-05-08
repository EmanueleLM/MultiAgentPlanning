(define (problem Depots7-Problem)
    (:domain Depots7)
    (:objects
        depot0 depot1 depot2 distributor0 - place
        crate0 crate1 crate2 - crate
        hoist0 hoist1 hoist2 hoist3 - hoist
        pallet0 pallet1 pallet2 pallet3 - pallet
        truck0 truck1 truck2 - truck
    )
    (:init
        ;; Initial locations of crates (resting on surfaces)
        (at crate0 depot1)
        (at crate1 distributor0)
        (at crate2 depot0)

        ;; Initial locations of hoists
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)

        ;; Initial locations of pallets
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)

        ;; Initial locations of trucks
        (at truck0 depot0)
        (at truck1 distributor0)
        (at truck2 depot1)

        ;; Initial availability of hoists
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ;; Initial stacking and clear status
        (on crate0 pallet1)
        (on crate1 pallet3)
        (on crate2 pallet0)
        
        ;; Crates are clear if nothing is on them
        (clear crate0)
        (clear crate1)
        (clear crate2)
        
        ;; Pallets are clear if nothing is on them initially
        ;; Based on (on crateX palletY), some pallets are not clear:
        ;; pallet1 has crate0, pallet3 has crate1, pallet0 has crate2
        ;; So only pallet2 is initially clear
        (clear pallet2)

        ;; Initial cost
        (= (total-cost) 0)
    )
    (:goal (and
        (on crate0 pallet3)
        (on crate1 crate2)
        (on crate2 pallet1)
    ))
)