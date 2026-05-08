(define (domain mystery_blocksworld44)
    (:requirements :strips :typing :negative-preconditions)
    (:types object)
    (:predicates
        (province ?o - object)
        (planet ?o - object)
        (harmony)
        (pain ?o - object)
        (craves ?o1 - object ?o2 - object)
    )

    (:action attack
        :parameters (?target - object)
        :precondition
            (and
                (province ?target)
                (planet ?target)
                (harmony)
            )
        :effect
            (and
                (not (province ?target))
                (not (planet ?target))
                (not (harmony))
                (pain ?target)
            )
    )

    (:action succumb
        :parameters (?target - object)
        :precondition
            (and
                (pain ?target)
            )
        :effect
            (and
                (not (pain ?target))
                (province ?target)
                (planet ?target)
                (harmony)
            )
    )

    (:action overcome
        :parameters (?obj1 - object ?obj2 - object)
        :precondition
            (and
                (province ?obj2)
                (pain ?obj1)
            )
        :effect
            (and
                (not (province ?obj2))
                (not (pain ?obj1))
                (harmony)
                (province ?obj1)
                (craves ?obj1 ?obj2)
            )
    )

    (:action feast
        :parameters (?obj1 - object ?obj2 - object)
        :precondition
            (and
                (craves ?obj1 ?obj2)
                (province ?obj1)
                (harmony)
            )
        :effect
            (and
                (not (craves ?obj1 ?obj2))
                (not (province ?obj1))
                (not (harmony))
                (pain ?obj1)
                (province ?obj2)
            )
    )
)