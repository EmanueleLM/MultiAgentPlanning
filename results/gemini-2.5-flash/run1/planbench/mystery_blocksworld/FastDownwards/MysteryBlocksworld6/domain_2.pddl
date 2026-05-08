(define (domain mystery_blocksworld6)
    (:requirements :strips :typing :negative-preconditions)
    (:types object)
    (:predicates
        (province ?o - object)
        (planet ?o - object)
        (harmony)
        (pain ?o - object)
        (craves ?o1 - object ?o2 - object)
    )

    ;; 1. Attack object O
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

    ;; 2. Feast object O from other object O2
    (:action feast
        :parameters (?o - object ?o2 - object)
        :precondition (and
            (craves ?o ?o2)
            (province ?o)
            (harmony)
        )
        :effect (and
            (pain ?o)
            (province ?o2)
            (not (craves ?o ?o2))
            (not (province ?o))
            (not (harmony))
        )
    )

    ;; 3. Succumb object O
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

    ;; 4. Overcome object O from other object O2
    (:action overcome
        :parameters (?o - object ?o2 - object)
        :precondition (and
            (province ?o2)
            (pain ?o)
        )
        :effect (and
            (harmony)
            (province ?o)
            (craves ?o ?o2)
            (not (province ?o2))
            (not (pain ?o))
        )
    )
)