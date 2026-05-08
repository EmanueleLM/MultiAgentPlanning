(define (domain depots)
    (:requirements :strips :typing :negative-preconditions :action-costs)
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
        (at ?obj - (either truck hoist crate pallet) ?loc - place)
        (on ?crate - crate ?pallet - pallet) ; crate is on pallet
        (clear ?surface - surface) ; nothing is on surface
        (attached ?hoist - hoist ?crate - crate) ; hoist is holding crate
        (in ?crate - crate ?truck - truck) ; crate is inside truck
        (available ?hoist - hoist) ; hoist is available
    )

    (:functions (total-cost))

    (:action drive
        :parameters (?truck - truck ?from - place ?to - place)
        :precondition (and
            (at ?truck ?from)
            (not (= ?from ?to)) ; Must move to a different location
        )
        :effect (and
            (not (at ?truck ?from))
            (at ?truck ?to)
            (increase (total-cost) 1)
        )
    )

    (:action lift
        :parameters (?hoist - hoist ?crate - crate ?pallet - pallet ?loc - place)
        :precondition (and
            (at ?hoist ?loc)
            (at ?crate ?loc)
            (on ?crate ?pallet)
            (clear ?crate) ; Crate itself must be clear on top to be lifted
            (available ?hoist)
        )
        :effect (and
            (not (on ?crate ?pallet))
            (not (at ?crate ?loc)) ; Crate is no longer directly at the location, it's attached to hoist
            (attached ?hoist ?crate)
            (not (available ?hoist))
            (clear ?pallet) ; The pallet becomes clear as the crate is removed
            (increase (total-cost) 1)
        )
    )

    (:action drop
        :parameters (?hoist - hoist ?crate - crate ?pallet - pallet ?loc - place)
        :precondition (and
            (at ?hoist ?loc)
            (attached ?hoist ?crate)
            (at ?pallet ?loc) ; Pallet must be at the same location
            (clear ?pallet) ; Pallet must be clear to drop a crate on it
        )
        :effect (and
            (not (attached ?hoist ?crate))
            (at ?crate ?loc) ; Crate is now at the location
            (on ?crate ?pallet)
            (available ?hoist)
            (not (clear ?pallet)) ; Pallet is no longer clear
            (clear ?crate) ; As per human spec, crate is clear once dropped
            (increase (total-cost) 1)
        )
    )

    (:action load
        :parameters (?hoist - hoist ?crate - crate ?truck - truck ?loc - place)
        :precondition (and
            (at ?hoist ?loc)
            (attached ?hoist ?crate)
            (at ?truck ?loc)
        )
        :effect (and
            (not (attached ?hoist ?crate))
            (in ?crate ?truck)
            (available ?hoist)
            (increase (total-cost) 1)
        )
    )

    (:action unload
        :parameters (?hoist - hoist ?crate - crate ?truck - truck ?loc - place)
        :precondition (and
            (at ?hoist ?loc)
            (at ?truck ?loc)
            (in ?crate ?truck)
            (available ?hoist) ; Hoist must be available to pick up from truck
        )
        :effect (and
            (not (in ?crate ?truck))
            (attached ?hoist ?crate)
            (not (available ?hoist))
            (increase (total-cost) 1)
        )
    )