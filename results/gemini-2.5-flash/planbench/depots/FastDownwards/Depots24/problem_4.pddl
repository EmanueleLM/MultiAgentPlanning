(define (problem depots24-instance)
    (:domain depots24)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
    )
    (:init
        ; Locations of objects
        (at crate0 depot0)
        (at crate1 distributor0)
        (at crate2 depot2)
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)
        (at truck0 depot2)
        (at truck1 depot0)
        (at truck2 depot2)

        ; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Stacking and clear status based on initial conditions
        ; crate0 is on pallet0
        (on crate0 pallet0)
        (clear crate0) ; Crate0 is clear since nothing is on it
        (not (clear pallet0)) ; Pallet0 is not clear since crate0 is on it

        ; crate1 is on pallet3
        (on crate1 pallet3)
        (clear crate1) ; Crate1 is clear since nothing is on it
        (not (clear pallet3)) ; Pallet3 is not clear since crate1 is on it

        ; crate2 is on pallet2
        (on crate2 pallet2)
        (clear crate2) ; Crate2 is clear since nothing is on it
        (not (clear pallet2)) ; Pallet2 is not clear since crate2 is on it

        ; Other clear surfaces explicitly mentioned
        (clear pallet1)

        ; Connectivity: All depots and distributors are directly connected
        (connected depot0 depot1) (connected depot1 depot0)
        (connected depot0 depot2) (connected depot2 depot0)
        (connected depot0 distributor0) (connected distributor0 depot0)

        (connected depot1 depot2) (connected depot2 depot1)
        (connected depot1 distributor0) (connected distributor0 depot1)

        (connected depot2 distributor0) (connected distributor0 depot2)
    )
    (:goal
        (and
            (on crate0 crate2)
            (on crate1 pallet2)
            (on crate2 pallet0)
        )
    )