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

    ;; 1. Attack object
    ;; To perform Attack action, the following facts need to be true: Province object, Planet object, Harmony.
    ;; Once Attack action is performed the following facts will be true: Pain object.
    ;; Once Attack action is performed the following facts will be false: Province object, Planet object, Harmony.
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

    ;; 2. Succumb object
    ;; To perform Succumb action, the following facts need to be true: Pain object.
    ;; Once Succumb action is performed the following facts will be true: Province object, Planet object, Harmony.
    ;; Once Succumb action is performed the following facts will be false: Pain object.
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

    ;; 3. Overcome object from another object
    ;; To perform Overcome action, the following needs to be true: Province other object, Pain object.
    ;; Once Overcome action is performed the following will be true: Harmony, Province object, Object Craves other object.
    ;; Once Overcome action is performed the following will be false: Province other object, Pain object.
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

    ;; 4. Feast object from another object
    ;; To perform Feast action, the following needs to be true: Object Craves other object, Province object, Harmony.
    ;; Once Feast action is performed the following will be true: Pain object, Province other object.
    ;; Once Feast action is performed the following will be false:, Object Craves other object, Province object, Harmony.
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