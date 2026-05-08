(define (domain mystery_blocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types object)
    (:predicates
        (craves ?o1 - object ?o2 - object)
        (harmony)
        (planet ?o - object)
        (province ?o - object)
        (pain ?o - object)
    )

    (:action attack)
        (:parameters (?o - object))
        (:precondition
            (and
                (province ?o)
                (planet ?o)
                (harmony)
            )
        )
        (:effect
            (and
                (pain ?o)
                (not (province ?o))
                (not (planet ?o))
                (not (harmony))
            )
        )

    (:action succumb)
        (:parameters (?o - object))
        (:precondition
            (and
                (pain ?o)
            )
        )
        (:effect
            (and
                (province ?o)
                (planet ?o)
                (harmony)
                (not (pain ?o))
            )
        )

    (:action overcome)
        (:parameters (?o - object ?o2 - object))
        (:precondition
            (and
                (province ?o2)
                (pain ?o)
            )
        )
        (:effect
            (and
                (harmony)
                (province ?o)
                (craves ?o ?o2)
                (not (province ?o2))
                (not (pain ?o))
            )
        )

    (:action feast)
        (:parameters (?o - object ?o2 - object))
        (:precondition
            (and
                (craves ?o ?o2)
                (province ?o)
                (harmony)
            )
        )
        (:effect
            (and
                (pain ?o)
                (province ?o2)
                (not (craves ?o ?o2))
                (not (province ?o))
                (not (harmony))
            )
        )
)