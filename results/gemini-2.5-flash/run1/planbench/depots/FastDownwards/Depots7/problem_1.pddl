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
        ;; Initial locations of crates
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
        (clear crate0) ; Nothing is on crate0
        (clear crate1) ; Nothing is on crate1
        (clear crate2) ; Nothing is on crate2
        (clear pallet2) ; Pallet2 is empty (nothing on it)

        ;; Pallets with crates on them are implicitly (not (clear ?pallet))
        ;; Crates that are on surfaces and have nothing on them are (clear ?crate)

        ;; Initial cost
        (= (total-cost) 0)
    )
    (:goal (and
        (on crate0 pallet3)
        (on crate1 crate2)
        (on crate2 pallet1)
    ))
)