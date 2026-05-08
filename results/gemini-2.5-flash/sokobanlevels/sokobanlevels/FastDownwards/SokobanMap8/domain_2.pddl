(define (domain sokobanmap8)
    (:requirements :strips :typing :negative-preconditions)
    (:types player box location direction)
    (:predicates
        (at_player ?l - location)
        (at_box ?l - location)
        (is_goal ?l - location)
        (adjacent ?l1 ?l2 - location ?d - direction)
    )

    (:action move_up
        :parameters (?l_from ?l_to - location)
        :precondition (and
            (at_player ?l_from)
            (adjacent ?l_from ?l_to up)
            (not (at_box ?l_to))
        )
        :effect (and
            (not (at_player ?l_from))
            (at_player ?l_to)
        )
    )

    (:action move_down
        :parameters (?l_from ?l_to - location)
        :precondition (and
            (at_player ?l_from)
            (adjacent ?l_from ?l_to down)
            (not (at_box ?l_to))
        )
        :effect (and
            (not (at_player ?l_from))
            (at_player ?l_to)
        )
    )

    (:action move_left
        :parameters (?l_from ?l_to - location)
        :precondition (and
            (at_player ?l_from)
            (adjacent ?l_from ?l_to left)
            (not (at_box ?l_to))
        )
        :effect (and
            (not (at_player ?l_from))
            (at_player ?l_to)
        )
    )

    (:action move_right
        :parameters (?l_from ?l_to - location)
        :precondition (and
            (at_player ?l_from)
            (adjacent ?l_from ?l_to right)
            (not (at_box ?l_to))
        )
        :effect (and
            (not (at_player ?l_from))
            (at_player ?l_to)
        )
    )

    (:action push_up
        :parameters (?l_player ?l_box ?l_target - location)
        :precondition (and
            (at_player ?l_player)
            (at_box ?l_box)
            (adjacent ?l_player ?l_box up)
            (adjacent ?l_box ?l_target up)
            (not (at_box ?l_target))
        )
        :effect (and
            (not (at_player ?l_player))
            (at_player ?l_box)
            (not (at_box ?l_box))
            (at_box ?l_target)
        )
    )

    (:action push_down
        :parameters (?l_player ?l_box ?l_target - location)
        :precondition (and
            (at_player ?l_player)
            (at_box ?l_box)
            (adjacent ?l_player ?l_box down)
            (adjacent ?l_box ?l_target down)
            (not (at_box ?l_target))
        )
        :effect (and
            (not (at_player ?l_player))
            (at_player ?l_box)
            (not (at_box ?l_box))
            (at_box ?l_target)
        )
    )

    (:action push_left
        :parameters (?l_player ?l_box ?l_target - location)
        :precondition (and
            (at_player ?l_player)
            (at_box ?l_box)
            (adjacent ?l_player ?l_box left)
            (adjacent ?l_box ?l_target left)
            (not (at_box ?l_target))
        )
        :effect (and
            (not (at_player ?l_player))
            (at_player ?l_box)
            (not (at_box ?l_box))
            (at_box ?l_target)
        )
    )

    (:action push_right
        :parameters (?l_player ?l_box ?l_target - location)
        :precondition (and
            (at_player ?l_player)
            (at_box ?l_box)
            (adjacent ?l_player ?l_box right)
            (adjacent ?l_box ?l_target right)
            (not (at_box ?l_target))
        )
        :effect (and
            (not (at_player ?l_player))
            (at_player ?l_box)
            (not (at_box ?l_box))
            (at_box ?l_target)
        )
    )
)