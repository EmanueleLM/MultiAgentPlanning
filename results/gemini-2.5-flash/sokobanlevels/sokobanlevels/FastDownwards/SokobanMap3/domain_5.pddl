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
        (adj_up ?l1 ?l2 - location)
        (adj_down ?l1 ?l2 - location)
        (adj_left ?l1 ?l2 - location)
        (adj_right ?l1 ?l2 - location)
    )

    (:action move_up
        :parameters (?p - player ?b - box ?from ?to - location)
        :precondition (and
            (at_player ?from)
            (adj_up ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?b ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
            (increase (total-cost) 1)
        )
    )
    (:action move_down
        :parameters (?p - player ?b - box ?from ?to - location)
        :precondition (and
            (at_player ?from)
            (adj_down ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?b ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
            (increase (total-cost) 1)
        )
    )
    (:action move_left
        :parameters (?p - player ?b - box ?from ?to - location)
        :precondition (and
            (at_player ?from)
            (adj_left ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?b ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
            (increase (total-cost) 1)
        )
    )
    (:action move_right
        :parameters (?p - player ?b - box ?from ?to - location)
        :precondition (and
            (at_player ?from)
            (adj_right ?from ?to)
            (not (is_wall ?to))
            (not (at_box ?b ?to))
        )
        :effect (and
            (not (at_player ?from))
            (at_player ?to)
            (increase (total-cost) 1)
        )
    )

    (:action push_up
        :parameters (?p - player ?b - box ?p_loc_from ?b_loc_from ?b_loc_to - location)
        :precondition (and
            (at_player ?p_loc_from)
            (at_box ?b ?b_loc_from)
            (adj_up ?p_loc_from ?b_loc_from)
            (adj_up ?b_loc_from ?b_loc_to)
            (not (is_wall ?b_loc_to))
            (not (at_box ?b ?b_loc_to))
            (not (at_player ?b_loc_to))
        )
        :effect (and
            (not (at_player ?p_loc_from))
            (not (at_box ?b ?b_loc_from))
            (at_player ?b_loc_from)
            (at_box ?b ?b_loc_to)
            (increase (total-cost) 1)
        )
    )

    (:action push_down
        :parameters (?p - player ?b - box ?p_loc_from ?b_loc_from ?b_loc_to - location)
        :precondition (and
            (at_player ?p_loc_from)
            (at_box ?b ?b_loc_from)
            (adj_down ?p_loc_from ?b_loc_from)
            (adj_down ?b_loc_from ?b_loc_to)
            (not (is_wall ?b_loc_to))
            (not (at_box ?b ?b_loc_to))
            (not (at_player ?b_loc_to))
        )
        :effect (and
            (not (at_player ?p_loc_from))
            (not (at_box ?b ?b_loc_from))
            (at_player ?b_loc_from)
            (at_box ?b ?b_loc_to)
            (increase (total-cost) 1)
        )
    )

    (:action push_left
        :parameters (?p - player ?b - box ?p_loc_from ?b_loc_from ?b_loc_to - location)
        :precondition (and
            (at_player ?p_loc_from)
            (at_box ?b ?b_loc_from)
            (adj_left ?p_loc_from ?b_loc_from)
            (adj_left ?b_loc_from ?b_loc_to)
            (not (is_wall ?b_loc_to))
            (not (at_box ?b ?b_loc_to))
            (not (at_player ?b_loc_to))
        )
        :effect (and
            (not (at_player ?p_loc_from))
            (not (at_box ?b ?b_loc_from))
            (at_player ?b_loc_from)
            (at_box ?b ?b_loc_to)
            (increase (total-cost) 1)
        )
    )

    (:action push_right
        :parameters (?p - player ?b - box ?p_loc_from ?b_loc_from ?b_loc_to - location)
        :precondition (and
            (at_player ?p_loc_from)
            (at_box ?b ?b_loc_from)
            (adj_right ?p_loc_from ?b_loc_from)
            (adj_right ?b_loc_from ?b_loc_to)
            (not (is_wall ?b_loc_to))
            (not (at_box ?b ?b_loc_to))
            (not (at_player ?b_loc_to))
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