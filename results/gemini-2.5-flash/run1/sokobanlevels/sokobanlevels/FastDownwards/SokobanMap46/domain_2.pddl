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

    ;; Player movement
    (action move_player
        :parameters (?from ?to - location)
        :precondition (and
            (player-at ?from)
            (adj ?from ?to)
            (not (is-wall ?to))
            (not (box-at b1 ?to)) ; Player cannot move onto the box
        )
        :effect (and
            (not (player-at ?from))
            (player-at ?to)
            (increase (total-cost) 1)
        )
    )

    ;; Push a box
    ;; ?from: player's initial position
    ;; ?box_loc: box's initial position (also player's target position)
    ;; ?to_loc: box's target position
    (action push_box
        :parameters (?b - box ?from ?box_loc ?to_loc - location)
        :precondition (and
            (player-at ?from)
            (box-at ?b ?box_loc)
            (adj ?from ?box_loc)
            (adj ?box_loc ?to_loc)
            (not (is-wall ?to_loc))
            ;; (not (player-at ?to_loc)) is implicitly true as player is at ?from
            ;; (not (box-at ?b2 ?to_loc)) is implicitly true as there is only one box and ?b is not ?to_loc
        )
        :effect (and
            (not (player-at ?from))
            (not (box-at ?b ?box_loc))
            (player-at ?box_loc)
            (box-at ?b ?to_loc)
            (increase (total-cost) 1)
        )
    )