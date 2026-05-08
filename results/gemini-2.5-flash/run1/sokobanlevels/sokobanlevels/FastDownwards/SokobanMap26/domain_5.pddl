(define (domain sokoban-map26)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location
        player
        box
    )
    (:predicates
        (at ?obj - (player | box) ?loc - location)
        (is_goal ?loc - location)
        (is_wall ?loc - location)
        (connected_up ?from ?to - location)
        (connected_down ?from ?to - location)
    )
    (:functions
        (total-cost)
    )

    (:action move_player_up
        :parameters (?p - player ?from ?to - location)
        :precondition (and (at ?p ?from)
                         (connected_up ?from ?to)
                         (not (is_wall ?to))
                         (not (at box1 ?to))) ; Ensure target is not a wall and not occupied by the box
        :effect (and (not (at ?p ?from))
                     (at ?p ?to)
                     (increase (total-cost) 1))
    )

    (:action move_player_down
        :parameters (?p - player ?from ?to - location)
        :precondition (and (at ?p ?from)
                         (connected_down ?from ?to)
                         (not (is_wall ?to))
                         (not (at box1 ?to))) ; Ensure target is not a wall and not occupied by the box
        :effect (and (not (at ?p ?from))
                     (at ?p ?to)
                     (increase (total-cost) 1))
    )

    (:action push_box_up
        :parameters (?p - player ?b - box ?from_player ?from_box ?to_box - location)
        :precondition (and (at ?p ?from_player)
                         (at ?b ?from_box)
                         (connected_up ?from_player ?from_box) ; Player is directly below the box
                         (connected_up ?from_box ?to_box)     ; Box can be pushed upwards
                         (not (is_wall ?to_box))
                         (not (at box1 ?to_box)))             ; The target square for the box must be empty (not occupied by another box, or the box itself which is implicitly true as from_box != to_box)
        :effect (and (not (at ?p ?from_player))
                     (not (at ?b ?from_box))
                     (at ?p ?from_box)     ; Player moves to the box's old spot
                     (at ?b ?to_box)       ; Box moves to the new spot
                     (increase (total-cost) 1))
    )

    (:action push_box_down
        :parameters (?p - player ?b - box ?from_player ?from_box ?to_box - location)
        :precondition (and (at ?p ?from_player)
                         (at ?b ?from_box)
                         (connected_down ?from_player ?from_box) ; Player is directly above the box
                         (connected_down ?from_box ?to_box)     ; Box can be pushed downwards
                         (not (is_wall ?to_box))
                         (not (at box1 ?to_box)))
        :effect (and (not (at ?p ?from_player))
                     (not (at ?b ?from_box))
                     (at ?p ?from_box)
                     (at ?b ?to_box)
                     (increase (total-cost) 1))
    )
)