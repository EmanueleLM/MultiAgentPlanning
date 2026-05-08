(define (domain sokoban)
    (:requirements :strips :typing :negative-preconditions)
    (:types position)
    (:predicates 
        (player_at ?p - position)
        (box_at ?p - position)
        (goal_at ?p - position)
        (wall_at ?p - position)
        (adjacent ?p1 ?p2 - position)
    )
    
    (:action move
        :parameters (?from ?to - position)
        :precondition (and (player_at ?from) (adjacent ?from ?to) (not (wall_at ?to)) (not (box_at ?to)))
        :effect (and (not (player_at ?from)) (player_at ?to))
    )

    (:action push
        :parameters (?player ?box ?to - position)
        :precondition (and 
            (player_at ?player)
            (box_at ?box)
            (adjacent ?player ?box)
            (adjacent ?box ?to)
            (not (wall_at ?to))
            (not (box_at ?to))
        )
        :effect (and
            (not (player_at ?player))
            (player_at ?box)
            (not (box_at ?box))
            (box_at ?to)
        )
    )
)