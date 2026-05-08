(define (domain sokoban_map35_domain)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        player
        box
        location - object
    )
    (:predicates
        (at_player ?p - player ?loc - location)
        (at_box ?b - box ?loc - location)
        (is_goal ?loc - location)
        (is_wall ?loc - location)
        (adj_left ?from ?to - location)
        (adj_right ?from ?to - location)
        (adj_up ?from ?to - location)
        (adj_down ?from ?to - location)
    )

    ;; Player movement actions
    (:action move_player_left
        :parameters (?p - player ?b - box ?from ?to - location)
        :precondition (and
            (at_player ?p ?from)
            (adj_left ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?b ?to)) ;; Now references ?b, which is a parameter
        )
        :effect (and
            (not (at_player ?p ?from))
            (at_player ?p ?to)
        )
    )

    (:action move_player_right
        :parameters (?p - player ?b - box ?from ?to - location)
        :precondition (and
            (at_player ?p ?from)
            (adj_right ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?b ?to))
        )
        :effect (and
            (not (at_player ?p ?from))
            (at_player ?p ?to)
        )
    )

    (:action move_player_up
        :parameters (?p - player ?b - box ?from ?to - location)
        :precondition (and
            (at_player ?p ?from)
            (adj_up ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?b ?to))
        )
        :effect (and
            (not (at_player ?p ?from))
            (at_player ?p ?to)
        )
    )

    (:action move_player_down
        :parameters (?p - player ?b - box ?from ?to - location)
        :precondition (and
            (at_player ?p ?from)
            (adj_down ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?b ?to))
        )
        :effect (and
            (not (at_player ?p ?from))
            (at_player ?p ?to)
        )
    )

    ;; Push box actions
    (:action push_box_left
        :parameters (?p - player ?b - box ?player_loc ?box_loc ?target_loc - location)
        :precondition (and
            (at_player ?p ?player_loc)
            (at_box ?b ?box_loc)
            (adj_left ?player_loc ?box_loc) ; Player is right of the box, pushing it left
            (adj_left ?box_loc ?target_loc)
            (not (is_wall ?target_loc))
            (not (at_box ?b ?target_loc)) ; Target must be empty (of this box)
        )
        :effect (and
            (not (at_player ?p ?player_loc))
            (not (at_box ?b ?box_loc))
            (at_player ?p ?box_loc)
            (at_box ?b ?target_loc)
        )
    )

    (:action push_box_right
        :parameters (?p - player ?b - box ?player_loc ?box_loc ?target_loc - location)
        :precondition (and
            (at_player ?p ?player_loc)
            (at_box ?b ?box_loc)
            (adj_right ?player_loc ?box_loc) ; Player is left of the box, pushing it right
            (adj_right ?box_loc ?target_loc)
            (not (is_wall ?target_loc))
            (not (at_box ?b ?target_loc))
        )
        :effect (and
            (not (at_player ?p ?player_loc))
            (not (at_box ?b ?box_loc))
            (at_player ?p ?box_loc)
            (at_box ?b ?target_loc)
        )
    )

    (:action push_box_up
        :parameters (?p - player ?b - box ?player_loc ?box_loc ?target_loc - location)
        :precondition (and
            (at_player ?p ?player_loc)
            (at_box ?b ?box_loc)
            (adj_up ?player_loc ?box_loc) ; Player is below the box, pushing it up
            (adj_up ?box_loc ?target_loc)
            (not (is_wall ?target_loc))
            (not (at_box ?b ?target_loc))
        )
        :effect (and
            (not (at_player ?p ?player_loc))
            (not (at_box ?b ?box_loc))
            (at_player ?p ?box_loc)
            (at_box ?b ?target_loc)
        )
    )

    (:action push_box_down
        :parameters (?p - player ?b - box ?player_loc ?box_loc ?target_loc - location)
        :precondition (and
            (at_player ?p ?player_loc)
            (at_box ?b ?box_loc)
            (adj_down ?player_loc ?box_loc) ; Player is above the box, pushing it down
            (adj_down ?box_loc ?target_loc)
            (not (is_wall ?target_loc))
            (not (at_box ?b ?target_loc))
        )
        :effect (and
            (not (at_player ?p ?player_loc))
            (not (at_box ?b ?box_loc))
            (at_player ?p ?box_loc)
            (at_box ?b ?target_loc)
        )
    )
)