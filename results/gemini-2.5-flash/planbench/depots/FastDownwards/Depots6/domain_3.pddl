(define (domain depots6)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place - object
        depot distributor - place
        surface - object
        crate - surface
        locatable - object ; New supertype for objects that explicitly have an 'at' location
        truck - locatable
        hoist - locatable
        pallet - surface locatable ; Pallet inherits from both surface and locatable
    )

    (:predicates
        (at ?obj - locatable ?loc - place) ; Locatable objects are trucks, hoists, pallets
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
            (at ?surface ?place) ; Surface must be at the place
            (on ?crate ?surface) ; Crate must be on the specified surface
            (available ?hoist)
            (clear ?crate)       ; The crate itself must be clear to be lifted
        )
        :effect (and
            (not (on ?crate ?surface))
            (not (clear ?crate)) ; The crate is no longer clear (it's being lifted)
            (clear ?surface)     ; The surface it was on is now clear
            (lifting ?hoist ?crate)
            (not (available ?hoist))
            ;; "the crate is not at the place" is now implicit as it's no longer 'on' a surface
        )
    )

    ;; Use a hoist to drop a crate to a surface at a place.
    (:action drop
        :parameters (?hoist - hoist ?crate - crate ?surface - surface ?place - place)
        :precondition (and
            (at ?hoist ?place)
            (at ?surface ?place) ; Surface must be at the place
            (clear ?surface)     ; The destination surface must be clear
            (lifting ?hoist ?crate)
        )
        :effect (and
            (not (lifting ?hoist ?crate))
            (available ?hoist)
            (not (clear ?surface)) ; The surface is no longer clear
            (clear ?crate)         ; The dropped crate is now clear (nothing on top of it)
            (on ?crate ?surface)
            ;; "the crate is at the place" is now implicit as it's 'on' a surface at that place
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
            ;; "the crate is not at the place" (inferred previously) is now implicit
            ;; as it's 'in' a truck, not 'on' a surface or 'lifting'
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
            ;; "the crate is at the place" (inferred previously) is removed as it's now 'lifting', not 'on' a surface
        )
    )