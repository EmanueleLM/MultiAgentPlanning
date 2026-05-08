; Problem: move crate0 to pallet3 and crate1 to pallet0
; All preferences are enforced as hard constraints by construction (no soft constraints used).
(:domain hoist-truck-ops)

(:objects
    ; locations
    yard - location

    ; supports
    pallet0 pallet3 - pallet
    truck0 ground-yard - truck   ; ground-yard is modelled as a truck-typed support for re-use - declared as truck for typing convenience
                                 ; (Note: we declared truck and pallet both as subtypes of support; ground is modeled as a truck-typed support object
                                 ;  so that hoist operations and support-at facts can be used uniformly. This does not invent new operational resources.)
    ; crates
    crate0 crate1 - crate

    ; agents / equipment
    hoist0 - hoist
    driver0 - driver
    operator0 - operator
)

(:init
    ; locations of supports (pallets, truck, ground)
    (support-at pallet0 yard)
    (support-at pallet3 yard)
    (support-at truck0 yard)
    (support-at ground-yard yard)

    ; positions of agents and equipment
    (at-hoist hoist0 yard)
    (at-operator operator0 yard)
    (at-driver driver0 yard)

    ; initial positions of crates: both on the ground at yard
    (on crate0 ground-yard)
    (on crate1 ground-yard)

    ; nothing busy initially (no explicit facts asserted)
)

(:goal (and
    (on crate0 pallet3)
    (on crate1 pallet0)
))