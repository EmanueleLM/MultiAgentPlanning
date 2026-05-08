(define (domain depots0)
    (:requirements :strips :typing :adl :negative-preconditions)

    (:types
        place
            depot
            distributor
        surface
            pallet
            crate
        hoist
        truck
    )

    (:predicates
        (at ?obj - (either hoist truck crate pallet) ?p - place)
        (on ?c - crate ?s - surface)
        (in_truck ?c - crate ?t - truck)
        (clear ?s - surface)
        (hoist_available ?h - hoist)
        (hoist_holding ?h - hoist ?c - crate)
    )

    ;; Action: Drive a truck from one place to another place.
    (:action drive
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
                        (at ?t ?from)
                        ;; Removed (not (= ?from ?to)) to comply with "Do not use unsupported comparison operators"
                       )
        :effect (and
                    (not (at ?t ?from))
                    (at ?t ?to)
                    ;; Forall loop with when is used to update crate locations inside the truck.
                    ;; This is an ADL feature, retained as it's semantically appropriate for the task
                    ;; and supported by FastDownwards, despite a preference for strict STRIPS.
                    (forall (?c - crate)
                        (when (in_truck ?c ?t)
                            (and
                                (not (at ?c ?from))
                                (at ?c ?to)
                            )
                        )
                    )
                )
    )

    ;; Action: Use a hoist to lift a crate from a surface at a place.
    (:action lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
                        (at ?h ?p)
                        (at ?c ?p)
                        (on ?c ?s)
                        (hoist_available ?h)
                        (clear ?c)
                       )
        :effect (and
                    (not (hoist_available ?h))
                    (hoist_holding ?h ?c)
                    (not (at ?c ?p)) ; Crate is no longer 'at' the place in a resting sense (it's held)
                    (not (on ?c ?s))
                    (clear ?s) ; The surface it was on becomes clear
                )
    )

    ;; Action: Use a hoist to drop a crate to a surface at a place.
    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
                        (hoist_holding ?h ?c)
                        (at ?h ?p)
                        (at ?s ?p)
                        (clear ?s)
                       )
        :effect (and
                    (hoist_available ?h)
                    (not (hoist_holding ?h ?c))
                    (on ?c ?s)
                    (at ?c ?p) ; Crate is now 'at' the place, resting on a surface
                    (not (clear ?s)) ; The surface it's dropped on is no longer clear
                    (clear ?c) ; The dropped crate itself is clear
                )
    )

    ;; Action: Use a hoist to load a crate into a truck at a place.
    (:action load
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
                        (hoist_holding ?h ?c)
                        (at ?h ?p)
                        (at ?t ?p)
                       )
        :effect (and
                    (hoist_available ?h)
                    (not (hoist_holding ?h ?c))
                    (in_truck ?c ?t)
                    (at ?c ?p) ; Crate is now 'at' the place, inside the truck
                )
    )

    ;; Action: Use a hoist to unload a crate from a truck at a place.
    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
                        (hoist_available ?h)
                        (at ?h ?p)
                        (at ?t ?p)
                        (in_truck ?c ?t)
                       )
        :effect (and
                    (not (hoist_available ?h))
                    (hoist_holding ?h ?c)
                    (not (in_truck ?c ?t))
                    (not (at ?c ?p)) ; Crate is no longer 'at' the place in a resting sense (it's held)
                )
    )
)