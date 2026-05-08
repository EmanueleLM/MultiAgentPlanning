(define (domain transport)
    (:requirements :strips :typing :negative-preconditions)
    (:types place surface vehicle lifting_device)
    
    (:predicates
        (at ?entity - (either vehicle lifting_device surface) ?place - place)
        (clear ?surface - surface)
        (on ?crate - surface ?surface - surface)
        (in ?crate - surface ?truck - vehicle)
        (hoist_available ?hoist - lifting_device)
        (hoist_lifting ?hoist - lifting_device ?crate - surface)
    )
    
    (:action drive_truck
        :parameters (?truck - vehicle ?origin - place ?destination - place)
        :precondition (and (at ?truck ?origin) (not (= ?origin ?destination)))
        :effect (and
            (not (at ?truck ?origin))
            (at ?truck ?destination)
        )
    )
    
    (:action lift_crate
        :parameters (?hoist - lifting_device ?place - place ?crate - surface ?surface - surface)
        :precondition (and
            (at ?hoist ?place)
            (at ?crate ?place)
            (hoist_available ?hoist)
            (clear ?crate)
            (on ?crate ?surface)
        )
        :effect (and
            (not (at ?crate ?place))
            (hoist_lifting ?hoist ?crate)
            (not (hoist_available ?hoist))
            (clear ?surface)
            (not (on ?crate ?surface))
        )
    )
    
    (:action drop_crate
        :parameters (?hoist - lifting_device ?place - place ?crate - surface ?surface - surface)
        :precondition (and
            (at ?hoist ?place)
            (hoist_lifting ?hoist ?crate)
            (clear ?surface)
        )
        :effect (and
            (hoist_available ?hoist)
            (not (hoist_lifting ?hoist ?crate))
            (at ?crate ?place)
            (on ?crate ?surface)
            (not (clear ?surface))
            (clear ?crate)
        )
    )

    (:action load_crate
        :parameters (?hoist - lifting_device ?place - place ?crate - surface ?truck - vehicle)
        :precondition (and
            (at ?hoist ?place)
            (at ?truck ?place)
            (hoist_lifting ?hoist ?crate)
        )
        :effect (and
            (not (hoist_lifting ?hoist ?crate))
            (in ?crate ?truck)
            (hoist_available ?hoist)
        )
    )

    (:action unload_crate
        :parameters (?hoist - lifting_device ?place - place ?crate - surface ?truck - vehicle)
        :precondition (and
            (at ?hoist ?place)
            (at ?truck ?place)
            (in ?crate ?truck)
            (hoist_available ?hoist)
        )
        :effect (and
            (not (in ?crate ?truck))
            (hoist_lifting ?hoist ?crate)
            (not (hoist_available ?hoist))
        )
    )
)