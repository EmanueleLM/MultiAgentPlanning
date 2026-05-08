(define (problem depots22-problem)
    (:domain depots22)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
    )
    (:init
        ; Crates at places
        (at crate0 depot1)
        (at crate1 depot2)
        (at crate2 distributor0)

        ; Hoists at places
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)

        ; Pallets at places
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)

        ; Trucks at places
        (at truck0 distributor0)
        (at truck1 depot1)
        (at truck2 depot1)

        ; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Clear status of crates and pallet0
        (clear crate0)
        (clear crate1)
        (clear crate2)
        (clear pallet0)

        ; 'On' relationships and implied 'not clear' for surfaces
        (on crate0 pallet1)
        (not (clear pallet1))

        (on crate1 pallet2)
        (not (clear pallet2))

        (on crate2 pallet3)
        (not (clear pallet3))
    )
    (:goal (and
        (on crate0 crate1)
        (on crate1 pallet0)
    ))
)