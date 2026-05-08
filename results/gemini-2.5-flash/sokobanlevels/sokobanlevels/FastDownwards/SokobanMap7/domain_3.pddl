(define (domain sokoban_map7)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        agent item location
    )
    (:constants
        p1 - agent
        b1 - item
    )
    (:predicates
        (at ?obj - (either agent item) ?loc - location)
        (is_goal ?loc - location)
        (is_wall ?loc - location)
        (north ?from ?to - location)
        (south ?from ?to - location)
        (east ?from ?to - location)
        (west ?from ?to - location)
    )

    ;; Actions for player movement
    (:action move_player_up
        :parameters (?from ?to - location)
        :precondition (and
            (at p1 ?from)
            (north ?from ?to)
            (not (is_wall ?to))
            (not (at b1 ?to)) ; Cannot move into a spot occupied by the box
        )
        :effect (and
            (not (at p1 ?from))
            (at p1 ?to)
        )
    )

    (:action move_player_down
        :parameters (?from ?to - location)
        :precondition (and
            (at p1 ?from)
            (south ?from ?to)
            (not (is_wall ?to))
            (not (at b1 ?to)) ; Cannot move into a spot occupied by the box
        )
        :effect (and
            (not (at p1 ?from))
            (at p1 ?to)
        )
    )

    (:action move_player_left
        :parameters (?from ?to - location)
        :precondition (and
            (at p1 ?from)
            (west ?from ?to)
            (not (is_wall ?to))
            (not (at b1 ?to)) ; Cannot move into a spot occupied by the box
        )
        :effect (and
            (not (at p1 ?from))
            (at p1 ?to)
        )
    )

    (:action move_player_right
        :parameters (?from ?to - location)
        :precondition (and
            (at p1 ?from)
            (east ?from ?to)
            (not (is_wall ?to))
            (not (at b1 ?to)) ; Cannot move into a spot occupied by the box
        )
        :effect (and
            (not (at p1 ?from))
            (at p1 ?to)
        )
    )

    ;; Actions for pushing the box
    (:action push_box_up
        :parameters (?p_loc ?b_loc ?b_to_loc - location)
        :precondition (and
            (at p1 ?p_loc)
            (at b1 ?b_loc)
            (north ?p_loc ?b_loc)     ; Player is south of the box
            (north ?b_loc ?b_to_loc)  ; Box moves north
            (not (is_wall ?b_to_loc))
            (not (at p1 ?b_to_loc))   ; Box target cannot be player's current spot (player moves to b_loc)
        )
        :effect (and
            (not (at p1 ?p_loc))
            (at p1 ?b_loc)            ; Player moves to box's old spot
            (not (at b1 ?b_loc))
            (at b1 ?b_to_loc)         ; Box moves to new spot
        )
    )

    (:action push_box_down
        :parameters (?p_loc ?b_loc ?b_to_loc - location)
        :precondition (and
            (at p1 ?p_loc)
            (at b1 ?b_loc)
            (south ?p_loc ?b_loc)     ; Player is north of the box
            (south ?b_loc ?b_to_loc)  ; Box moves south
            (not (is_wall ?b_to_loc))
            (not (at p1 ?b_to_loc))
        )
        :effect (and
            (not (at p1 ?p_loc))
            (at p1 ?b_loc)
            (not (at b1 ?b_loc))
            (at b1 ?b_to_loc)
        )
    )

    (:action push_box_left
        :parameters (?p_loc ?b_loc ?b_to_loc - location)
        :precondition (and
            (at p1 ?p_loc)
            (at b1 ?b_loc)
            (west ?p_loc ?b_loc)      ; Player is east of the box
            (west ?b_loc ?b_to_loc)   ; Box moves west
            (not (is_wall ?b_to_loc))
            (not (at p1 ?b_to_loc))
        )
        :effect (and
            (not (at p1 ?p_loc))
            (at p1 ?b_loc)
            (not (at b1 ?b_loc))
            (at b1 ?b_to_loc)
        )
    )

    (:action push_box_right
        :parameters (?p_loc ?b_loc ?b_to_loc - location)
        :precondition (and
            (at p1 ?p_loc)
            (at b1 ?b_loc)
            (east ?p_loc ?b_loc)      ; Player is west of the box
            (east ?b_loc ?b_to_loc)   ; Box moves east
            (not (is_wall ?b_to_loc))
            (not (at p1 ?b_to_loc))
        )
        :effect (and
            (not (at p1 ?p_loc))
            (at p1 ?b_loc)
            (not (at b1 ?b_loc))
            (at b1 ?b_to_loc)
        )
    )
)