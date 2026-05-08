(define (domain sokoban_map_8)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
        player
        box
    )
    (:predicates
        (at_player ?p - player ?l - location)
        (at_box ?b - box ?l - location)
        (is_goal ?l - location)
        (clear ?l - location) ; a location is clear if nothing is on it
        (above ?l1 ?l2 - location) ; ?l1 is immediately above ?l2 (e.g., ?l1 = (R,C), ?l2 = (R+1,C))
        (below ?l1 ?l2 - location) ; ?l1 is immediately below ?l2 (e.l., ?l1 = (R+1,C), ?l2 = (R,C))
        (left_of ?l1 ?l2 - location) ; ?l1 is immediately left of ?l2 (e.g., ?l1 = (R,C), ?l2 = (R,C+1))
        (right_of ?l1 ?l2 - location) ; ?l1 is immediately right of ?l2 (e.g., ?l1 = (R,C+1), ?l2 = (R,C))
    )

    ;; Player movement actions
    (:action move_up
        :parameters (?p - player ?from ?to - location)
        :precondition (and
            (at_player ?p ?from)
            (above ?from ?to)
            (clear ?to)
        )
        :effect (and
            (not (at_player ?p ?from))
            (at_player ?p ?to)
            (not (clear ?to))
            (clear ?from)
        )
    )

    (:action move_down
        :parameters (?p - player ?from ?to - location)
        :precondition (and
            (at_player ?p ?from)
            (below ?from ?to)
            (clear ?to)
        )
        :effect (and
            (not (at_player ?p ?from))
            (at_player ?p ?to)
            (not (clear ?to))
            (clear ?from)
        )
    )

    (:action move_left
        :parameters (?p - player ?from ?to - location)
        :precondition (and
            (at_player ?p ?from)
            (left_of ?from ?to)
            (clear ?to)
        )
        :effect (and
            (not (at_player ?p ?from))
            (at_player ?p ?to)
            (not (clear ?to))
            (clear ?from)
        )
    )

    (:action move_right
        :parameters (?p - player ?from ?to - location)
        :precondition (and
            (at_player ?p ?from)
            (right_of ?from ?to)
            (clear ?to)
        )
        :effect (and
            (not (at_player ?p ?from))
            (at_player ?p ?to)
            (not (clear ?to))
            (clear ?from)
        )
    )

    ;; Push actions
    ;; Player moves to box_from, box moves to box_to
    (:action push_up
        :parameters (?p - player ?b - box ?player_from ?box_from ?box_to - location)
        :precondition (and
            (at_player ?p ?player_from)
            (at_box ?b ?box_from)
            (below ?player_from ?box_from) ; player is behind (below) the box
            (below ?box_from ?box_to)     ; box will move up to box_to
            (clear ?box_to)               ; target box location must be clear
        )
        :effect (and
            (not (at_player ?p ?player_from))
            (at_player ?p ?box_from)      ; player moves to box's old spot
            (not (at_box ?b ?box_from))
            (at_box ?b ?box_to)           ; box moves to new spot
            (clear ?player_from)          ; player's old spot is clear
            (not (clear ?box_to))         ; box's new spot is not clear
        )
    )

    (:action push_down
        :parameters (?p - player ?b - box ?player_from ?box_from ?box_to - location)
        :precondition (and
            (at_player ?p ?player_from)
            (at_box ?b ?box_from)
            (above ?player_from ?box_from) ; player is behind (above) the box
            (above ?box_from ?box_to)     ; box will move down to box_to
            (clear ?box_to)               ; target box location must be clear
        )
        :effect (and
            (not (at_player ?p ?player_from))
            (at_player ?p ?box_from)      ; player moves to box's old spot
            (not (at_box ?b ?box_from))
            (at_box ?b ?box_to)           ; box moves to new spot
            (clear ?player_from)          ; player's old spot is clear
            (not (clear ?box_to))         ; box's new spot is not clear
        )
    )

    (:action push_left
        :parameters (?p - player ?b - box ?player_from ?box_from ?box_to - location)
        :precondition (and
            (at_player ?p ?player_from)
            (at_box ?b ?box_from)
            (right_of ?player_from ?box_from) ; player is behind (right of) the box
            (right_of ?box_from ?box_to)     ; box will move left to box_to
            (clear ?box_to)               ; target box location must be clear
        )
        :effect (and
            (not (at_player ?p ?player_from))
            (at_player ?p ?box_from)      ; player moves to box's old spot
            (not (at_box ?b ?box_from))
            (at_box ?b ?box_to)           ; box moves to new spot
            (clear ?player_from)          ; player's old spot is clear
            (not (clear ?box_to))         ; box's new spot is not clear
        )
    )

    (:action push_right
        :parameters (?p - player ?b - box ?player_from ?box_from ?box_to - location)
        :precondition (and
            (at_player ?p ?player_from)
            (at_box ?b ?box_from)
            (left_of ?player_from ?box_from) ; player is behind (left of) the box
            (left_of ?box_from ?box_to)     ; box will move right to box_to
            (clear ?box_to)               ; target box location must be clear
        )
        :effect (and
            (not (at_player ?p ?player_from))
            (at_player ?p ?box_from)      ; player moves to box's old spot
            (not (at_box ?b ?box_from))
            (at_box ?b ?box_to)           ; box moves to new spot
            (clear ?player_from)          ; player's old spot is clear
            (not (clear ?box_to))         ; box's new spot is not clear
        )
    )
)