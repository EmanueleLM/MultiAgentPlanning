(define (domain MysteryBlocksworld5)
    (:requirements :strips :typing :negative-preconditions)
    (:types object)
    (:predicates
        (province ?o - object)
        (planet ?o - object)
        (harmony)
        (pain ?o - object)
        (craves ?o1 - object ?o2 - object)
    )

    ;; 1. Attack object (O): Pre: Province O, Planet O, Harmony. Add: Pain O. Del: Province O, Planet O, Harmony.
    (:action attack
        :parameters (?o - object)
        :precondition (and (province ?o)
                           (planet ?o)
                           (harmony))
        :effect (and (pain ?o)
                     (not (province ?o))
                     (not (planet ?o))
                     (not (harmony))
                )
    )

    ;; 2. Succumb object (O): Pre: Pain O. Add: Province O, Planet O, Harmony. Del: Pain O.
    (:action succumb
        :parameters (?o - object)
        :precondition (pain ?o)
        :effect (and (province ?o)
                     (planet ?o)
                     (harmony)
                     (not (pain ?o))
                )
    )

    ;; 3. Overcome object (O1) from another object (O2): Pre: Province O2, Pain O1. Add: Harmony, Province O1, O1 Craves O2. Del: Province O2, Pain O1.
    (:action overcome
        :parameters (?o1 - object ?o2 - object)
        :precondition (and (province ?o2)
                           (pain ?o1))
        :effect (and (harmony)
                     (province ?o1)
                     (craves ?o1 ?o2)
                     (not (province ?o2))
                     (not (pain ?o1))
                )
    )

    ;; 4. Feast object (O1) from another object (O2): Pre: O1 Craves O2, Province O1, Harmony. Add: Pain O1, Province O2. Del: O1 Craves O2, Province O1, Harmony.
    (:action feast
        :parameters (?o1 - object ?o2 - object)
        :precondition (and (craves ?o1 ?o2)
                           (province ?o1)
                           (harmony))
        :effect (and (pain ?o1)
                     (province ?o2)
                     (not (craves ?o1 ?o2))
                     (not (province ?o1))
                     (not (harmony))
                )
    )
)