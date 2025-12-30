(define (domain logistics-depots)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        locatable
        place
        depot distributor - place
        surface - locatable
        pallet crate - surface
        truck - locatable
        hoist - locatable
    )

    (:predicates
        (at ?o - locatable ?p - place)
        (on ?c - crate ?s - surface)
        (clear ?s - surface)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
        (in ?c - crate ?t - truck)
    )

    ;; 1. Drive a truck
    (:action drive-truck
        :parameters (?t - truck ?p1 - place ?p2 - place)
        :precondition (and
            (at ?t ?p1)
            (not (= ?p1 ?p2))
        )
        :effect (and
            (not (at ?t ?p1))
            (at ?t ?p2)
        )
    )

    ;; 2. Lift a crate from a surface
    (:action lift-crate-from-surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (available ?h)
            (clear ?c)
            (on ?c ?s)
        )
        :effect (and
            (not (at ?c ?p))
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s)
            (not (on ?c ?s))
        )
    )

    ;; 3. Drop a crate to a surface
    (:action drop-crate-to-surface
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s)
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p)
            (not (clear ?s))
            (clear ?c)
            (on ?c ?s)
        )
    )

    ;; 4. Load a crate into a truck (must be lifting first)
    (:action load-crate-to-truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c)
        )
        :effect (and
            (in ?c ?t)
            (available ?h)
            (not (lifting ?h ?c))
        )
    )

    ;; 5. Unload a crate from a truck
    (:action unload-crate-from-truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h)
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c)
        )
    )
)