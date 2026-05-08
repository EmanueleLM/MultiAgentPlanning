(define (domain depots6)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place - object
        depot distributor - place
        surface - object
        pallet crate - surface
        truck - object
        hoist - object
    )

    (:predicates
        (at ?obj - (or crate truck hoist pallet) ?loc - place)
        (on ?crate - crate ?surface - surface)
        (clear ?surface - surface)
        (available ?hoist - hoist)
        (lifting ?hoist - hoist ?crate - crate)
        (in ?crate - crate ?truck - truck)
        (road ?from - place ?to - place)
    )

    ;; Drive a truck from one place to another place.
    (:action drive
        :parameters (?truck - truck ?from - place ?to - place)
        :precondition (and
            (at ?truck ?from)
            (road ?from ?to)
        )
        :effect (and
            (not (at ?truck ?from))
            (at ?truck ?to)
        )
    )

    ;; Use a hoist to lift a crate from a surface at a place.
    (:action lift
        :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?crate ?place)
            (at ?surface ?place)
            (available ?hoist)
            (clear ?crate)          ; The crate itself must be clear to be lifted
            (on ?crate ?surface)    ; The crate must be on the specified surface
        )
        :effect (and
            (not (on ?crate ?surface))
            (not (clear ?crate))    ; The crate is no longer clear (it's being lifted)
            (clear ?surface)        ; The surface it was on is now clear
            (lifting ?hoist ?crate)
            (not (available ?hoist))
            (not (at ?crate ?place)) ; The crate is no longer "at" the place in the context of being on a surface
        )
    )

    ;; Use a hoist to drop a crate to a surface at a place.
    (:action drop
        :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?surface ?place)
            (clear ?surface)        ; The destination surface must be clear
            (lifting ?hoist ?crate)
        )
        :effect (and
            (not (lifting ?hoist ?crate))
            (available ?hoist)
            (at ?crate ?place)      ; The crate is now at the place, on a surface
            (not (clear ?surface))  ; The surface is no longer clear
            (clear ?crate)          ; The dropped crate is now clear (nothing on top of it)
            (on ?crate ?surface)
        )
    )

    ;; Use a hoist to load a crate into a truck at a place.
    ;; Note: Effects were incomplete in the human specification, inferred for logical consistency.
    (:action load
        :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?truck ?place)
            (lifting ?hoist ?crate)
        )
        :effect (and
            (not (lifting ?hoist ?crate))
            (available ?hoist)
            (in ?crate ?truck)
            (not (at ?crate ?place)) ; The crate is no longer at the place, it's inside the truck
        )
    )

    ;; Use a hoist to unload a crate from a truck at a place.
    (:action unload
        :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?truck ?place)
            (available ?hoist)
            (in ?crate ?truck)
        )
        :effect (and
            (not (in ?crate ?truck))
            (not (available ?hoist))
            (lifting ?hoist ?crate)
            (at ?crate ?place) ; The crate is now at the place, being lifted
        )
    )
)