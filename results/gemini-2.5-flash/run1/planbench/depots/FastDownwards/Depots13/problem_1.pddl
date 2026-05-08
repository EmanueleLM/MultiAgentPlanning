(define (problem depots13-problem)
    (:domain depots13)
    (:objects
        depot0 depot1 depot2 distributor0 - place
        crate0 crate1 crate2 - crate
        pallet0 pallet1 pallet2 pallet3 - pallet
        hoist0 hoist1 hoist2 hoist3 - hoist
        truck0 truck1 truck2 - truck
    )

    (:init
        ; Object locations
        (at crate0 depot2)
        (at crate1 depot0)
        (at crate2 depot1)
        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)
        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)
        (at truck0 depot2)
        (at truck1 distributor0)
        (at truck2 distributor0)

        ; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Crate clear states (nothing on top of them)
        (clear crate0)
        (clear crate1)
        (clear crate2)

        ; Pallet clear states (nothing on top of them initially, except those with crates)
        (clear pallet3) ; Only pallet3 is initially clear based on stated initial 'on' facts

        ; Crate on surface relations
        (on crate0 pallet2)
        (on crate1 pallet0)
        (on crate2 pallet1)

        ; Implied lack of clear for pallets with crates on them
        (not (clear pallet0))
        (not (clear pallet1))
        (not (clear pallet2))
    )

    (:goal (and
        (on crate0 pallet1)
        (on crate2 crate0)
    ))
)