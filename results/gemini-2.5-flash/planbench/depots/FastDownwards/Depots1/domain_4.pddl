(define (domain depots1)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        locatable_item ; Supertype for anything that can be located at a 'place'
        surface - locatable_item ; Surfaces (pallets, crates) are also locatable items

        depot distributor - place
        pallet crate - surface
        truck hoist - locatable_item
    )
    (:predicates
        (at ?obj - locatable_item ?p - place)
        (hoist_available ?h - hoist)
        (hoist_lifting ?h - hoist ?c - crate)
        (clear ?s - surface) ; True if nothing is stacked on ?s
        (on ?c - crate ?s - surface) ; ?c is directly on top of ?s
        (in_truck ?c - crate ?t - truck) ; ?c is inside ?t
    )

    (:action drive_truck
        :parameters (?t - truck ?p_from - place ?p_to - place)
        :precondition (and (at ?t ?p_from)
                           (not (= ?p_from ?p_to)))
        :effect (and (not (at ?t ?p_from))
                     (at ?t ?p_to))
    )

    (:action lift_crate_from_surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and (at ?h ?p)
                           (at ?c ?p)
                           (hoist_available ?h)
                           (clear ?c) ; Crate must have nothing on it to be lifted
                           (on ?c ?s) ; Crate must be on a surface
                           (at ?s ?p) ; Surface must be at the same place
                      )
        :effect (and (not (at ?c ?p)) ; Crate is no longer at the place in a fixed position
                     (hoist_lifting ?h ?c)
                     (not (hoist_available ?h))
                     (clear ?s) ; The surface ?s now has nothing on it
                     (not (on ?c ?s)) ; Crate is no longer on the surface
                )
    )

    (:action drop_crate_to_surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and (at ?h ?p)
                           (at ?s ?p)
                           (clear ?s) ; The target surface must be clear to receive a crate
                           (hoist_lifting ?h ?c)
                      )
        :effect (and (hoist_available ?h)
                     (not (hoist_lifting ?h ?c))
                     (at ?c ?p) ; Crate is now at the place, fixed on surface
                     (not (clear ?s)) ; The target surface is no longer clear
                     (clear ?c) ; Crate itself is clear (nothing on it)
                     (on ?c ?s)
                )
    )

    (:action load_crate_into_truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and (at ?h ?p)
                           (at ?t ?p)
                           (hoist_lifting ?h ?c)
                      )
        :effect (and (in_truck ?c ?t)
                     (hoist_available ?h)
                     (not (hoist_lifting ?h ?c))
                )
    )

    (:action unload_crate_from_truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and (at ?h ?p)
                           (at ?t ?p)
                           (hoist_available ?h) ; Hoist must be available to pick up from truck
                           (in_truck ?c ?t)
                      )
        :effect (and (not (in_truck ?c ?t))
                     (not (hoist_available ?h))
                     (hoist_lifting ?h ?c)
                )
    )
)