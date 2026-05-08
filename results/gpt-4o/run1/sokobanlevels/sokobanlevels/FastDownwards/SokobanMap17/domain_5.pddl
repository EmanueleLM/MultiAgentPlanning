(define (domain sokoban)
    (:requirements :strips :typing :negative-preconditions)
    (:types position)
    (:predicates
        (player_at ?pos - position)
        (box_at ?pos - position)
        (goal_at ?pos - position)
        (wall_at ?pos - position)
        (adjacent ?pos1 ?pos2 - position)
    )

    (:action move_up
        :parameters (?pos1 ?pos2 - position)
        :precondition (and
            (player_at ?pos1)
            (adjacent ?pos1 ?pos2)
            (not (wall_at ?pos2))
            (not (box_at ?pos2))
        )
        :effect (and
            (not (player_at ?pos1))
            (player_at ?pos2)
        )
    )

    (:action move_down
        :parameters (?pos1 ?pos2 - position)
        :precondition (and
            (player_at ?pos1)
            (adjacent ?pos1 ?pos2)
            (not (wall_at ?pos2))
            (not (box_at ?pos2))
        )
        :effect (and
            (not (player_at ?pos1))
            (player_at ?pos2)
        )
    )

    (:action move_left
        :parameters (?pos1 ?pos2 - position)
        :precondition (and
            (player_at ?pos1)
            (adjacent ?pos1 ?pos2)
            (not (wall_at ?pos2))
            (not (box_at ?pos2))
        )
        :effect (and
            (not (player_at ?pos1))
            (player_at ?pos2)
        )
    )

    (:action move_right
        :parameters (?pos1 ?pos2 - position)
        :precondition (and
            (player_at ?pos1)
            (adjacent ?pos1 ?pos2)
            (not (wall_at ?pos2))
            (not (box_at ?pos2))
        )
        :effect (and
            (not (player_at ?pos1))
            (player_at ?pos2)
        )
    )

    (:action push_up
        :parameters (?pos1 ?pos2 ?pos3 - position)
        :precondition (and
            (player_at ?pos1)
            (box_at ?pos2)
            (adjacent ?pos1 ?pos2)
            (adjacent ?pos2 ?pos3)
            (not (wall_at ?pos3))
            (not (box_at ?pos3))
        )
        :effect (and
            (not (player_at ?pos1))
            (player_at ?pos2)
            (not (box_at ?pos2))
            (box_at ?pos3)
        )
    )

    (:action push_down
        :parameters (?pos1 ?pos2 ?pos3 - position)
        :precondition (and
            (player_at ?pos1)
            (box_at ?pos2)
            (adjacent ?pos1 ?pos2)
            (adjacent ?pos2 ?pos3)
            (not (wall_at ?pos3))
            (not (box_at ?pos3))
        )
        :effect (and
            (not (player_at ?pos1))
            (player_at ?pos2)
            (not (box_at ?pos2))
            (box_at ?pos3)
        )
    )

    (:action push_left
        :parameters (?pos1 ?pos2 ?pos3 - position)
        :precondition (and
            (player_at ?pos1)
            (box_at ?pos2)
            (adjacent ?pos1 ?pos2)
            (adjacent ?pos2 ?pos3)
            (not (wall_at ?pos3))
            (not (box_at ?pos3))
        )
        :effect (and
            (not (player_at ?pos1))
            (player_at ?pos2)
            (not (box_at ?pos2))
            (box_at ?pos3)
        )
    )

    (:action push_right
        :parameters (?pos1 ?pos2 ?pos3 - position)
        :precondition (and
            (player_at ?pos1)
            (box_at ?pos2)
            (adjacent ?pos1 ?pos2)
            (adjacent ?pos2 ?pos3)
            (not (wall_at ?pos3))
            (not (box_at ?pos3))
        )
        :effect (and
            (not (player_at ?pos1))
            (player_at ?pos2)
            (not (box_at ?pos2))
            (box_at ?pos3)
        )
    )
)