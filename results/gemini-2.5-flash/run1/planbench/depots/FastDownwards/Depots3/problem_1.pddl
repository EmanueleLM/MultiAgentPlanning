(define (problem depots3_problem)
    (:domain depots3)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 pallet3 - pallet
    )
    (:init
        ; Connectivity: All places are directly connected
        (connected depot0 depot1)
        (connected depot1 depot0)
        (connected depot0 depot2)
        (connected depot2 depot0)
        (connected depot0 distributor0)
        (connected distributor0 depot0)

        (connected depot1 depot2)
        (connected depot2 depot1)
        (connected depot1 distributor0)
        (connected distributor0 depot1)

        (connected depot2 distributor0)
        (connected distributor0 depot2)

        ; Locations of objects
        (at crate0 depot2)
        (at crate1 distributor0)
        (at crate2 depot1)

        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)

        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)

        (at truck0 depot1)
        (at truck1 depot1)
        (at truck2 depot1)

        ; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Crate clearance (nothing on top of them)
        (clear crate0)
        (clear crate1)
        (clear crate2)

        ; Pallet clearance and on-relations
        (clear pallet0) ; Pallet0 is clear initially

        (on crate0 pallet2) ; crate0 is on pallet2 -> pallet2 is NOT clear
        (not (clear pallet2))

        (on crate1 pallet3) ; crate1 is on pallet3 -> pallet3 is NOT clear
        (not (clear pallet3))

        (on crate2 pallet1) ; crate2 is on pallet1 -> pallet1 is NOT clear
        (not (clear pallet1))

        ; No crates are in trucks initially
        ; No hoists are lifting anything initially
    )
    (:goal (and
        (on crate0 pallet0)
        (on crate1 pallet1)
        (on crate2 pallet3)
    ))
)