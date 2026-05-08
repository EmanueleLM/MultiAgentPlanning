(define (domain depots6)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place - object
        depot distributor - place
        locatable - object
        truck - locatable
        hoist - locatable
        surface - locatable  ; surface is now locatable
        crate - surface
        pallet - surface
    )

    (:predicates
        (at ?obj - locatable ?loc - place) ; ?obj can now be truck, hoist, crate, or pallet
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
            (at ?surface ?place)
            (at ?crate ?place) ; Crate must be at the place to be lifted
            (on ?crate ?surface)
            (available ?hoist)
            (clear ?crate)
        )
        :effect (and
            (not (on ?crate ?surface))
            (not (clear ?crate))
            (clear ?surface)
            (lifting ?hoist ?crate)
            (not (available ?hoist))
            (not (at ?crate ?place)) ; Crate is no longer at the place
        )
    )

    ;; Use a hoist to drop a crate to a surface at a place.
    (:action drop
        :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?surface ?place)
            (clear ?surface)
            (lifting ?hoist ?crate)
        )
        :effect (and
            (not (lifting ?hoist ?crate))
            (available ?hoist)
            (not (clear ?surface))
            (clear ?crate)
            (on ?crate ?surface)
            (at ?crate ?place) ; Crate is now at the place
        )
    )

    ;; Use a hoist to load a crate into a truck at a place.
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
            ; Crate was already (not (at ?crate ?place)) because it was lifting
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
            ; Crate becomes lifting, so it's (not (at ?crate ?place))
        )
    )
)