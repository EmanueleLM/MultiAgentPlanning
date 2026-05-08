(define (domain mystery_blocksworld7)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        object
    )
    (:predicates
        (province ?o - object)
        (planet ?o - object)
        (harmony)
        (pain ?o - object)
        (craves ?o1 - object ?o2 - object)
    )

    (:action attack
        :parameters (?o - object)
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
        :parameters (?o - object)
        :precondition (and
            (pain ?o)
        )
        :effect (and
            (province ?o)
            (planet ?o)
            (harmony)
            (not (pain ?o))
        )
    )

    (:action overcome
        :parameters (?o - object ?o_other - object)
        :precondition (and
            (province ?o_other)
            (pain ?o)
        )
        :effect (and
            (harmony)
            (province ?o)
            (craves ?o ?o_other)
            (not (province ?o_other))
            (not (pain ?o))
        )
    )

    (:action feast
        :parameters (?o - object ?o_other - object)
        :precondition (and
            (craves ?o ?o_other)
            (province ?o)
            (harmony)
        )
        :effect (and
            (pain ?o)
            (province ?o_other)
            (not (craves ?o ?o_other))
            (not (province ?o))
            (not (harmony))
        )
    )
)