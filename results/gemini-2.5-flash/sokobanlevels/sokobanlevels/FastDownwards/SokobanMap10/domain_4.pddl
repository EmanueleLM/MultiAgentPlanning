(define (domain sokoban-map10)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        player
        box
        location
    )
    (:predicates
        (at_player ?l - location)
        (at_box ?l - location)
        (is_goal ?l - location)
        (is_wall ?l - location)
        (is_floor ?l - location)
        (up ?l1 ?l2 - location)
        (down ?l1 ?l2 - location)
        (left ?l1 ?l2 - location)
        (right ?l1 ?l2 - location)
    )

    (:action move_player_up
        :parameters (?l1 ?l2 - location)
        :precondition (and (at_player ?l1)
                           (up ?l1 ?l2)
                           (is_floor ?l2)
                           (not (at_box ?l2)))
        :effect (and (not (at_player ?l1))
                     (at_player ?l2)))

    (:action move_player_down
        :parameters (?l1 ?l2 - location)
        :precondition (and (at_player ?l1)
                           (down ?l1 ?l2)
                           (is_floor ?l2)
                           (not (at_box ?l2)))
        :effect (and (not (at_player ?l1))
                     (at_player ?l2)))

    (:action move_player_left
        :parameters (?l1 ?l2 - location)
        :precondition (and (at_player ?l1)
                           (left ?l1 ?l2)
                           (is_floor ?l2)
                           (not (at_box ?l2)))
        :effect (and (not (at_player ?l1))
                     (at_player ?l2)))

    (:action move_player_right
        :parameters (?l1 ?l2 - location)
        :precondition (and (at_player ?l1)
                           (right ?l1 ?l2)
                           (is_floor ?l2)
                           (not (at_box ?l2)))
        :effect (and (not (at_player ?l1))
                     (at_player ?l2)))

    (:action push_box_up
        :parameters (?l1 ?l2 ?l3 - location)
        :precondition (and (at_player ?l1)
                           (at_box ?l2)
                           (up ?l1 ?l2)
                           (up ?l2 ?l3)
                           (is_floor ?l3)
                           (not (at_box ?l3)))
        :effect (and (not (at_player ?l1))
                     (at_player ?l2)
                     (not (at_box ?l2))
                     (at_box ?l3)))

    (:action push_box_down
        :parameters (?l1 ?l2 ?l3 - location)
        :precondition (and (at_player ?l1)
                           (at_box ?l2)
                           (down ?l1 ?l2)
                           (down ?l2 ?l3)
                           (is_floor ?l3)
                           (not (at_box ?l3)))
        :effect (and (not (at_player ?l1))
                     (at_player ?l2)
                     (not (at_box ?l2))
                     (at_box ?l3)))

    (:action push_box_left
        :parameters (?l1 ?l2 ?l3 - location)
        :precondition (and (at_player ?l1)
                           (at_box ?l2)
                           (left ?l1 ?l2)
                           (left ?l2 ?l3)
                           (is_floor ?l3)
                           (not (at_box ?l3)))
        :effect (and (not (at_player ?l1))
                     (at_player ?l2)
                     (not (at_box ?l2))
                     (at_box ?l3)))

    (:action push_box_right
        :parameters (?l1 ?l2 ?l3 - location)
        :precondition (and (at_player ?l1)
                           (at_box ?l2)
                           (right ?l1 ?l2)
                           (right ?l2 ?l3)
                           (is_floor ?l3)
                           (not (at_box ?l3)))
        :effect (and (not (at_player ?l1))
                     (at_player ?l2)
                     (not (at_box ?l2))
                     (at_box ?l3)))
)