(define (domain sokobanmap20)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
        agent
        box
    )
    (:predicates
        (at_player ?l - location)
        (at_box ?b - box ?l - location)
        (is_goal ?l - location)
        (wall ?l - location)
        (north ?l1 ?l2 - location)
        (south ?l1 ?l2 - location)
    )

    (:action move_up
        :parameters (?from - location ?to - location)
        :precondition (and (at_player ?from)
                           (north ?from ?to)
                           (not (wall ?to))
                           (not (at_box box1 ?to)))
        :effect (and (not (at_player ?from))
                     (at_player ?to))
    )

    (:action move_down
        :parameters (?from - location ?to - location)
        :precondition (and (at_player ?from)
                           (south ?from ?to)
                           (not (wall ?to))
                           (not (at_box box1 ?to)))
        :effect (and (not (at_player ?from))
                     (at_player ?to))
    )

    (:action push_up
        :parameters (?p_from - location ?b_from - location ?b_to - location)
        :precondition (and (at_player ?p_from)
                           (at_box box1 ?b_from)
                           (north ?p_from ?b_from) ; player is immediately south of the box
                           (north ?b_from ?b_to)   ; box moves north
                           (not (wall ?b_to)))
        :effect (and (not (at_player ?p_from))
                     (at_player ?b_from) ; player moves to box's old spot
                     (not (at_box box1 ?b_from))
                     (at_box box1 ?b_to))
    )

    (:action push_down
        :parameters (?p_from - location ?b_from - location ?b_to - location)
        :precondition (and (at_player ?p_from)
                           (at_box box1 ?b_from)
                           (south ?p_from ?b_from) ; player is immediately north of the box
                           (south ?b_from ?b_to)   ; box moves south
                           (not (wall ?b_to)))
        :effect (and (not (at_player ?p_from))
                     (at_player ?b_from) ; player moves to box's old spot
                     (not (at_box box1 ?b_from))
                     (at_box box1 ?b_to))
    )
)