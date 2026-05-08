(define (domain mystery_blocksworld26)
    (:requirements :strips :typing :negative-preconditions)
    (:types object)
    (:predicates
        (province ?o - object)
        (planet ?o - object)
        (harmony)
        (pain ?o - object)
        (craves ?o1 - object ?o2 - object)
    )

    (:action attack_object
        :parameters (?o - object)
        :precondition (and
            (province ?o)
            (planet ?o)
            (harmony)
        )
        :effect (and
            (not (province ?o))
            (not (planet ?o))
            (not (harmony))
            (pain ?o)
        )
    )

    (:action succumb_object
        :parameters (?o - object)
        :precondition (pain ?o)
        :effect (and
            (not (pain ?o))
            (province ?o)
            (planet ?o)
            (harmony)
        )
    )

    (:action overcome_object
        :parameters (?overcomer - object ?overcome_from - object)
        :precondition (and
            (province ?overcome_from)
            (pain ?overcomer)
        )
        :effect (and
            (not (province ?overcome_from))
            (not (pain ?overcomer))
            (harmony)
            (province ?overcomer)
            (craves ?overcomer ?overcome_from)
        )
    )

    (:action feast_object
        :parameters (?feaster - object ?feasted_from - object)
        :precondition (and
            (craves ?feaster ?feasted_from)
            (province ?feaster)
            (harmony)
        )
        :effect (and
            (not (craves ?feaster ?feasted_from))
            (not (province ?feaster))
            (not (harmony))
            (pain ?feaster)
            (province ?feasted_from)
        )
    )
)