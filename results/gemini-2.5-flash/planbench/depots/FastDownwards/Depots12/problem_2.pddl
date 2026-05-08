(define (problem depots12)
    (:domain depots)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        crate0 crate1 crate2 - crate
        hoist0 hoist1 hoist2 hoist3 - hoist
        pallet0 pallet1 pallet2 pallet3 - pallet
        truck0 truck1 truck2 - truck
    )
    (:init
        ; Crates at places
        (at crate0 depot2)
        (at crate1 distributor0)
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
        (at truck0 depot1)
        (at truck1 depot0)
        (at truck2 depot1)

        ; Hoist availability
        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Initial stacking and clear status
        ; crate0 is on pallet2
        (on crate0 pallet2)
        (at pallet2 depot2) ; Ensure pallet is at the same location as crate0

        ; crate1 is on pallet3
        (on crate1 pallet3)
        (at pallet3 distributor0) ; Ensure pallet is at the same location as crate1

        ; crate2 is on crate1
        (on crate2 crate1)
        (at crate1 distributor0) ; Reiterate crate1's location if it wasn't already inferred by 'at crate1 distributor0'

        ; Derived 'not clear' states based on 'on' relations
        (not (clear pallet2)) ; pallet2 is not clear because crate0 is on it
        (not (clear pallet3)) ; pallet3 is not clear because crate1 is on it
        (not (clear crate1))  ; crate1 is not clear because crate2 is on it

        ; Explicitly clear items as per specification (these are clear because nothing is on them)
        (clear crate0)
        (clear crate2)
        (clear pallet0)
        (clear pallet1)
    )
    (:goal (and
        (on crate0 crate1)
        (on crate1 pallet3)
        (on crate2 pallet1)
    ))
)