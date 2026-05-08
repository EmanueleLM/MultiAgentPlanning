(define (domain sokoban)
    (:requirements :strips :typing)
    (:types
        player box goal location
    )
    (:predicates
        (at_player ?l - location)
        (at_box ?b - box ?l - location)
        (goal ?l - location)
        (adjacent ?l1 - location ?l2 - location)
    )
    (:action move
        :parameters (?from - location ?to - location)
        :precondition (and (at_player ?from) (adjacent ?from ?to))
        :effect (and (not (at_player ?from)) (at_player ?to))
    )
    (:action push
        :parameters (?from - location ?to - location ?b - box ?next - location)
        :precondition (and (at_player ?from) (at_box ?b ?to) (adjacent ?from ?to) (adjacent ?to ?next))
        :effect (and (not (at_player ?from))
                     (at_player ?to)
                     (not (at_box ?b ?to))
                     (at_box ?b ?next))
    )
)