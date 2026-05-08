(define (domain sokoban)
    (:requirements :strips :typing :negative-preconditions)
    (:types cell)
    (:predicates 
        (player_at ?c - cell)
        (box_at ?c - cell)
        (goal_at ?c - cell)
        (wall_at ?c - cell)
        (adjacent ?c1 ?c2 - cell)
    )
    
    (:action move
        :parameters (?from ?to - cell)
        :precondition (and (player_at ?from) (adjacent ?from ?to) (not (wall_at ?to)) (not (box_at ?to)))
        :effect (and (not (player_at ?from)) (player_at ?to))
    )

    (:action push
        :parameters (?player ?box ?to - cell)
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