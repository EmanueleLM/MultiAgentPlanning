(define (domain depots3)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place surface - object
        depot distributor - place
        truck hoist - object
        crate pallet - surface
    )
    (:predicates
        (at ?obj - (either truck hoist surface) ?loc - place) ; Fixed syntax: use (either) to list multiple object types
        (on ?c - crate ?s - surface)
        (in ?c - crate ?t - truck)
        (clear ?s - surface)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
        (connected ?p1 - place ?p2 - place)
    )

    (:action drive_truck)
        (:parameters (?t - truck ?p1 - place ?p2 - place)
        )
        (:precondition (and
            (at ?t ?p1)
            (connected ?p1 ?p2)
        ))
        (:effect (and
            (not (at ?t ?p1))
            (at ?t ?p2)
        ))

    (:action lift_crate_from_surface)
        (:parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        )
        (:precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (on ?c ?s)
            (clear ?c)      ; The crate itself must be clear to be lifted
            (available ?h)
        ))
        (:effect (and
            (not (at ?c ?p))        ; Crate is no longer at the place (it's being lifted)
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s)              ; The surface it was on becomes clear
            (not (on ?c ?s))
        ))

    (:action drop_crate_to_surface)
        (:parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        )
        (:precondition (and
            (at ?h ?p)
            (at ?s ?p)             ; Target surface must be at the place
            (clear ?s)             ; Target surface must be clear
            (lifting ?h ?c)
        ))
        (:effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p)             ; Crate is now at the place
            (not (clear ?s))       ; Target surface is no longer clear
            (clear ?c)             ; Crate remains clear (nothing on it)
            (on ?c ?s)
        ))

    (:action load_crate_into_truck)
        (:parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        )
        (:precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c)
        ))
        (:effect (and
            (in ?c ?t)
            (available ?h)
            (not (lifting ?h ?c))
        ))

    (:action unload_crate_from_truck)
        (:parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        )
        (:precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h)
            (in ?c ?t)
        ))
        (:effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c)
        ))
)