(define (domain mystery_blocksworld43)
    (:requirements :strips :typing :negative-preconditions)
    (:types object)
    (:predicates
        (province ?obj - object)
        (planet ?obj - object)
        (pain ?obj - object)
        (craves ?obj1 - object ?obj2 - object)
        (harmony)
    )

    (:action attack
        :parameters (?obj - object)
        :precondition (and
            (province ?obj)
            (planet ?obj)
            (harmony)
        )
        :effect (and
            (pain ?obj)
            (not (province ?obj))
            (not (planet ?obj))
            (not (harmony))
        )
    )

    (:action succumb
        :parameters (?obj - object)
        :precondition (and
            (pain ?obj)
        )
        :effect (and
            (province ?obj)
            (planet ?obj)
            (harmony)
            (not (pain ?obj))
        )
    )

    (:action overcome
        :parameters (?obj - object ?other_obj - object)
        :precondition (and
            (province ?other_obj)
            (pain ?obj)
        )
        :effect (and
            (harmony)
            (province ?obj)
            (craves ?obj ?other_obj)
            (not (province ?other_obj))
            (not (pain ?obj))
        )
    )

    (:action feast
        :parameters (?obj - object ?other_obj - object)
        :precondition (and
            (craves ?obj ?other_obj)
            (province ?obj)
            (harmony)
        )
        :effect (and
            (pain ?obj)
            (province ?other_obj)
            (not (craves ?obj ?other_obj))
            (not (province ?obj))
            (not (harmony))
        )
    )
)