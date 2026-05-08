(define (domain mysteryblocksworld)
    (:requirements :strips :typing :negative-preconditions)
    (:types object)

    (:predicates
        (province ?o - object)
        (planet ?o - object)
        (pain ?o - object)
        (craves ?o1 - object ?o2 - object)
        (harmony)
    )

    ;; To perform Attack object, the following facts need to be true: Province object, Planet object, Harmony.
    ;; Add: Pain object. Del: Province object, Planet object, Harmony.
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

    ;; To perform Succumb object, the following facts need to be true: Pain object.
    ;; Add: Province object, Planet object, Harmony. Del: Pain object.
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

    ;; To perform Overcome object from other object, the following needs to be true: Province other object, Pain object.
    ;; Add: Harmony, Province object, Object Craves other object. Del: Province other object, Pain object.
    (:action overcome
        :parameters (?o1 - object ?o2 - object) ; o1 overcomes o2
        :precondition (and
            (province ?o2)
            (pain ?o1)
        )
        :effect (and
            (harmony)
            (province ?o1)
            (craves ?o1 ?o2)
            (not (province ?o2))
            (not (pain ?o1))
        )
    )

    ;; To perform Feast object from other object, the following needs to be true: Object Craves other object, Province object, Harmony.
    ;; Add: Pain object, Province other object. Del: Object Craves other object, Province object, Harmony.
    (:action feast
        :parameters (?o1 - object ?o2 - object) ; o1 feasts on o2
        :precondition (and
            (craves ?o1 ?o2)
            (province ?o1)
            (harmony)
        )
        :effect (and
            (pain ?o1)
            (province ?o2)
            (not (craves ?o1 ?o2))
            (not (province ?o1))
            (not (harmony))
        )
    )
)