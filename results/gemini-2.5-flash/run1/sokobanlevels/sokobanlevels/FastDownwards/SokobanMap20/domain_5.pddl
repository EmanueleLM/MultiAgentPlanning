(define (domain sokobanmap20)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
        agent
        box
    )
    (:constants
        box1 - box
    )
    (:predicates
        (at_player ?a - agent ?l - location)
        (at_box ?b - box ?l - location)
        (is_goal ?l - location)
        (wall ?l - location)
        (north ?l1 ?l2 - location)
        (south ?l1 ?l2 - location)
        (east ?l1 ?l2 - location)
        (west ?l1 ?l2 - location)
    )

    (:action move_up
        :parameters (?p - agent ?from - location ?to - location)
        :precondition (and (at_player ?p ?from)
                           (north ?from ?to)
                           (not (wall ?to))
                           (not (at_box box1 ?to)))
        :effect (and (not (at_player ?p ?from))
                     (at_player ?p ?to))
    )

    (:action move_down
        :parameters (?p - agent ?from - location ?to - location)
        :precondition (and (at_player ?p ?from)
                           (south ?from ?to)
                           (not (wall ?to))
                           (not (at_box box1 ?to)))
        :effect (and (not (at_player ?p ?from))
                     (at_player ?p ?to))
    )

    (:action move_left
        :parameters (?p - agent ?from - location ?to - location)
        :precondition (and (at_player ?p ?from)
                           (west ?from ?to)
                           (not (wall ?to))
                           (not (at_box box1 ?to)))
        :effect (and (not (at_player ?p ?from))
                     (at_player ?p ?to))
    )

    (:action move_right
        :parameters (?p - agent ?from - location ?to - location)
        :precondition (and (at_player ?p ?from)
                           (east ?from ?to)
                           (not (wall ?to))
                           (not (at_box box1 ?to)))
        :effect (and (not (at_player ?p ?from))
                     (at_player ?p ?to))
    )

    (:action push_up
        :parameters (?p - agent ?p_from - location ?b_from - location ?b_to - location)
        :precondition (and (at_player ?p ?p_from)
                           (at_box box1 ?b_from)
                           (north ?p_from ?b_from)
                           (north ?b_from ?b_to)
                           (not (wall ?b_to))
                           (not (at_player ?p ?b_to))
                           (not (at_box box1 ?b_to))) ;; Added precondition
        :effect (and (not (at_player ?p ?p_from))
                     (at_player ?p ?b_from)
                     (not (at_box box1 ?b_from))
                     (at_box box1 ?b_to))
    )

    (:action push_down
        :parameters (?p - agent ?p_from - location ?b_from - location ?b_to - location)
        :precondition (and (at_player ?p ?p_from)
                           (at_box box1 ?b_from)
                           (south ?p_from ?b_from)
                           (south ?b_from ?b_to)
                           (not (wall ?b_to))
                           (not (at_player ?p ?b_to))
                           (not (at_box box1 ?b_to))) ;; Added precondition
        :effect (and (not (at_player ?p ?p_from))
                     (at_player ?p ?b_from)
                     (not (at_box box1 ?b_from))
                     (at_box box1 ?b_to))
    )

    (:action push_left
        :parameters (?p - agent ?p_from - location ?b_from - location ?b_to - location)
        :precondition (and (at_player ?p ?p_from)
                           (at_box box1 ?b_from)
                           (west ?p_from ?b_from)
                           (west ?b_from ?b_to)
                           (not (wall ?b_to))
                           (not (at_player ?p ?b_to))
                           (not (at_box box1 ?b_to))) ;; Added precondition
        :effect (and (not (at_player ?p ?p_from))
                     (at_player ?p ?b_from)
                     (not (at_box box1 ?b_from))
                     (at_box box1 ?b_to))
    )

    (:action push_right
        :parameters (?p - agent ?p_from - location ?b_from - location ?b_to - location)
        :precondition (and (at_player ?p ?p_from)
                           (at_box box1 ?b_from)
                           (east ?p_from ?b_from)
                           (east ?b_from ?b_to)
                           (not (wall ?b_to))
                           (not (at_player ?p ?b_to))
                           (not (at_box box1 ?b_to))) ;; Added precondition
        :effect (and (not (at_player ?p ?p_from))
                     (at_player ?p ?b_from)
                     (not (at_box box1 ?b_from))
                     (at_box box1 ?b_to))
    )
)