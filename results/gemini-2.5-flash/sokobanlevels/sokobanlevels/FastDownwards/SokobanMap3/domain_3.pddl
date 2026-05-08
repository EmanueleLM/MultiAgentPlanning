(define (domain sokoban-map3)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        player box location
    )
    (:predicates
        (at_player ?l - location)
        (at_box ?b - box ?l - location)
        (is_goal ?l - location)
        (is_wall ?l - location)
        (adj_up ?l1 ?l2 - location)    ; ?l2 is immediately above ?l1 (smaller y-coordinate)
        (adj_down ?l1 ?l2 - location)  ; ?l2 is immediately below ?l1 (larger y-coordinate)
        (adj_left ?l1 ?l2 - location)  ; ?l2 is immediately left of ?l1 (smaller x-coordinate)
        (adj_right ?l1 ?l2 - location) ; ?l2 is immediately right of ?l1 (larger x-coordinate)
    )

    ;; Player movement actions
    (:action move_up
        :parameters (?p - player ?from ?to - location)
        :precondition (and
            (at_player ?from)
            (adj_up ?from ?to)
            (not (is_wall ?to))
            (not (at_box box-01 ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
            (increase (total-cost) 1)
        )
    )
    (:action move_down
        :parameters (?p - player ?from ?to - location)
        :precondition (and
            (at_player ?from)
            (adj_down ?from ?to)
            (not (is_wall ?to))
            (not (at_box box-01 ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
            (increase (total-cost) 1)
        )
    )
    (:action move_left
        :parameters (?p - player ?from ?to - location)
        :precondition (and
            (at_player ?from)
            (adj_left ?from ?to)
            (not (is_wall ?to))
            (not (at_box box-01 ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
            (increase (total-cost) 1)
        )
    )
    (:action move_right
        :parameters (?p - player ?from ?to - location)
        :precondition (and
            (at_player ?from)
            (adj_right ?from ?to)
            (not (is_wall ?to))
            (not (at_box box-01 ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
            (increase (total-cost) 1)
        )
    )

    ;; Box pushing actions
    ;; Player at ?p_loc_from, Box at ?b_loc_from, Box moves to ?b_loc_to.
    ;; Player then moves to ?b_loc_from.

    ;; Push box UP: Player is below the box. Box is pushed up.
    ;; Preconditions:
    ;; 1. Player is at ?p_loc_from.
    ;; 2. Box is at ?b_loc_from.
    ;; 3. ?b_loc_from is immediately above ?p_loc_from (player is below box).
    ;; 4. ?b_loc_to is immediately above ?b_loc_from (box moves up).
    ;; 5. ?b_loc_to is not a wall.
    ;; 6. ?b_loc_to is not occupied by another box.
    (:action push_up
        :parameters (?p - player ?b - box ?p_loc_from ?b_loc_from ?b_loc_to - location)
        :precondition (and
            (at_player ?p_loc_from)
            (at_box ?b ?b_loc_from)
            (adj_up ?p_loc_from ?b_loc_from) ; ?b_loc_from is above ?p_loc_from
            (adj_up ?b_loc_from ?b_loc_to)   ; ?b_loc_to is above ?b_loc_from
            (not (is_wall ?b_loc_to))
            (not (at_box ?b ?b_loc_to))
        )
        :effect (and
            (not (at_player ?p_loc_from))
            (not (at_box ?b ?b_loc_from))
            (at_player ?b_loc_from)
            (at_box ?b ?b_loc_to)
            (increase (total-cost) 1)
        )
    )

    ;; Push box DOWN: Player is above the box. Box is pushed down.
    ;; Preconditions:
    ;; 1. Player is at ?p_loc_from.
    ;; 2. Box is at ?b_loc_from.
    ;; 3. ?b_loc_from is immediately below ?p_loc_from (player is above box).
    ;; 4. ?b_loc_to is immediately below ?b_loc_from (box moves down).
    ;; 5. ?b_loc_to is not a wall.
    ;; 6. ?b_loc_to is not occupied by another box.
    (:action push_down
        :parameters (?p - player ?b - box ?p_loc_from ?b_loc_from ?b_loc_to - location)
        :precondition (and
            (at_player ?p_loc_from)
            (at_box ?b ?b_loc_from)
            (adj_down ?p_loc_from ?b_loc_from) ; ?b_loc_from is below ?p_loc_from
            (adj_down ?b_loc_from ?b_loc_to)   ; ?b_loc_to is below ?b_loc_from
            (not (is_wall ?b_loc_to))
            (not (at_box ?b ?b_loc_to))
        )
        :effect (and
            (not (at_player ?p_loc_from))
            (not (at_box ?b ?b_loc_from))
            (at_player ?b_loc_from)
            (at_box ?b ?b_loc_to)
            (increase (total-cost) 1)
        )
    )

    ;; Push box LEFT: Player is right of the box. Box is pushed left.
    ;; Preconditions:
    ;; 1. Player is at ?p_loc_from.
    ;; 2. Box is at ?b_loc_from.
    ;; 3. ?b_loc_from is immediately left of ?p_loc_from (player is right of box).
    ;; 4. ?b_loc_to is immediately left of ?b_loc_from (box moves left).
    ;; 5. ?b_loc_to is not a wall.
    ;; 6. ?b_loc_to is not occupied by another box.
    (:action push_left
        :parameters (?p - player ?b - box ?p_loc_from ?b_loc_from ?b_loc_to - location)
        :precondition (and
            (at_player ?p_loc_from)
            (at_box ?b ?b_loc_from)
            (adj_left ?p_loc_from ?b_loc_from) ; ?b_loc_from is left of ?p_loc_from
            (adj_left ?b_loc_from ?b_loc_to)   ; ?b_loc_to is left of ?b_loc_from
            (not (is_wall ?b_loc_to))
            (not (at_box ?b ?b_loc_to))
        )
        :effect (and
            (not (at_player ?p_loc_from))
            (not (at_box ?b ?b_loc_from))
            (at_player ?b_loc_from)
            (at_box ?b ?b_loc_to)
            (increase (total-cost) 1)
        )
    )

    ;; Push box RIGHT: Player is left of the box. Box is pushed right.
    ;; Preconditions:
    ;; 1. Player is at ?p_loc_from.
    ;; 2. Box is at ?b_loc_from.
    ;; 3. ?b_loc_from is immediately right of ?p_loc_from (player is left of box).
    ;; 4. ?b_loc_to is immediately right of ?b_loc_from (box moves right).
    ;; 5. ?b_loc_to is not a wall.
    ;; 6. ?b_loc_to is not occupied by another box.
    (:action push_right
        :parameters (?p - player ?b - box ?p_loc_from ?b_loc_from ?b_loc_to - location)
        :precondition (and
            (at_player ?p_loc_from)
            (at_box ?b ?b_loc_from)
            (adj_right ?p_loc_from ?b_loc_from) ; ?b_loc_from is right of ?p_loc_from
            (adj_right ?b_loc_from ?b_loc_to)   ; ?b_loc_to is right of ?b_loc_from
            (not (is_wall ?b_loc_to))
            (not (at_box ?b ?b_loc_to))
        )
        :effect (and
            (not (at_player ?p_loc_from))
            (not (at_box ?b ?b_loc_from))
            (at_player ?b_loc_from)
            (at_box ?b ?b_loc_to)
            (increase (total-cost) 1)
        )
    )
)