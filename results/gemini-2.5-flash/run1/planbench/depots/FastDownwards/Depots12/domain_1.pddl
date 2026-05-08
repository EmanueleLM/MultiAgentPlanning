(define (domain depots12)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        depot - place
        distributor - place
        surface
        pallet - surface
        crate - surface
        truck
        hoist
    )

    (:predicates
        (at ?obj - (or truck hoist crate surface) ?loc - place)
        (available ?h - hoist)
        (clear ?s - surface)
        (lifting ?h - hoist ?c - crate)
        (on ?c - crate ?s - surface)
        (in ?c - crate ?t - truck)
    )

    ;; Drive a truck from one place to another place.
    (:action drive_truck
        :parameters (?t - truck ?p1 - place ?p2 - place)
        :precondition (and
            (at ?t ?p1)
        )
        :effect (and
            (not (at ?t ?p1))
            (at ?t ?p2)
        )
    )

    ;; Use a hoist to lift a crate from a surface at a place.
    ;; Preconditions: Hoist and crate are at the same place. Hoist is available. Crate is clear. Crate is on a surface.
    ;; Effects: Crate is no longer at the place, hoist is lifting it, hoist is not available. The surface from which it was lifted becomes clear, and the crate is no longer on that surface.
    (:action lift_crate
        :parameters (?c - crate ?s - surface ?h - hoist ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (available ?h)
            (clear ?c)
            (on ?c ?s)
        )
        :effect (and
            (not (at ?c ?p))
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s)
            (not (on ?c ?s))
        )
    )

    ;; Use a hoist to drop a crate to a surface at a place.
    ;; Preconditions: Hoist and target surface are at the same place. Target surface is clear. Hoist is lifting the crate.
    ;; Effects: Hoist becomes available, is no longer lifting the crate. Crate is at the place. Target surface is no longer clear. Crate becomes clear (nothing on it). Crate is on the surface.
    (:action drop_crate
        :parameters (?c - crate ?s - surface ?h - hoist ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s)
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p)
            (not (clear ?s))
            (clear ?c)
            (on ?c ?s)
        )
    )

    ;; Use a hoist to load a crate into a truck at a place.
    ;; Preconditions: Hoist and truck are at the same place. Hoist is lifting the crate.
    ;; Effects: Crate is in the truck. Hoist becomes available, is no longer lifting the crate.
    (:action load_crate
        :parameters (?c - crate ?t - truck ?h - hoist ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c)
        )
        :effect (and
            (in ?c ?t)
            (available ?h)
            (not (lifting ?h ?c))
        )
    )

    ;; Use a hoist to unload a crate from a truck at a place.
    ;; Preconditions: Hoist and truck are at the same place. Hoist is available. Crate is in the truck.
    ;; Effects: Crate is no longer in the truck. Hoist is not available, and starts lifting the crate.
    (:action unload_crate
        :parameters (?c - crate ?t - truck ?h - hoist ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h)
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c)
        )
    )
)