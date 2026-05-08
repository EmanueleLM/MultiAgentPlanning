(define (domain sokobanmap32)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        agent
        box
        location
    )
    (:predicates
        (at_agent ?l - location)
        (at_box ?b - box ?l - location)
        (is_goal ?l - location)
        (is_empty ?l - location)
        (connected_left ?l1 ?l2 - location)
        (connected_right ?l1 ?l2 - location)
        (connected_up ?l1 ?l2 - location)
        (connected_down ?l1 ?l2 - location)
    )

    (:action move_left
        :parameters (?from ?to - location)
        :precondition (and
            (at_agent ?from)
            (connected_left ?from ?to)
            (is_empty ?to)
        )
        :effect (and
            (not (at_agent ?from))
            (at_agent ?to)
            (is_empty ?from)
            (not (is_empty ?to))
        )
    )

    (:action move_right
        :parameters (?from ?to - location)
        :precondition (and
            (at_agent ?from)
            (connected_right ?from ?to)
            (is_empty ?to)
        )
        :effect (and
            (not (at_agent ?from))
            (at_agent ?to)
            (is_empty ?from)
            (not (is_empty ?to))
        )
    )

    (:action move_up
        :parameters (?from ?to - location)
        :precondition (and
            (at_agent ?from)
            (connected_up ?from ?to)
            (is_empty ?to)
        )
        :effect (and
            (not (at_agent ?from))
            (at_agent ?to)
            (is_empty ?from)
            (not (is_empty ?to))
        )
    )

    (:action move_down
        :parameters (?from ?to - location)
        :precondition (and
            (at_agent ?from)
            (connected_down ?from ?to)
            (is_empty ?to)
        )
        :effect (and
            (not (at_agent ?from))
            (at_agent ?to)
            (is_empty ?from)
            (not (is_empty ?to))
        )
    )

    (:action push_left
        :parameters (?b - box ?agent_from ?box_from ?box_to - location)
        :precondition (and
            (at_agent ?agent_from)
            (at_box ?b ?box_from)
            (connected_right ?agent_from ?box_from) ; Agent is to the right of the box
            (connected_left ?box_from ?box_to)    ; Box pushes left
            (is_empty ?box_to)
        )
        :effect (and
            (not (at_agent ?agent_from))
            (at_agent ?box_from) ; Agent moves to box's old position
            (not (at_box ?b ?box_from))
            (at_box ?b ?box_to)
            (is_empty ?agent_from)
            (not (is_empty ?box_from)) ; Agent now occupies box_from
            (not (is_empty ?box_to))    ; Box now occupies box_to
        )
    )

    (:action push_right
        :parameters (?b - box ?agent_from ?box_from ?box_to - location)
        :precondition (and
            (at_agent ?agent_from)
            (at_box ?b ?box_from)
            (connected_left ?agent_from ?box_from) ; Agent is to the left of the box
            (connected_right ?box_from ?box_to)   ; Box pushes right
            (is_empty ?box_to)
        )
        :effect (and
            (not (at_agent ?agent_from))
            (at_agent ?box_from)
            (not (at_box ?b ?box_from))
            (at_box ?b ?box_to)
            (is_empty ?agent_from)
            (not (is_empty ?box_from))
            (not (is_empty ?box_to))
        )
    )

    (:action push_up
        :parameters (?b - box ?agent_from ?box_from ?box_to - location)
        :precondition (and
            (at_agent ?agent_from)
            (at_box ?b ?box_from)
            (connected_down ?agent_from ?box_from) ; Agent is below the box
            (connected_up ?box_from ?box_to)      ; Box pushes up
            (is_empty ?box_to)
        )
        :effect (and
            (not (at_agent ?agent_from))
            (at_agent ?box_from)
            (not (at_box ?b ?box_from))
            (at_box ?b ?box_to)
            (is_empty ?agent_from)
            (not (is_empty ?box_from))
            (not (is_empty ?box_to))
        )
    )

    (:action push_down
        :parameters (?b - box ?agent_from ?box_from ?box_to - location)
        :precondition (and
            (at_agent ?agent_from)
            (at_box ?b ?box_from)
            (connected_up ?agent_from ?box_from)   ; Agent is above the box
            (connected_down ?box_from ?box_to)    ; Box pushes down
            (is_empty ?box_to)
        )
        :effect (and
            (not (at_agent ?agent_from))
            (at_agent ?box_from)
            (not (at_box ?b ?box_from))
            (at_box ?b ?box_to)
            (is_empty ?agent_from)
            (not (is_empty ?box_from))
            (not (is_empty ?box_to))
        )
    )
)