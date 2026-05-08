(define (domain mystery_blocksworld15)
    (:requirements :strips :typing :negative-preconditions)
    (:types object)
    (:predicates
        (craves ?o1 - object ?o2 - object)
        (harmony)
        (planet ?o - object)
        (province ?o - object)
        (pain ?o - object)
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
        :precondition (pain ?o)
        :effect (and
            (province ?o)
            (planet ?o)
            (harmony)
            (not (pain ?o))
        )
    )

    (:action overcome
        :parameters (?o - object ?other_o - object)
        :precondition (and
            (province ?other_o)
            (pain ?o)
        )
        :effect (and
            (harmony)
            (province ?o)
            (craves ?o ?other_o)
            (not (province ?other_o))
            (not (pain ?o))
        )
    )

    (:action feast
        :parameters (?o - object ?other_o - object)
        :precondition (and
            (craves ?o ?other_o)
            (province ?o)
            (harmony)
        )
        :effect (and
            (pain ?o)
            (province ?other_o)
            (not (craves ?o ?other_o))
            (not (province ?o))
            (not (harmony))
        )
    )
)