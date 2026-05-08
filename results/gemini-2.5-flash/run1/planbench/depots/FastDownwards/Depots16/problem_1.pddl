(define (problem depots16)
    (:domain depots16)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        hoist0 hoist1 hoist2 hoist3 - hoist
        pallet0 pallet1 pallet2 pallet3 - pallet
        truck0 truck1 truck2 - truck
        crate0 crate1 crate2 - crate
    )
    (:init
        ; Locations of crates
        (at crate0 depot0)
        (at crate1 depot2)
        (at crate2 depot0)
        ; Locations of hoists
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)
        ; Locations of pallets
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)
        ; Locations of trucks
        (at truck0 depot0)
        (at truck1 depot1)
        (at truck2 depot2)

        ; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Clear status - explicit facts from prompt
        (clear crate1)
        (clear crate2)
        (clear pallet1)
        (clear pallet3)

        ; Stacking - explicit facts from prompt
        (on crate0 pallet0)
        (on crate1 pallet2)
        (on crate2 crate0)

        ; Inferred clear status (based on stacking)
        (not (clear pallet0)) ; because crate0 is on pallet0
        (not (clear pallet2)) ; because crate1 is on pallet2
        (not (clear crate0))  ; because crate2 is on crate0
    )
    (:goal (and
        (on crate0 crate1)
        (on crate1 pallet0)
        (on crate2 pallet2)
    ))
)