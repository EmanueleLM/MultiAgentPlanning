(define (domain sokoban)
    (:requirements :strips :typing :negative-preconditions)
    (:types player box position)
    (:predicates
        (at ?entity - (either player box) ?pos - position)
        (is_goal ?pos - position)
        (is_wall ?pos - position)
        (adjacent ?pos1 ?pos2 - position)
    )
    
    (:action move_left
        :parameters (?entity - player ?from ?to - position)
        :precondition (and
            (at ?entity ?from)
            (adjacent ?from ?to)
            (not (is_wall ?to))
            (not (at box_1 ?to))
        )
        :effect (and
            (not (at ?entity ?from))
            (at ?entity ?to)
        )
    )

    (:action move_right
        :parameters (?entity - player ?from ?to - position)
        :precondition (and
            (at ?entity ?from)
            (adjacent ?from ?to)
            (not (is_wall ?to))
            (not (at box_1 ?to))
        )
        :effect (and
            (not (at ?entity ?from))
            (at ?entity ?to)
        )
    )

    (:action move_up
        :parameters (?entity - player ?from ?to - position)
        :precondition (and
            (at ?entity ?from)
            (adjacent ?from ?to)
            (not (is_wall ?to))
            (not (at box_1 ?to))
        )
        :effect (and
            (not (at ?entity ?from))
            (at ?entity ?to)
        )
    )

    (:action move_down
        :parameters (?entity - player ?from ?to - position)
        :precondition (and
            (at ?entity ?from)
            (adjacent ?from ?to)
            (not (is_wall ?to))
            (not (at box_1 ?to))
        )
        :effect (and
            (not (at ?entity ?from))
            (at ?entity ?to)
        )
    )

    (:action push_left
        :parameters (?player - player ?box - box ?p1 ?p2 ?p3 - position)
        :precondition (and
            (at ?player ?p1)
            (at ?box ?p2)
            (adjacent ?p1 ?p2)
            (adjacent ?p2 ?p3)
            (not (is_wall ?p3))
            (not (at box_1 ?p3))
        )
        :effect (and
            (not (at ?player ?p1))
            (at ?player ?p2)
            (not (at ?box ?p2))
            (at ?box ?p3)
        )
    )

    (:action push_right
        :parameters (?player - player ?box - box ?p1 ?p2 ?p3 - position)
        :precondition (and
            (at ?player ?p1)
            (at ?box ?p2)
            (adjacent ?p1 ?p2)
            (adjacent ?p2 ?p3)
            (not (is_wall ?p3))
            (not (at box_1 ?p3))
        )
        :effect (and
            (not (at ?player ?p1))
            (at ?player ?p2)
            (not (at ?box ?p2))
            (at ?box ?p3)
        )
    )

    (:action push_up
        :parameters (?player - player ?box - box ?p1 ?p2 ?p3 - position)
        :precondition (and
            (at ?player ?p1)
            (at ?box ?p2)
            (adjacent ?p1 ?p2)
            (adjacent ?p2 ?p3)
            (not (is_wall ?p3))
            (not (at box_1 ?p3))
        )
        :effect (and
            (not (at ?player ?p1))
            (at ?player ?p2)
            (not (at ?box ?p2))
            (at ?box ?p3)
        )
    )

    (:action push_down
        :parameters (?player - player ?box - box ?p1 ?p2 ?p3 - position)
        :precondition (and
            (at ?player ?p1)
            (at ?box ?p2)
            (adjacent ?p1 ?p2)
            (adjacent ?p2 ?p3)
            (not (is_wall ?p3))
            (not (at box_1 ?p3))
        )
        :effect (and
            (not (at ?player ?p1))
            (at ?player ?p2)
            (not (at ?box ?p2))
            (at ?box ?p3)
        )
    )
)