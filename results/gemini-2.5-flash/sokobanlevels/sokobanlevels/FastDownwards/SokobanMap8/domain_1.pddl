(define (domain sokobanmap8)
    (:requirements :strips :typing :negative-preconditions)
    (:types player box goal location direction)
    (:predicates
        (at_player ?l - location)
        (at_box ?b - box ?l - location)
        (is_goal ?l - location)
        (adjacent ?l1 ?l2 - location ?d - direction)
    )
    ;; Action schemas would be inserted here by the compiler.
)