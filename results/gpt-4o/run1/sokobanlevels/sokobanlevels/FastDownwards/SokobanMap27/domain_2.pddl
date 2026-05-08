(define (domain sokoban)
    (:requirements :strips :typing)

    (:types 
        movable_entity pos
    )

    (:predicates 
        (at ?entity - movable_entity ?position - pos)
        (adjacent ?p1 ?p2 - pos)
        (clear ?p - pos)
    )

    (:action move_up
        :parameters (?from ?to - pos)
        :precondition (and 
            (at player ?from)
            (adjacent ?from ?to)
            (clear ?to)
        )
        :effect (and 
            (not (at player ?from))
            (at player ?to)
        )
    )

    (:action move_down
        :parameters (?from ?to - pos)
        :precondition (and 
            (at player ?from)
            (adjacent ?from ?to)
            (clear ?to)
        )
        :effect (and 
            (not (at player ?from))
            (at player ?to)
        )
    )

    (:action move_left
        :parameters (?from ?to - pos)
        :precondition (and 
            (at player ?from)
            (adjacent ?from ?to)
            (clear ?to)
        )
        :effect (and 
            (not (at player ?from))
            (at player ?to)
        )
    )

    (:action move_right
        :parameters (?from ?to - pos)
        :precondition (and 
            (at player ?from)
            (adjacent ?from ?to)
            (clear ?to)
        )
        :effect (and 
            (not (at player ?from))
            (at player ?to)
        )
    )

    (:action push_box
        :parameters (?player_from ?player_to ?box_from ?box_to - pos)
        :precondition (and 
            (at player ?player_from)
            (at box ?box_from)
            (adjacent ?player_from ?player_to)
            (adjacent ?box_from ?box_to)
            (clear ?box_to)
            (= ?player_to ?box_from)
        )
        :effect (and 
            (not (at player ?player_from))
            (not (at box ?box_from))
            (at player ?player_to)
            (at box ?box_to)
        )
    )
)