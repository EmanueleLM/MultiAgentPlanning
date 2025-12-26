(define (domain depots4)
    (:requirements :strips :typing :negative-preconditions :action-costs :equality)
    (:types
        locatable - object
        place - object
        depot distributor - place
        surface hoist truck - locatable
        pallet crate - surface
    )
    
    (:predicates
        (at ?x - locatable ?l - place)
        (on ?c - crate ?s - surface)
        (in ?c - crate ?t - truck)
        (lifting ?h - hoist ?c - crate)
        (clear ?s - surface)
        (available ?h - hoist)
    )
    
    (:functions
        (total-cost) - number
    )

    ;; 1. Drive: Move truck between two distinct places
    (:action Drive
        :parameters (?t - truck ?l1 - place ?l2 - place)
        :precondition (and
            (at ?t ?l1)
            (not (= ?l1 ?l2))
        )
        :effect (and
            (at ?t ?l2)
            (not (at ?t ?l1))
            (increase (total-cost) 1)
        )
    )

    ;; 2. Lift: Move crate from a stack/surface onto a hoist
    (:action Lift
        :parameters (?h - hoist ?c - crate ?s - surface ?l - place)
        :precondition (and
            (available ?h)
            (at ?h ?l)
            (at ?c ?l)
            (at ?s ?l)
            (on ?c ?s)
            (clear ?c)
        )
        :effect (and
            (lifting ?h ?c)
            (not (on ?c ?s))
            (clear ?s)
            (not (clear ?c))
            (not (available ?h))
            (increase (total-cost) 1)
        )
    )
    
    ;; 3. Drop: Move crate from a hoist onto a clear surface
    (:action Drop
        :parameters (?h - hoist ?c - crate ?s - surface ?l - place)
        :precondition (and
            (lifting ?h ?c)
            (at ?h ?l)
            (at ?s ?l)
            (at ?c ?l)
            (clear ?s)
        )
        :effect (and
            (on ?c ?s)
            (clear ?c)
            (not (clear ?s))
            (available ?h)
            (not (lifting ?h ?c))
            (increase (total-cost) 1)
        )
    )
    
    ;; 4. Load: Move crate from hoist into a truck
    (:action Load
        :parameters (?h - hoist ?c - crate ?t - truck ?l - place)
        :precondition (and
            (lifting ?h ?c)
            (at ?h ?l)
            (at ?t ?l)
            (at ?c ?l)
        )
        :effect (and
            (in ?c ?t)
            (not (at ?c ?l))
            (available ?h)
            (not (lifting ?h ?c))
            (increase (total-cost) 1)
        )
    )

    ;; 5. Unload: Move crate from a truck onto a hoist
    (:action Unload
        :parameters (?h - hoist ?c - crate ?t - truck ?l - place)
        :precondition (and
            (available ?h)
            (at ?h ?l)
            (at ?t ?l)
            (in ?c ?t)
        )
        :effect (and
            (lifting ?h ?c)
            (at ?c ?l)
            (not (in ?c ?t))
            (not (available ?h))
            (increase (total-cost) 1)
        )
    )
)