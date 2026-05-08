(define (domain sokobanmap30)
    (:requirements :strips :typing :negative-preconditions)
    (:types location)
    (:predicates
        (at_player ?l - location)
        (at_box ?l - location)
        (is_goal ?l - location)
        (adj_left ?l1 ?l2 - location)
        (adj_right ?l1 ?l2 - location)
    )

    ;; Player moves one step left into an empty square
    (:action move_left
        :parameters (?from - location ?to - location)
        :precondition (and (at_player ?from)
                           (adj_left ?from ?to)
                           (not (at_box ?to)))
        :effect (and (not (at_player ?from))
                     (at_player ?to)))

    ;; Player moves one step right into an empty square
    (:action move_right
        :parameters (?from - location ?to - location)
        :precondition (and (at_player ?from)
                           (adj_right ?from ?to)
                           (not (at_box ?to)))
        :effect (and (not (at_player ?from))
                     (at_player ?to)))

    ;; Player pushes box one step left
    (:action push_left
        :parameters (?player_from - location ?box_from - location ?box_to - location)
        :precondition (and (at_player ?player_from)
                           (adj_left ?player_from ?box_from)
                           (at_box ?box_from)
                           (adj_left ?box_from ?box_to)
                           (not (at_box ?box_to)))
        :effect (and (not (at_player ?player_from))
                     (at_player ?box_from)
                     (not (at_box ?box_from))
                     (at_box ?box_to)))

    ;; Player pushes box one step right
    (:action push_right
        :parameters (?player_from - location ?box_from - location ?box_to - location)
        :precondition (and (at_player ?player_from)
                           (adj_right ?player_from ?box_from)
                           (at_box ?box_from)
                           (adj_right ?box_from ?box_to)
                           (not (at_box ?box_to)))
        :effect (and (not (at_player ?player_from))
                     (at_player ?box_from)
                     (not (at_box ?box_from))
                     (at_box ?box_to)))
)