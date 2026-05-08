(define (domain sokoban)
    (:requirements :strips :typing)
    (:types cell)
    (:predicates 
        (player_at ?c - cell)
        (box_at ?c - cell)
        (goal_at ?c - cell)
        (wall_at ?c - cell)
        (adjacent ?c1 ?c2 - cell)
    )
    
    (:action move_left
        :parameters (?from ?to - cell)
        :precondition (and (player_at ?from) (adjacent ?from ?to) (not (wall_at ?to)))
        :effect (and (not (player_at ?from)) (player_at ?to))
    )

    (:action move_right
        :parameters (?from ?to - cell)
        :precondition (and (player_at ?from) (adjacent ?from ?to) (not (wall_at ?to)))
        :effect (and (not (player_at ?from)) (player_at ?to))
    )

    (:action move_up
        :parameters (?from ?to - cell)
        :precondition (and (player_at ?from) (adjacent ?from ?to) (not (wall_at ?to)))
        :effect (and (not (player_at ?from)) (player_at ?to))
    )

    (:action move_down
        :parameters (?from ?to - cell)
        :precondition (and (player_at ?from) (adjacent ?from ?to) (not (wall_at ?to)))
        :effect (and (not (player_at ?from)) (player_at ?to))
    )

    (:action push_left
        :parameters (?player ?from ?to ?beyond - cell)
        :precondition (and 
            (player_at ?player)
            (box_at ?from)
            (adjacent ?player ?from)
            (adjacent ?from ?to)
            (not (wall_at ?to))
            (not (box_at ?to))
        )
        :effect (and
            (not (player_at ?player))
            (player_at ?from)
            (not (box_at ?from))
            (box_at ?to)
        )
    )

    (:action push_right
        :parameters (?player ?from ?to ?beyond - cell)
        :precondition (and
            (player_at ?player)
            (box_at ?from)
            (adjacent ?player ?from)
            (adjacent ?from ?to)
            (not (wall_at ?to))
            (not (box_at ?to))
        )
        :effect (and
            (not (player_at ?player))
            (player_at ?from)
            (not (box_at ?from))
            (box_at ?to)
        )
    )

    (:action push_up
        :parameters (?player ?from ?to ?beyond - cell)
        :precondition (and
            (player_at ?player)
            (box_at ?from)
            (adjacent ?player ?from)
            (adjacent ?from ?to)
            (not (wall_at ?to))
            (not (box_at ?to))
        )
        :effect (and
            (not (player_at ?player))
            (player_at ?from)
            (not (box_at ?from))
            (box_at ?to)
        )
    )

    (:action push_down
        :parameters (?player ?from ?to ?beyond - cell)
        :precondition (and
            (player_at ?player)
            (box_at ?from)
            (adjacent ?player ?from)
            (adjacent ?from ?to)
            (not (wall_at ?to))
            (not (box_at ?to))
        )
        :effect (and
            (not (player_at ?player))
            (player_at ?from)
            (not (box_at ?from))
            (box_at ?to)
        )
    )
)