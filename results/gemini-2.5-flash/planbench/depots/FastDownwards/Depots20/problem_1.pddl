(define (problem depots20_instance)
    (:domain depots20)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        pallet0 pallet1 pallet2 pallet3 - pallet
        crate0 crate1 crate2 - crate
        truck0 truck1 truck2 - truck
        hoist0 hoist1 hoist2 hoist3 - hoist
    )
    (:init
        ; Truck locations
        (at truck0 depot1)
        (at truck1 depot2)
        (at truck2 distributor0)

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

        ; Crate locations (initial position on pallets implies at that place)
        (at crate0 depot1)
        (at crate1 depot2)
        (at crate2 depot0)

        ; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Explicit clear states based on problem statement
        (clear crate0)
        (clear crate1)
        (clear crate2)
        (clear pallet3) 

        ; Crate on pallet relations
        (on crate0 pallet1)
        (on crate1 pallet2)
        (on crate2 pallet0)

        ; Implied 'not clear' states are implicitly false as they are not declared 'clear'
        ; e.g., (not (clear pallet0)) is implicitly true because (clear pallet0) is not asserted.
        ; (not (clear pallet1)) and (not (clear pallet2)) follow the same logic.

        ; No crates in trucks initially
        ; No hoists are lifting initially
    )
    (:goal (and
        (on crate0 pallet2)
        (on crate1 pallet1)
        (on crate2 pallet0)
    ))
)