(define (domain sokoban)
    (:requirements :strips :typing :negative-preconditions)
    (:types agent item location)

    (:predicates 
        (at_agent ?a - agent ?loc - location)
        (at_item ?i - item ?loc - location)
        (is_goal ?loc - location)
        (is_free ?loc - location)
        (adjacent ?loc1 - location ?loc2 - location)
    )

    (:action move
        :parameters (?a - agent ?from - location ?to - location)
        :precondition (and (at_agent ?a ?from) (adjacent ?from ?to) (is_free ?to))
        :effect (and (not (at_agent ?a ?from)) (at_agent ?a ?to))
    )

    (:action push
        :parameters (?a - agent ?i - item ?from - location ?box_pos - location ?to - location)
        :precondition 
            (and (at_agent ?a ?from) (at_item ?i ?box_pos)
                 (adjacent ?from ?box_pos) (adjacent ?box_pos ?to)
                 (is_free ?to))
        :effect 
            (and (not (at_agent ?a ?from)) (at_agent ?a ?box_pos)
                 (not (at_item ?i ?box_pos)) (at_item ?i ?to))
    )
)