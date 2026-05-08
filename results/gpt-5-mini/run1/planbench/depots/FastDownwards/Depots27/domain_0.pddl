; Domain: hoist-truck-ops
; Notes:
; - Uses :negative-preconditions to require that resources (hoists, trucks) are not busy before actions;
;   negative preconditions are used to make mutual-exclusion explicit (no implicit bookkeeping tokens).
; - This domain keeps actions distinct by agent as requested: drive-truck, hoist-lift, hoist-drop, hoist-load, hoist-unload.
; - No penalty/shortfall constructs are present. All constraints are hard (preconditions).
(:requirements :strips :typing :negative-preconditions)
(:types
    location
    support     ; abstract type for anything a crate can sit on (pallet, truck, ground)
    pallet - support
    truck  - support
    crate
    hoist
    driver
    operator
)

(:predicates
    ; locations / positioning
    (support-at ?s - support ?l - location)     ; support (pallet, truck, ground) is at a location
    (at-hoist ?h - hoist ?l - location)         ; hoist is at a location
    (at-operator ?o - operator ?l - location)   ; operator is at a location
    (at-driver ?d - driver ?l - location)       ; driver is at a location

    ; cargo state
    (on ?c - crate ?s - support)                ; crate is currently on a support object

    ; hoist state
    (hoist-holding ?h - hoist ?c - crate)       ; hoist is holding a crate
    (hoist-busy ?h - hoist)                     ; hoist is occupied

    ; truck state
    (truck-busy ?t - truck)                     ; truck is occupied/engaged (mutual exclusion marker)
)

; === Actions ===

; Driving a truck from one location to another.
; Driver must be at the truck's current location; truck must not be busy.
; When the truck moves, the support-at fact for the truck is updated so crates "on" the truck implicitly move with it.
(:action drive-truck
    :parameters (?d - driver ?t - truck ?from - location ?to - location)
    :precondition (and
        (at-driver ?d ?from)
        (support-at ?t ?from)
        (not (truck-busy ?t))
    )
    :effect (and
        (not (support-at ?t ?from))
        (support-at ?t ?to)
        (not (at-driver ?d ?from))
        (at-driver ?d ?to)
    )
)

; Hoist lifts a crate from a support (pallet, truck, ground) into the hoist (hoist becomes busy).
; Requires operator and hoist at same location and the support at that location.
(:action hoist-lift
    :parameters (?o - operator ?h - hoist ?c - crate ?s - support ?loc - location)
    :precondition (and
        (at-operator ?o ?loc)
        (at-hoist ?h ?loc)
        (support-at ?s ?loc)
        (on ?c ?s)
        (not (hoist-busy ?h))
    )
    :effect (and
        (not (on ?c ?s))
        (hoist-holding ?h ?c)
        (hoist-busy ?h)
    )
)

; Hoist drops the crate it is holding onto a support (pallet, truck, ground), freeing the hoist.
; Requires operator and hoist at same location and the target support at that location.
(:action hoist-drop
    :parameters (?o - operator ?h - hoist ?c - crate ?s - support ?loc - location)
    :precondition (and
        (at-operator ?o ?loc)
        (at-hoist ?h ?loc)
        (support-at ?s ?loc)
        (hoist-holding ?h ?c)
    )
    :effect (and
        (not (hoist-holding ?h ?c))
        (on ?c ?s)
        (not (hoist-busy ?h))
    )
)

; Hoist-load: place a crate that the hoist is holding onto a truck at the same location.
; This action enforces the required ordering: the hoist must already be holding the crate
; (i.e., hoist-lift must have been executed earlier).
(:action hoist-load
    :parameters (?o - operator ?h - hoist ?c - crate ?t - truck ?loc - location)
    :precondition (and
        (at-operator ?o ?loc)
        (at-hoist ?h ?loc)
        (support-at ?t ?loc)
        (hoist-holding ?h ?c)
    )
    :effect (and
        (not (hoist-holding ?h ?c))
        (on ?c ?t)
        (not (hoist-busy ?h))
    )
)

; Hoist-unload: place a crate that the hoist is holding onto a pallet at the same location.
; Enforces ordering (requires hoist to be holding the crate).
(:action hoist-unload
    :parameters (?o - operator ?h - hoist ?c - crate ?p - pallet ?loc - location)
    :precondition (and
        (at-operator ?o ?loc)
        (at-hoist ?h ?loc)
        (support-at ?p ?loc)
        (hoist-holding ?h ?c)
    )
    :effect (and
        (not (hoist-holding ?h ?c))
        (on ?c ?p)
        (not (hoist-busy ?h))
    )
)
)