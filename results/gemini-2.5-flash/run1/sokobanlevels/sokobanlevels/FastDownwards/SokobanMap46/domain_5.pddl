(define (domain sokoban-sokobanmap46)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        player box location
    )
    (:predicates
        (player-at ?l - location)
        (box-at ?b - box ?l - location)
        (is-goal ?l - location)
        (is-wall ?l - location)
        (adj ?l1 ?l2 - location)
    )
    (:functions (total-cost) - number)

    ;; Player movement without pushing a box
    (:action move_player
        :parameters (?from ?to - location)
        :precondition (and
            (player-at ?from)
            (adj ?from ?to)
            (not (is-wall ?to))
            (not (box-at b1 ?to)) ; Player cannot move onto the box b1
        )
        :effect (and
            (not (player-at ?from))
            (player-at ?to)
            (increase (total-cost) 1)
        )
    )

    ;; Push a box
    ;; ?from: player's initial position
    ;; ?box_loc: box's initial position (also player's target position after push)
    ;; ?to_loc: box's target position after push
    (:action push_box
        :parameters (?b - box ?from ?box_loc ?to_loc - location)
        :precondition (and
            (player-at ?from)
            (box-at ?b ?box_loc)
            (adj ?from ?box_loc) ; Player must be adjacent to the box
            (adj ?box_loc ?to_loc) ; The space behind the box must be adjacent to the box
            (not (is-wall ?to_loc)) ; The space behind the box must not be a wall
            ;; (not (player-at ?to_loc)) is implicitly true as player is at ?from, and ?from != ?to_loc for a push.
            ;; (not (box-at ?b_other ?to_loc)) is implicitly true as there is only one box (?b) and it's moving from ?box_loc.
            ;; For a single box problem, the destination `?to_loc` is "empty" if not a wall and not occupied by player (which moves).
        )
        :effect (and
            (not (player-at ?from))
            (not (box-at ?b ?box_loc))
            (player-at ?box_loc) ; Player moves to the box's original position
            (box-at ?b ?to_loc) ; Box moves to its new position
            (increase (total-cost) 1)
        )
    )