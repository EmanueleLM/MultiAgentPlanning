(define (domain depots)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        item_locatable ; Any object that can be "at" a place
        surface - object ; Any object that can have something "on" it or be "clear"
        depot distributor - place
        hoist truck - item_locatable
        pallet - surface item_locatable ; A pallet is both a surface and locatable
        crate - item_locatable surface ; A crate is both locatable and a surface
    )
    (:predicates
        (at ?obj - item_locatable ?p - place)
        (on ?c - crate ?s - surface)
        (in ?c - crate ?t - truck)
        (clear ?s - surface) ; A surface is clear if nothing is on it
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate) ; A hoist is lifting a specific crate
    )

    (:action drive
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
            (at ?t ?from)
            (not (= ?from ?to)) ; Truck cannot drive to the same place
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    (:action lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (available ?h)
            (clear ?c) ; The crate to be lifted must be clear (nothing on it)
            (on ?c ?s)  ; The crate must be on a surface
        )
        :effect (and
            (not (at ?c ?p)) ; Crate is no longer at the place once lifted
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s) ; The surface the crate was on is now clear
            (not (on ?c ?s))
        )
    )

    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p) ; ?s must be at the place to drop a crate on it
            (clear ?s) ; The target surface must be clear
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p) ; Crate is now at the place, on the surface
            (not (clear ?s)) ; The target surface is no longer clear
            (clear ?c) ; The crate itself is now clear, as it's on top
            (on ?c ?s)
        )
    )

    (:action load
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c) ; Hoist must be lifting the crate
        )
        :effect (and
            (not (lifting ?h ?c))
            (available ?h)
            (in ?c ?t) ; Crate is now in the truck
            ; (at ?c ?p) was removed by the preceding lift action
        )
    )

    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h) ; Hoist must be available to unload
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c) ; Hoist is now lifting the crate
            ; (at ?c ?p) is not set here, as the crate is now being lifted
        )
    )
)