(define (problem depots28-problem)
    (:domain depots28)
    (:objects
        depot0 depot1 depot2 - depot
        distributor0 - distributor
        crate0 crate1 crate2 - crate
        hoist0 hoist1 hoist2 hoist3 - hoist
        pallet0 pallet1 pallet2 pallet3 - pallet
        truck0 truck1 truck2 - truck
    )
    (:init
        (at crate0 distributor0)
        (at crate1 distributor0)
        (at crate2 depot1)

        (at hoist0 depot0)
        (at hoist1 depot1)
        (at hoist2 depot2)
        (at hoist3 distributor0)

        (at pallet0 depot0)
        (at pallet1 depot1)
        (at pallet2 depot2)
        (at pallet3 distributor0)

        (at truck0 depot1)
        (at truck1 depot1)
        (at truck2 depot0)

        (available hoist0)
        (available hoist1)
        (available hoist2)
        (available hoist3)

        ; Explicitly state 'clear' status based on 'on' relations
        (clear crate1)   ; crate1 is on crate0, but crate1 itself is clear
        (clear crate2)   ; crate2 is on pallet1, but crate2 itself is clear
        (clear pallet0)  ; nothing on pallet0
        (clear pallet2)  ; nothing on pallet2

        ; The following objects have other objects on them, so they are NOT clear.
        (not (clear crate0))   ; crate1 is on crate0
        (not (clear pallet1))  ; crate2 is on pallet1
        (not (clear pallet3))  ; crate0 is on pallet3

        (on crate0 pallet3)
        (on crate1 crate0)
        (on crate2 pallet1)
    )
    (:goal (and
        (on crate0 crate2)
        (on crate1 crate0)
        (on crate2 pallet0)
    ))
)