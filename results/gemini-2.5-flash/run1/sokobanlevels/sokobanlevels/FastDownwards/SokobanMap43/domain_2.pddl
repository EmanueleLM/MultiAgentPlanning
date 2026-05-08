(define (domain sokoban_map43)
    (:requirements :strips :typing :negative-preconditions)
    (:types pos)
    (:predicates
        (at_player ?p - pos)
        (at_box ?p - pos)
        (is_goal ?p - pos)
        (can_move_left ?from ?to - pos)
        (can_move_right ?from ?to - pos)
    )

    (:action move_left
        :parameters (?p_from - pos ?p_to - pos)
        :precondition (and
            (at_player ?p_from)
            (can_move_left ?p_from ?p_to)
            (not (at_box ?p_to))
        )
        :effect (and
            (not (at_player ?p_from))
            (at_player ?p_to)
        )
    )

    (:action move_right
        :parameters (?p_from - pos ?p_to - pos)
        :precondition (and
            (at_player ?p_from)
            (can_move_right ?p_from ?p_to)
            (not (at_box ?p_to))
        )
        :effect (and
            (not (at_player ?p_from))
            (at_player ?p_to)
        )
    )

    (:action push_left
        :parameters (?p_player_from - pos ?p_box_from - pos ?p_box_to - pos)
        :precondition (and
            (at_player ?p_player_from)
            (at_box ?p_box_from)
            (can_move_left ?p_player_from ?p_box_from) ; Player is to the right of the box
            (can_move_left ?p_box_from ?p_box_to)     ; Box moves left to p_box_to
            (not (at_box ?p_box_to))                    ; Box's target must be empty of another box
            (not (at_player ?p_box_to))                 ; Box's target must be empty of player
        )
        :effect (and
            (not (at_player ?p_player_from))
            (at_player ?p_box_from)                     ; Player moves to box's old spot
            (not (at_box ?p_box_from))
            (at_box ?p_box_to)                          ; Box moves to p_box_to
        )
    )

    (:action push_right
        :parameters (?p_player_from - pos ?p_box_from - pos ?p_box_to - pos)
        :precondition (and
            (at_player ?p_player_from)
            (at_box ?p_box_from)
            (can_move_right ?p_player_from ?p_box_from) ; Player is to the left of the box
            (can_move_right ?p_box_from ?p_box_to)      ; Box moves right to p_box_to
            (not (at_box ?p_box_to))                     ; Box's target must be empty of another box
            (not (at_player ?p_box_to))                  ; Box's target must be empty of player
        )
        :effect (and
            (not (at_player ?p_player_from))
            (at_player ?p_box_from)                      ; Player moves to box's old spot
            (not (at_box ?p_box_from))
            (at_box ?p_box_to)                           ; Box moves to p_box_to
        )
    )
)