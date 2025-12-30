(define (problem Depots25-Problem)
    (:domain Depots25)
    (:objects
        depot0 depot1 depot2 distributor0 - place
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
    )
    (:init
        ; Locations
        (at crate0 depot2) (at crate1 depot2) (at crate2 depot2)
        (at hoist0 depot0) (at hoist1 depot1) (at hoist2 depot2) (at hoist3 distributor0)
        (at pallet0 depot0) (at pallet1 depot1) (at pallet2 depot2) (at pallet3 distributor0)
        (at truck0 distributor0) (at truck1 depot1) (at truck2 distributor0)

        ; Availability
        (available hoist0) (available hoist1) (available hoist2) (available hoist3)

        ; Stacking setup
        (on crate0 pallet2)
        (on crate1 crate0)
        (on crate2 crate1)

        ; Clearance (Based on specification: crate2, pallet0, pallet1, pallet3 are clear)
        (clear crate2)
        (clear pallet0)
        (clear pallet1)
        (clear pallet3)
        ; Note: pallet2, crate0, crate1 are implicitly not clear due to stacking

        ; Metric initialization
        (= (total-cost) 0)
    )
    (:goal (and
        (on crate1 crate2)
        (on crate2 pallet2)
    ))
    (:metric minimize (total-cost))
)