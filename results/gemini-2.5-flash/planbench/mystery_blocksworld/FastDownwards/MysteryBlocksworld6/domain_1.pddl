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
        :parameters (?eater - object ?food - object)
        :precondition (and
            (craves ?eater ?food)
            (province ?eater)
            (harmony)
        )
        :effect (and
            (pain ?eater)
            (province ?food)
            (not (craves ?eater ?food))
            (not (province ?eater))
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
        :parameters (?victor - object ?defeated - object)
        :precondition (and
            (province ?defeated)
            (pain ?victor)
        )
        :effect (and
            (harmony)
            (province ?victor)
            (craves ?victor ?defeated)
            (not (province ?defeated))
            (not (pain ?victor))
        )
    )
)