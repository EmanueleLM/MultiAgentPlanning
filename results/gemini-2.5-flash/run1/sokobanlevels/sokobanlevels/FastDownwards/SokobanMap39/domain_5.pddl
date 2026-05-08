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
        (is_free ?l - location) ; Added predicate to explicitly denote a free space
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
            (is_free ?to) ; Uses the new is_free predicate
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
            (not (is_free ?to))
            (is_free ?from)
        )
    )

    (:action move_player_right
        :parameters (?from - location ?to - location)
        :precondition (and
            (at_player ?from)
            (connected_right ?from ?to)
            (is_free ?to) ; Uses the new is_free predicate
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
            (not (is_free ?to))
            (is_free ?from)
        )
    )

    (:action move_player_up
        :parameters (?from - location ?to - location)
        :precondition (and
            (at_player ?from)
            (connected_up ?from ?to)
            (is_free ?to) ; Uses the new is_free predicate
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
            (not (is_free ?to))
            (is_free ?from)
        )
    )

    (:action move_player_down
        :parameters (?from - location ?to - location)
        :precondition (and
            (at_player ?from)
            (connected_down ?from ?to)
            (is_free ?to) ; Uses the new is_free predicate
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
            (not (is_free ?to))
            (is_free ?from)
        )
    )

    (:action push_box_left
        :parameters (?player_loc - location ?box_loc - location ?box_target_loc - location)
        :precondition (and
            (at_player ?player_loc)
            (at_box ?box_loc)
            (connected_right ?player_loc ?box_loc) ; Player is to the right of the box
            (connected_left ?box_loc ?box_target_loc) ; Box moves left
            (is_free ?box_target_loc) ; Uses the new is_free predicate for the box's target
        )
        :effect (and
            (not (at_player ?player_loc))
            (at_player ?box_loc) ; Player moves to box's old position
            (not (at_box ?box_loc))
            (at_box ?box_target_loc)
            (is_free ?player_loc) ; Player's old location becomes free
            (not (is_free ?box_target_loc)) ; Box's new location is no longer free
            ; Note: ?box_loc remains not free as the player moves into it
        )
    )

    (:action push_box_right
        :parameters (?player_loc - location ?box_loc - location ?box_target_loc - location)
        :precondition (and
            (at_player ?player_loc)
            (at_box ?box_loc)
            (connected_left ?player_loc ?box_loc) ; Player is to the left of the box
            (connected_right ?box_loc ?box_target_loc) ; Box moves right
            (is_free ?box_target_loc) ; Uses the new is_free predicate for the box's target
        )
        :effect (and
            (not (at_player ?player_loc))
            (at_player ?box_loc)
            (not (at_box ?box_loc))
            (at_box ?box_target_loc)
            (is_free ?player_loc) ; Player's old location becomes free
            (not (is_free ?box_target_loc)) ; Box's new location is no longer free
            ; Note: ?box_loc remains not free as the player moves into it
        )
    )

    (:action push_box_up
        :parameters (?player_loc - location ?box_loc - location ?box_target_loc - location)
        :precondition (and
            (at_player ?player_loc)
            (at_box ?box_loc)
            (connected_down ?player_loc ?box_loc) ; Player is below the box
            (connected_up ?box_loc ?box_target_loc) ; Box moves up
            (is_free ?box_target_loc) ; Uses the new is_free predicate for the box's target
        )
        :effect (and
            (not (at_player ?player_loc))
            (at_player ?box_loc)
            (not (at_box ?box_loc))
            (at_box ?box_target_loc)
            (is_free ?player_loc) ; Player's old location becomes free
            (not (is_free ?box_target_loc)) ; Box's new location is no longer free
            ; Note: ?box_loc remains not free as the player moves into it
        )
    )

    (:action push_box_down
        :parameters (?player_loc - location ?box_loc - location ?box_target_loc - location)
        :precondition (and
            (at_player ?player_loc)
            (at_box ?box_loc)
            (connected_up ?player_loc ?box_loc) ; Player is above the box
            (connected_down ?box_loc ?box_target_loc) ; Box moves down
            (is_free ?box_target_loc) ; Uses the new is_free predicate for the box's target
        )
        :effect (and
            (not (at_player ?player_loc))
            (at_player ?box_loc)
            (not (at_box ?box_loc))
            (at_box ?box_target_loc)
            (is_free ?player_loc) ; Player's old location becomes free
            (not (is_free ?box_target_loc)) ; Box's new location is no longer free
            ; Note: ?box_loc remains not free as the player moves into it
        )
    )
)