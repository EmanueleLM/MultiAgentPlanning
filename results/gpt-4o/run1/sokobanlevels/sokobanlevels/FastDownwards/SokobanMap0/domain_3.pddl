(define (domain sokoban)
    (:requirements :strips :typing :negative-preconditions)
    (:types player box position)
    (:predicates
        (at ?e - (either player box) ?p - position)
        (is_goal ?p - position)
        (is_wall ?p - position)
        (adjacent ?p1 ?p2 - position)
    )
    
    ;; Movement actions for the player
    ;; All actions below imply moving to a non-wall and non-box position
    (:action move_left
        :parameters (?player - player ?from ?to - position)
        :precondition (and
            (at ?player ?from)
            (adjacent ?from ?to)
            (not (is_wall ?to))
            (forall (?b - box) (not (at ?b ?to)))
        )
        :effect (and
            (not (at ?player ?from))
            (at ?player ?to))
    )

    (:action move_right
        :parameters (?player - player ?from ?to - position)
        :precondition (and
            (at ?player ?from)
            (adjacent ?from ?to)
            (not (is_wall ?to))
            (forall (?b - box) (not (at ?b ?to)))
        )
        :effect (and
            (not (at ?player ?from))
            (at ?player ?to))
    )

    (:action move_up
        :parameters (?player - player ?from ?to - position)
        :precondition (and
            (at ?player ?from)
            (adjacent ?from ?to)
            (not (is_wall ?to))
            (forall (?b - box) (not (at ?b ?to)))
        )
        :effect (and
            (not (at ?player ?from))
            (at ?player ?to))
    )

    (:action move_down
        :parameters (?player - player ?from ?to - position)
        :precondition (and
            (at ?player ?from)
            (adjacent ?from ?to)
            (not (is_wall ?to))
            (forall (?b - box) (not (at ?b ?to)))
        )
        :effect (and
            (not (at ?player ?from))
            (at ?player ?to))
    )

    ;; Pushing actions for the player
    ;; Require the player to be adjacent to the box and absent from walls
    (:action push_left
        :parameters (?player - player ?box - box ?p1 ?p2 ?p3 - position)
        :precondition (and
            (at ?player ?p1)
            (at ?box ?p2)
            (adjacent ?p1 ?p2)
            (adjacent ?p2 ?p3)
            (not (is_wall ?p3))
            (forall (?b - box) (not (at ?b ?p3)))
        )
        :effect (and
            (not (at ?player ?p1))
            (at ?player ?p2)
            (not (at ?box ?p2))
            (at ?box ?p3))
    )

    (:action push_right
        :parameters (?player - player ?box - box ?p1 ?p2 ?p3 - position)
        :precondition (and
            (at ?player ?p1)
            (at ?box ?p2)
            (adjacent ?p1 ?p2)
            (adjacent ?p2 ?p3)
            (not (is_wall ?p3))
            (forall (?b - box) (not (at ?b ?p3)))
        )
        :effect (and
            (not (at ?player ?p1))
            (at ?player ?p2)
            (not (at ?box ?p2))
            (at ?box ?p3))
    )

    (:action push_up
        :parameters (?player - player ?box - box ?p1 ?p2 ?p3 - position)
        :precondition (and
            (at ?player ?p1)
            (at ?box ?p2)
            (adjacent ?p1 ?p2)
            (adjacent ?p2 ?p3)
            (not (is_wall ?p3))
            (forall (?b - box) (not (at ?b ?p3)))
        )
        :effect (and
            (not (at ?player ?p1))
            (at ?player ?p2)
            (not (at ?box ?p2))
            (at ?box ?p3))
    )

    (:action push_down
        :parameters (?player - player ?box - box ?p1 ?p2 ?p3 - position)
        :precondition (and
            (at ?player ?p1)
            (at ?box ?p2)
            (adjacent ?p1 ?p2)
            (adjacent ?p2 ?p3)
            (not (is_wall ?p3))
            (forall (?b - box) (not (at ?b ?p3)))
        )
        :effect (and
            (not (at ?player ?p1))
            (at ?player ?p2)
            (not (at ?box ?p2))
            (at ?box ?p3))
    )
)