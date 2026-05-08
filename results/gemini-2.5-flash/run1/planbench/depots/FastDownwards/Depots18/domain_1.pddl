(define (domain depots18)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        depot distributor - place
        surface
        pallet crate - surface
        truck
        hoist
    )

    (:predicates
        (at ?x - (or truck hoist crate pallet) ?p - place) ; ?x can be truck, hoist, crate, or pallet
        (on ?c - crate ?s - surface) ; ?c is on top of ?s
        (in ?c - crate ?t - truck) ; ?c is inside ?t
        (lifting ?h - hoist ?c - crate) ; ?h is lifting ?c
        (available ?h - hoist) ; ?h is available for use
        (clear ?s - surface) ; ?s has nothing on top of it
    )

    (:action drive-truck
        :parameters (?t - truck ?p1 - place ?p2 - place)
        :precondition (at ?t ?p1)
        :effect (and
            (not (at ?t ?p1))
            (at ?t ?p2)
        )
    )

    (:action lift-crate-from-surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (available ?h)
            (clear ?c) ; The crate itself must be clear (nothing on it) to be lifted
            (on ?c ?s)
        )
        :effect (and
            (not (at ?c ?p))        ; Crate is no longer on a static surface at the place
            (lifting ?h ?c)         ; Hoist is now lifting the crate
            (not (available ?h))    ; Hoist is no longer available
            (clear ?s)              ; The surface ?s becomes clear
            (not (on ?c ?s))        ; Crate is no longer on surface ?s
            ; (clear ?c) status is preserved as per prompt, implying a lifted crate is still "clear"
        )
    )

    (:action drop-crate-to-surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s)              ; The target surface must be clear
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)          ; Hoist becomes available
            (not (lifting ?h ?c))   ; Hoist is no longer lifting the crate
            (at ?c ?p)              ; Crate is now on a static surface at the place
            (not (clear ?s))        ; The target surface ?s is no longer clear
            (clear ?c)              ; The dropped crate ?c is now the top of the stack, so it is clear
            (on ?c ?s)              ; Crate ?c is on surface ?s
        )
    )

    (:action load-crate-into-truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c)
        )
        :effect (and
            (in ?c ?t)              ; Crate is now in the truck
            (available ?h)          ; Hoist becomes available
            (not (lifting ?h ?c))   ; Hoist is no longer lifting the crate
            ; (clear ?c) status is preserved as per prompt.
            ; (not (at ?c ?p)) is already handled by the preceding lift action.
        )
    )

    (:action unload-crate-from-truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h)          ; Hoist must be available to unload
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))        ; Crate is no longer in the truck
            (not (available ?h))    ; Hoist is no longer available
            (lifting ?h ?c)         ; Hoist is now lifting the crate
            ; (at ?c ?p) is not set here because the crate is still being lifted; it will be set by a subsequent drop action.
            ; (clear ?c) status is preserved as per prompt.
        )
    )
)