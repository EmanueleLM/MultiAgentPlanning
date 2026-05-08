(define (problem depots-21)
    (:domain depots)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 pallet3 - pallet
        hoist0 hoist1 hoist2 hoist3 - hoist
        truck0 truck1 truck2 - truck
    )
    (:init
        ;; Locations of crates
        (at crate0 distributor0)
        (at crate1 depot1)
        (at crate2 distributor0)

        ;; Locations of hoists
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)

        ;; Locations of pallets
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)

        ;; Locations of trucks
        (at truck0 depot0)
        (at truck1 depot0)
        (at truck2 depot2)

        ;; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ;; Relationships and Clearance
        ;; crate0 is on pallet3
        (on crate0 pallet3)
        ;; pallet3 is not clear (implicit from (on crate0 pallet3) & CWA for (clear pallet3))
        ;; crate0 is not clear (implicit from (on crate2 crate0) & CWA for (clear crate0))

        ;; crate1 is on pallet1
        (on crate1 pallet1)
        (clear crate1) ; Explicitly stated: crate1 is clear (nothing is on crate1)
        ;; pallet1 is not clear (implicit from (on crate1 pallet1) & CWA for (clear pallet1))

        ;; crate2 is on crate0
        (on crate2 crate0)
        (clear crate2) ; Explicitly stated: crate2 is clear (nothing is on crate2)

        ;; Other explicitly clear surfaces
        (clear pallet0)
        (clear pallet2)

        ;; Connectivity (depots and distributors are directly connected by roads - complete graph)
        (connected depot0 depot1) (connected depot1 depot0)
        (connected depot0 depot2) (connected depot2 depot0)
        (connected depot0 distributor0) (connected distributor0 depot0)

        (connected depot1 depot2) (connected depot2 depot1)
        (connected depot1 distributor0) (connected distributor0 depot1)

        (connected depot2 distributor0) (connected distributor0 depot2)
    )
    (:goal (and
        (on crate0 pallet2)
        (on crate1 pallet0)
        (on crate2 crate1)
    ))
)