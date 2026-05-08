(define (domain mystery_blocksworld8)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        item
    )
    (:predicates
        (province ?o - item)
        (planet ?o - item)
        (harmony)
        (pain ?o - item)
        (object_craves ?o1 - item ?o2 - item)
    )

    (:action attack
        :parameters (?o - item)
        :precondition (and
            (province ?o)
            (planet ?o)
            (harmony)
        )
        :effect (and
            (pain ?o)
            (not (province ?o))
            (not (planet ?o))
            (not (harmony))
        )
    )

    (:action succumb
        :parameters (?o - item)
        :precondition (pain ?o)
        :effect (and
            (province ?o)
            (planet ?o)
            (harmony)
            (not (pain ?o))
        )
    )

    (:action overcome
        :parameters (?o - item ?o_other - item)
        :precondition (and
            (province ?o_other)
            (pain ?o)
        )
        :effect (and
            (harmony)
            (province ?o)
            (object_craves ?o ?o_other)
            (not (province ?o_other))
            (not (pain ?o))
        )
    )

    (:action feast
        :parameters (?o - item ?o_other - item)
        :precondition (and
            (object_craves ?o ?o_other)
            (province ?o)
            (harmony)
        )
        :effect (and
            (pain ?o)
            (province ?o_other)
            (not (object_craves ?o ?o_other))
            (not (province ?o))
            (not (harmony))
        )
    )
)