(define (problem depots32-problem)
    (:domain depots32)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        hoist0 hoist1 hoist2 hoist3 - hoist
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        truck0 truck1 truck2 - truck
    )
    (:init
        ; Truck locations
        (at truck0 depot2)
        (at truck1 distributor0)
        (at truck2 depot1)

        ; Hoist locations
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)

        ; Pallet locations
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)

        ; Crate locations (initially on surfaces)
        (at crate0 depot1)
        (at crate1 depot0)
        (at crate2 distributor0)

        ; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Clear status
        ; Crates themselves are clear (nothing on top of them)
        (clear crate0)
        (clear crate1)
        (clear crate2)
        ; Pallets clear status
        (clear pallet2) ; Pallet2 is explicitly clear in the specification
        (not (clear pallet0)) ; Implied by (on crate1 pallet0)
        (not (clear pallet1)) ; Implied by (on crate0 pallet1)
        (not (clear pallet3)) ; Implied by (on crate2 pallet3)

        ; On relations
        (on crate0 pallet1)
        (on crate1 pallet0)
        (on crate2 pallet3)

        ; Connectivity (all places connected to all other places)
        (connected depot0 depot1)
        (connected depot0 depot2)
        (connected depot0 distributor0)
        (connected depot1 depot0)
        (connected depot1 depot2)
        (connected depot1 distributor0)
        (connected depot2 depot0)
        (connected depot2 depot1)
        (connected depot2 distributor0)
        (connected distributor0 depot0)
        (connected distributor0 depot1)
        (connected distributor0 depot2)
    )
    (:goal (and
        (on crate1 crate2)
        (on crate2 pallet3)
    ))
)