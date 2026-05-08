(define (domain sokoban)
    (:requirements :strips :typing)

    (:types 
        player box pos
    )

    (:predicates 
        (at_player ?position - pos)
        (at_box ?position - pos)
        (adjacent ?p1 ?p2 - pos)
        (clear ?p - pos)
    )

    (:action move_up
        :parameters (?from ?to - pos)
        :precondition (and 
            (at_player ?from)
            (adjacent ?from ?to)
            (clear ?to)
        )
        :effect (and 
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action move_down
        :parameters (?from ?to - pos)
        :precondition (and 
            (at_player ?from)
            (adjacent ?from ?to)
            (clear ?to)
        )
        :effect (and 
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action move_left
        :parameters (?from ?to - pos)
        :precondition (and 
            (at_player ?from)
            (adjacent ?from ?to)
            (clear ?to)
        )
        :effect (and 
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action move_right
        :parameters (?from ?to - pos)
        :precondition (and 
            (at_player ?from)
            (adjacent ?from ?to)
            (clear ?to)
        )
        :effect (and 
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action push
        :parameters (?player_from ?player_to ?box_from ?box_to - pos)
        :precondition (and 
            (at_player ?player_from)
            (at_box ?box_from)
            (adjacent ?player_from ?player_to)
            (adjacent ?box_from ?box_to)
            (clear ?box_to)
            (= ?player_to ?box_from)
        )
        :effect (and 
            (not (at_player ?player_from))
            (not (at_box ?box_from))
            (at_player ?player_to)
            (at_box ?box_to)
        )
    )
)