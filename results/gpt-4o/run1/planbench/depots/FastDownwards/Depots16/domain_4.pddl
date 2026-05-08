(define (domain logistics)
    (:requirements :strips :typing)
    (:types
        place
        depot distributor - place
        vehicle
        truck - vehicle
        item
        crate pallet - item
        equipment
        hoist - equipment
    )

    (:predicates
        (at ?entity - (either item hoist) ?place - place)
        (truck_at ?truck - truck ?place - place)
        (hoist_available ?hoist - hoist)
        (lifting ?hoist - hoist ?crate - crate)
        (clear ?item - item)
        (in_truck ?crate - crate ?truck - truck)
        (on ?crate - crate ?surface - item)
    )

    (:action drive
        :parameters (?truck - truck ?origin - place ?destination - place)
        :precondition (truck_at ?truck ?origin)
        :effect (and (not (truck_at ?truck ?origin))
                     (truck_at ?truck ?destination))
    )

    (:action lift
        :parameters (?hoist - hoist ?crate - crate ?surface - item ?place - place)
        :precondition (and (at ?crate ?place)
                           (at ?hoist ?place)
                           (on ?crate ?surface)
                           (clear ?crate)
                           (clear ?surface)
                           (hoist_available ?hoist))
        :effect (and (not (at ?crate ?place))
                     (lifting ?hoist ?crate)
                     (not (hoist_available ?hoist))
                     (not (on ?crate ?surface)))
    )

    (:action drop
        :parameters (?hoist - hoist ?crate - crate ?surface - item ?place - place)
        :precondition (and (lifting ?hoist ?crate)
                           (at ?hoist ?place)
                           (at ?surface ?place)
                           (clear ?surface))
        :effect (and (hoist_available ?hoist)
                     (not (lifting ?hoist ?crate))
                     (at ?crate ?place)
                     (on ?crate ?surface)
                     (not (clear ?surface))
                     (clear ?crate))
    )

    (:action load
        :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
        :precondition (and (lifting ?hoist ?crate)
                           (truck_at ?truck ?place)
                           (at ?hoist ?place))
        :effect (and (not (lifting ?hoist ?crate))
                     (in_truck ?crate ?truck)
                     (hoist_available ?hoist))
    )

    (:action unload
        :parameters (?hoist - hoist ?crate - crate ?truck - truck ?place - place)
        :precondition (and (in_truck ?crate ?truck)
                           (truck_at ?truck ?place)
                           (at ?hoist ?place)
                           (hoist_available ?hoist))
        :effect (and (not (in_truck ?crate ?truck))
                     (lifting ?hoist ?crate)
                     (not (hoist_available ?hoist)))
    )
)