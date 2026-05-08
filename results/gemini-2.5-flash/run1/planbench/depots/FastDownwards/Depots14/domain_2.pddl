(define (domain depots14)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place - object
        surface - object
        depot - place
        distributor - place
        pallet - surface
        crate - surface
        truck - object
        hoist - object
    )

    (:predicates
        (at ?obj - (either truck hoist pallet crate) ?p - place)
        (on ?c - crate ?s - surface) ; ?c is on ?s
        (clear ?s - surface) ; nothing is on surface ?s
        (hoist_available ?h - hoist)
        (hoist_lifting ?h - hoist ?c - crate) ; ?h is lifting ?c
        (in_truck ?c - crate ?t - truck) ; ?c is inside ?t
        (connected ?p1 - place ?p2 - place) ; Explicitly models road connections
    )

    (:action drive_truck
        :parameters (?truck - truck ?from - place ?to - place)
        :precondition (and
            (at ?truck ?from)
            (connected ?from ?to) ; Added explicit connectivity precondition
        )
        :effect (and
            (not (at ?truck ?from))
            (at ?truck ?to)
        )
    )

    (:action lift_crate
        :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?crate ?place) ; crate is resting on a surface at this place
            (at ?surface ?place) ; surface is at this place
            (hoist_available ?hoist)
            (clear ?crate) ; nothing on top of the crate
            (on ?crate ?surface) ; crate is on the surface
        )
        :effect (and
            (not (at ?crate ?place)) ; crate is no longer resting at the place (now held by hoist)
            (hoist_lifting ?hoist ?crate)
            (not (hoist_available ?hoist))
            (clear ?surface) ; the surface the crate was on becomes clear
            (not (on ?crate ?surface))
        )
    )

    (:action drop_crate
        :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?surface ?place)
            (clear ?surface) ; surface is clear to drop onto
            (hoist_lifting ?hoist ?crate)
        )
        :effect (and
            (hoist_available ?hoist)
            (not (hoist_lifting ?hoist ?crate))
            (at ?crate ?place) ; crate is now resting at the place
            (not (clear ?surface)) ; surface is no longer clear
            (clear ?crate) ; the dropped crate itself is clear (nothing on it)
            (on ?crate ?surface)
        )
    )

    (:action load_crate
        :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?truck ?place)
            (hoist_lifting ?hoist ?crate)
        )
        :effect (and
            (hoist_available ?hoist)
            (not (hoist_lifting ?hoist ?crate))
            (in_truck ?crate ?truck)
        )
    )

    (:action unload_crate
        :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?truck ?place)
            (hoist_available ?hoist)
            (in_truck ?crate ?truck)
        )
        :effect (and
            (not (in_truck ?crate ?truck))
            (not (hoist_available ?hoist))
            (hoist_lifting ?hoist ?crate)
        )
    )
)