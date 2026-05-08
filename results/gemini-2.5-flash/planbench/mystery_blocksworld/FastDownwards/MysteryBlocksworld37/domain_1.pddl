(define (domain mystery_blocksworld)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types object)
    (:predicates
        (province ?o - object)
        (planet ?o - object)
        (harmony)
        (pain ?o - object)
        (craves ?o1 - object ?o2 - object)
    )
    (:functions (total-cost))

    (:action attack
        :parameters (?obj - object)
        :precondition (and
            (province ?obj)
            (planet ?obj)
            (harmony)
        )
        :effect (and
            (not (province ?obj))
            (not (planet ?obj))
            (not (harmony))
            (pain ?obj)
            (increase (total-cost) 1)
        )
    )

    (:action succumb
        :parameters (?obj - object)
        :precondition (and
            (pain ?obj)
        )
        :effect (and
            (not (pain ?obj))
            (province ?obj)
            (planet ?obj)
            (harmony)
            (increase (total-cost) 1)
        )
    )

    (:action overcome
        :parameters (?obj - object ?other_obj - object)
        :precondition (and
            (province ?other_obj)
            (pain ?obj)
        )
        :effect (and
            (not (province ?other_obj))
            (not (pain ?obj))
            (harmony)
            (province ?obj)
            (craves ?obj ?other_obj)
            (increase (total-cost) 1)
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
            (not (craves ?obj ?other_obj))
            (not (province ?obj))
            (not (harmony))
            (pain ?obj)
            (province ?other_obj)
            (increase (total-cost) 1)
        )
    )
)