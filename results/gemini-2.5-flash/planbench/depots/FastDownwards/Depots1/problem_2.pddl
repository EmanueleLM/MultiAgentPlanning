(define (problem depots1-instance)
    (:domain depots1)
    (:objects
        depot0 depot1 depot2 distributor0 - place
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
    )
    (:init
        ; Locations of objects
        (at crate0 depot0)
        (at crate1 depot0)
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
        (at truck1 depot1)
        (at truck2 depot0)

        ; Hoist availability
        (hoist_available hoist0)
        (hoist_available hoist1)
        (hoist_available hoist2)
        (hoist_available hoist3)

        ; Stacking relationships and derived clear states
        (on crate0 pallet0) ; crate0 on pallet0 -> pallet0 not clear
        (on crate1 crate0) ; crate1 on crate0 -> crate0 not clear
        (on crate2 pallet2) ; crate2 on pallet2 -> pallet2 not clear

        (clear crate1) ; as stated (nothing on crate1)
        (clear crate2) ; as stated (nothing on crate2)
        (clear pallet1) ; as stated (nothing on pallet1)
        (clear pallet3) ; as stated (nothing on pallet3)

        (not (clear pallet0)) ; Inferred from (on crate0 pallet0)
        (not (clear crate0)) ; Inferred from (on crate1 crate0)
        (not (clear pallet2)) ; Inferred from (on crate2 pallet2)
    )
    (:goal (and
        (on crate0 pallet3)
        (on crate1 pallet0)
        (on crate2 crate0)
    ))