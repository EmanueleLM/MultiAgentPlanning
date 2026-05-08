(define (domain sokobanmap20)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
        agent
        box
    )
    (:constants
        box1 - box ; Declaring box1 as a domain constant
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

    ;; Player-only movement actions (L, R, U, D)
    (:action move_up
        :parameters (?p - agent ?from - location ?to - location)
        :precondition (and (at_player ?p ?from)
                           (north ?from ?to)
                           (not (wall ?to))
                           (not (at_box box1 ?to))) ; Target location cannot be occupied by box1
        :effect (and (not (at_player ?p ?from))
                     (at_player ?p ?to))
    )

    (:action move_down
        :parameters (?p - agent ?from - location ?to - location)
        :precondition (and (at_player ?p ?from)
                           (south ?from ?to)
                           (not (wall ?to))
                           (not (at_box box1 ?to))) ; Target location cannot be occupied by box1
        :effect (and (not (at_player ?p ?from))
                     (at_player ?p ?to))
    )

    (:action move_left
        :parameters (?p - agent ?from - location ?to - location)
        :precondition (and (at_player ?p ?from)
                           (west ?from ?to)
                           (not (wall ?to))
                           (not (at_box box1 ?to))) ; Target location cannot be occupied by box1
        :effect (and (not (at_player ?p ?from))
                     (at_player ?p ?to))
    )

    (:action move_right
        :parameters (?p - agent ?from - location ?to - location)
        :precondition (and (at_player ?p ?from)
                           (east ?from ?to)
                           (not (wall ?to))
                           (not (at_box box1 ?to))) ; Target location cannot be occupied by box1
        :effect (and (not (at_player ?p ?from))
                     (at_player ?p ?to))
    )

    ;; Push actions (L, R, U, D)
    (:action push_up
        :parameters (?p - agent ?p_from - location ?b_from - location ?b_to - location) ; Removed ?b - box, as box1 is a constant
        :precondition (and (at_player ?p ?p_from)
                           (at_box box1 ?b_from) ; Referencing box1 directly
                           (north ?p_from ?b_from) ; Player is immediately south of the box
                           (north ?b_from ?b_to)   ; Box moves north
                           (not (wall ?b_to))      ; Box cannot move into a wall
                           (not (at_player ?p ?b_to))) ; Target box location cannot be occupied by player
        :effect (and (not (at_player ?p ?p_from))
                     (at_player ?p ?b_from) ; Player moves to box's old spot
                     (not (at_box box1 ?b_from))
                     (at_box box1 ?b_to))
    )

    (:action push_down
        :parameters (?p - agent ?p_from - location ?b_from - location ?b_to - location) ; Removed ?b - box
        :precondition (and (at_player ?p ?p_from)
                           (at_box box1 ?b_from)
                           (south ?p_from ?b_from) ; Player is immediately north of the box
                           (south ?b_from ?b_to)   ; Box moves south
                           (not (wall ?b_to))
                           (not (at_player ?p ?b_to)))
        :effect (and (not (at_player ?p ?p_from))
                     (at_player ?p ?b_from)
                     (not (at_box box1 ?b_from))
                     (at_box box1 ?b_to))
    )

    (:action push_left
        :parameters (?p - agent ?p_from - location ?b_from - location ?b_to - location) ; Removed ?b - box
        :precondition (and (at_player ?p ?p_from)
                           (at_box box1 ?b_from)
                           (west ?p_from ?b_from) ; Player is immediately east of the box
                           (west ?b_from ?b_to)   ; Box moves west
                           (not (wall ?b_to))
                           (not (at_player ?p ?b_to)))
        :effect (and (not (at_player ?p ?p_from))
                     (at_player ?p ?b_from)
                     (not (at_box box1 ?b_from))
                     (at_box box1 ?b_to))
    )

    (:action push_right
        :parameters (?p - agent ?p_from - location ?b_from - location ?b_to - location) ; Removed ?b - box
        :precondition (and (at_player ?p ?p_from)
                           (at_box box1 ?b_from)
                           (east ?p_from ?b_from) ; Player is immediately west of the box
                           (east ?b_from ?b_to)   ; Box moves east
                           (not (wall ?b_to))
                           (not (at_player ?p ?b_to)))
        :effect (and (not (at_player ?p ?p_from))
                     (at_player ?p ?b_from)
                     (not (at_box box1 ?b_from))
                     (at_box box1 ?b_to))
    )
)