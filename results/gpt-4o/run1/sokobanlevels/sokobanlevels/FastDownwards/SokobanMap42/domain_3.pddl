(define (domain sokoban)
    (:requirements :strips :typing :negative-preconditions)
    (:types entity position)
    (:predicates
        (at ?e - entity ?p - position)
        (goal ?p - position)
        (is_space ?p - position)
        (adjacent ?p1 ?p2 - position)
        (clear ?p - position)
        (box ?e - entity)
        (player ?e - entity)
    )

    (:action move
        :parameters (?player - entity ?from ?to - position)
        :precondition (and
            (at ?player ?from)
            (adjacent ?from ?to)
            (clear ?to)
        )
        :effect (and
            (not (at ?player ?from))
            (at ?player ?to)
        )
    )

    (:action push_box
        :parameters (?player - entity ?from ?box_pos ?to - position)
        :precondition (and
            (at ?player ?from)
            (at ?box - entity ?box_pos)
            (adjacent ?from ?box_pos)
            (adjacent ?box_pos ?to)
            (clear ?to)
        )
        :effect (and
            (not (at ?player ?from))
            (at ?player ?box_pos)
            (not (at ?box ?box_pos))
            (at ?box ?to)
            (clear ?from)
            (not (clear ?to))
        )
    )
)