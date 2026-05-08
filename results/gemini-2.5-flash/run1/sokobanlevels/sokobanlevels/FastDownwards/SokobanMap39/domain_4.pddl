(define (domain sokobanmap39)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
    )
    (:predicates
        (at_player ?l - location)
        (at_box ?l - location)
        (is_goal ?l - location)
        (is_wall ?l - location)
        (connected_left ?from ?to - location)
        (connected_right ?from ?to - location)
        (connected_up ?from ?to - location)
        (connected_down ?from ?to - location)
    )

    (:action move_player_left
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

    (:action move_player_right
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

    (:action move_player_up
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

    (:action move_player_down
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

    (:action push_box_left
        :parameters (?player_loc - location ?box_loc - location ?box_target_loc - location)
        :precondition (and
            (at_player ?player_loc)
            (at_box ?box_loc)
            (connected_right ?player_loc ?box_loc) ; Player is to the right of the box
            (connected_left ?box_loc ?box_target_loc) ; Box moves left
            (not (is_wall ?box_target_loc))
            (not (at_box ?box_target_loc)) ; Box target must be empty
        )
        :effect (and
            (not (at_player ?player_loc))
            (at_player ?box_loc) ; Player moves to box's old position
            (not (at_box ?box_loc))
            (at_box ?box_target_loc)
        )
    )

    (:action push_box_right
        :parameters (?player_loc - location ?box_loc - location ?box_target_loc - location)
        :precondition (and
            (at_player ?player_loc)
            (at_box ?box_loc)
            (connected_left ?player_loc ?box_loc) ; Player is to the left of the box
            (connected_right ?box_loc ?box_target_loc) ; Box moves right
            (not (is_wall ?box_target_loc))
            (not (at_box ?box_target_loc))
        )
        :effect (and
            (not (at_player ?player_loc))
            (at_player ?box_loc)
            (not (at_box ?box_loc))
            (at_box ?box_target_loc)
        )
    )

    (:action push_box_up
        :parameters (?player_loc - location ?box_loc - location ?box_target_loc - location)
        :precondition (and
            (at_player ?player_loc)
            (at_box ?box_loc)
            (connected_down ?player_loc ?box_loc) ; Player is below the box
            (connected_up ?box_loc ?box_target_loc) ; Box moves up
            (not (is_wall ?box_target_loc))
            (not (at_box ?box_target_loc))
        )
        :effect (and
            (not (at_player ?player_loc))
            (at_player ?box_loc)
            (not (at_box ?box_loc))
            (at_box ?box_target_loc)
        )
    )

    (:action push_box_down
        :parameters (?player_loc - location ?box_loc - location ?box_target_loc - location)
        :precondition (and
            (at_player ?player_loc)
            (at_box ?box_loc)
            (connected_up ?player_loc ?box_loc) ; Player is above the box
            (connected_down ?box_loc ?box_target_loc) ; Box moves down
            (not (is_wall ?box_target_loc))
            (not (at_box ?box_target_loc))
        )
        :effect (and
            (not (at_player ?player_loc))
            (at_player ?box_loc)
            (not (at_box ?box_loc))
            (at_box ?box_target_loc)
        )
    )
)