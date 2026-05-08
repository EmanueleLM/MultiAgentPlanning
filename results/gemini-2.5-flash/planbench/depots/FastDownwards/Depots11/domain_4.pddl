(define (domain depots11)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        surface
        physical_object ; New common supertype for objects that can have a location
        hoist truck - physical_object
        depot distributor - place
        crate - surface physical_object ; crate is a surface and a physical object
        pallet - surface physical_object ; pallet is a surface and a physical object
    )
    (:predicates
        (at ?obj - physical_object ?loc - place) ; Objects that can have a location
        (available ?h - hoist)
        (clear ?s - surface) ; true if nothing is on top of ?s
        (on ?c - crate ?s - surface) ; ?c is on top of ?s
        (lifting ?h - hoist ?c - crate) ; ?h is lifting ?c
        (in ?c - crate ?t - truck) ; ?c is inside ?t
        (connected ?p1 - place ?p2 - place) ; ?p1 and ?p2 are connected by a road
    )

    (:action drive_truck
        :parameters (?t - truck ?from ?to - place)
        :precondition (and
            (at ?t ?from)
            (connected ?from ?to)
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    (:action lift_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (on ?c ?s) ; Crate must be on a surface to be lifted from it
            (available ?h)
            (clear ?c) ; Crate itself must be clear to be lifted
        )
        :effect (and
            (not (at ?c ?p)) ; Crate is no longer at the place, it's being lifted
            (not (on ?c ?s)) ; Crate is no longer on the surface
            (clear ?s) ; The surface it was on becomes clear
            (not (available ?h)) ; Hoist is no longer available
            (lifting ?h ?c) ; Hoist is now lifting the crate
        )
    )

    (:action drop_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p) ; Surface must be at the same place
            (clear ?s) ; Surface must be clear to drop something onto it
            (lifting ?h ?c) ; Hoist must be lifting the crate
        )
        :effect (and
            (not (lifting ?h ?c)) ; Hoist is no longer lifting the crate
            (available ?h) ; Hoist becomes available
            (at ?c ?p) ; Crate is now at the place
            (on ?c ?s) ; Crate is now on the surface
            (not (clear ?s)) ; The surface is no longer clear
            (clear ?c) ; The dropped crate itself is clear
        )
    )

    (:action load_crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c) ; Hoist must be lifting the crate to load it
        )
        :effect (and
            (in ?c ?t) ; Crate is now in the truck
            (not (lifting ?h ?c)) ; Hoist is no longer lifting the crate
            (available ?h) ; Hoist becomes available
            (not (at ?c ?p)) ; Crate is no longer directly at the place
        )
    )

    (:action unload_crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h) ; Hoist must be available to unload
            (in ?c ?t) ; Crate must be in the truck
        )
        :effect (and
            (not (in ?c ?t)) ; Crate is no longer in the truck
            (not (available ?h)) ; Hoist is no longer available as it's lifting
            (lifting ?h ?c) ; Hoist is now lifting the crate
        )
    )