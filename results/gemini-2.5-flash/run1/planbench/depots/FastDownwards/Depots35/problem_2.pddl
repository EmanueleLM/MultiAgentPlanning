(define (problem depots35-problem)
    (:domain depots35)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        crate0 crate1 crate2 - crate
        hoist0 hoist1 hoist2 hoist3 - hoist
        pallet0 pallet1 pallet2 pallet3 - pallet
        truck0 truck1 truck2 - truck
    )
    (:init
        (at crate0 depot2)
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
        (at truck0 depot0)
        (at truck1 distributor0)
        (at truck2 depot1)

        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        (on crate0 pallet2)
        (on crate1 pallet3)
        (on crate2 crate0)

        (clear pallet0)
        (clear pallet1)
        (clear crate1)
        (clear crate2)
        
        ; Explicitly state surfaces that are NOT clear due to objects being on them
        (not (clear pallet2)) ; because crate0 is on it
        (not (clear pallet3)) ; because crate1 is on it
        (not (clear crate0)) ; because crate2 is on it
    )
    (:goal (and
        (on crate0 pallet0)
        (on crate1 pallet1)
    ))