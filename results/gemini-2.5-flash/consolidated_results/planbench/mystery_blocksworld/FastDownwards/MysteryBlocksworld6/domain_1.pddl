(define (domain mystery-blocksworld-6)
    (:requirements :strips :typing :negative-preconditions)
    (:types object)

    (:predicates
        (craves ?o1 - object ?o2 - object)
        (harmony)
        (planet ?o - object)
        (province ?o - object)
        (pain ?o - object)
    )

    ;; 1. Attack object O
    ;; Preconditions: Province O, Planet O, Harmony.
    ;; Effects (Add): Pain O.
    ;; Effects (Delete): Province O, Planet O, Harmony.
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
    ;; Preconditions: O Craves O2, Province O, Harmony.
    ;; Effects (Add): Pain O, Province O2.
    ;; Effects (Delete): O Craves O2, Province O, Harmony.
    (:action feast
        :parameters (?o - object ?o2 - object)
        :precondition (and
            (craves ?o ?o2)
            (province ?o)
            (harmony)
            (not (= ?o ?o2))
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
    ;; Preconditions: Pain O.
    ;; Effects (Add): Province O, Planet O, Harmony.
    ;; Effects (Delete): Pain O.
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

    ;; 4. Overcome object O from other object O2
    ;; Preconditions: Province O2, Pain O.
    ;; Effects (Add): Harmony, Province O, O Craves O2.
    ;; Effects (Delete): Province O2, Pain O.
    (:action overcome
        :parameters (?o - object ?o2 - object)
        :precondition (and
            (province ?o2)
            (pain ?o)
            (not (= ?o ?o2))
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