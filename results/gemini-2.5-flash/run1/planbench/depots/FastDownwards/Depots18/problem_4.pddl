(define (problem depots18-problem)
    (:domain depots18)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 pallet3 - pallet
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
    )
    (:init
        ; Locations of Pallets
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)

        ; Locations of Hoists
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)

        ; Locations of Trucks
        (at truck0 depot0)
        (at truck1 depot0)
        (at truck2 distributor0)

        ; Locations of Crates (on their initial surfaces)
        (at crate0 depot1)
        (at crate1 depot0)
        (at crate2 distributor0)

        ; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Crate clear status (nothing on top of them)
        (clear crate0)
        (clear crate1)
        (clear crate2)

        ; Pallet clear status
        (clear pallet2) ; Pallet2 is explicitly stated as clear.
        ; Pallet0, Pallet1, Pallet3 are NOT clear because crates are on them (implicitly (not (clear palletX)) by omission).

        ; On relations (initial stacking)
        (on crate0 pallet1)
        (on crate1 pallet0)
        (on crate2 pallet3)
    )
    (:goal (and
        (on crate0 crate2)
        (on crate1 pallet2)
        (on crate2 pallet3)
    ))