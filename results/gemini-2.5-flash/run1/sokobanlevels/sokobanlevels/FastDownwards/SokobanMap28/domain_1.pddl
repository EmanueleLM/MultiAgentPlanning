(define (domain sokoban_map28)
    (:requirements :strips :typing :negative-preconditions)
    (:types player box location)
    (:predicates
        (at_player ?l - location)
        (at_box ?l - location)
        (is_goal ?l - location)
        (is_wall ?l - location)
        (connected_left ?l1 - location ?l2 - location)
        (connected_right ?l1 - location ?l2 - location)
        (connected_up ?l1 - location ?l2 - location)
        (connected_down ?l1 - location ?l2 - location)
    )

    (:action move_left
        :parameters (?from - location ?to - location)
        :precondition (and
            (at_player ?from)
            (connected_left ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action move_right
        :parameters (?from - location ?to - location)
        :precondition (and
            (at_player ?from)
            (connected_right ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action move_up
        :parameters (?from - location ?to - location)
        :precondition (and
            (at_player ?from)
            (connected_up ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action move_down
        :parameters (?from - location ?to - location)
        :precondition (and
            (at_player ?from)
            (connected_down ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
        )
    )

    (:action push_left
        :parameters (?player_pos - location ?box_pos - location ?target_pos - location)
        :precondition (and
            (at_player ?player_pos)
            (at_box ?box_pos)
            (connected_left ?box_pos ?target_pos)
            (connected_right ?box_pos ?player_pos)
            (not (is_wall ?target_pos))
            (not (at_box ?target_pos))
        )
        :effect (and
            (not (at_player ?player_pos))
            (at_player ?box_pos)
            (not (at_box ?box_pos))
            (at_box ?target_pos)
        )
    )

    (:action push_right
        :parameters (?player_pos - location ?box_pos - location ?target_pos - location)
        :precondition (and
            (at_player ?player_pos)
            (at_box ?box_pos)
            (connected_right ?box_pos ?target_pos)
            (connected_left ?box_pos ?player_pos)
            (not (is_wall ?target_pos))
            (not (at_box ?target_pos))
        )
        :effect (and
            (not (at_player ?player_pos))
            (at_player ?box_pos)
            (not (at_box ?box_pos))
            (at_box ?target_pos)
        )
    )

    (:action push_up
        :parameters (?player_pos - location ?box_pos - location ?target_pos - location)
        :precondition (and
            (at_player ?player_pos)
            (at_box ?box_pos)
            (connected_up ?box_pos ?target_pos)
            (connected_down ?box_pos ?player_pos)
            (not (is_wall ?target_pos))
            (not (at_box ?target_pos))
        )
        :effect (and
            (not (at_player ?player_pos))
            (at_player ?box_pos)
            (not (at_box ?box_pos))
            (at_box ?target_pos)
        )
    )

    (:action push_down
        :parameters (?player_pos - location ?box_pos - location ?target_pos - location)
        :precondition (and
            (at_player ?player_pos)
            (at_box ?box_pos)
            (connected_down ?box_pos ?target_pos)
            (connected_up ?box_pos ?player_pos)
            (not (is_wall ?target_pos))
            (not (at_box ?target_pos))
        )
        :effect (and
            (not (at_player ?player_pos))
            (at_player ?box_pos)
            (not (at_box ?box_pos))
            (at_box ?target_pos)
        )
    )
)