(define (domain mysteryblocksworld15)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        object
    )
    (:predicates
        (province ?o - object)
        (planet ?o - object)
        (pain ?o - object)
        (harmony)
        (craves ?o1 - object ?o2 - object)
    )

    ;; 1. Attack (?o): Requires (Province ?o), (Planet ?o), (Harmony). Results in (Pain ?o) and removes the preconditions.
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

    ;; 2. Succumb (?o): Requires (Pain ?o). Results in (Province ?o), (Planet ?o), (Harmony) and removes (Pain ?o).
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

    ;; 3. Overcome (?o ?other_o): Requires (Province ?other_o), (Pain ?o). Results in (Harmony), (Province ?o), (Craves ?o ?other_o) and removes the preconditions.
    (:action overcome
        :parameters (?o - object ?other_o - object)
        :precondition (and
            (province ?other_o)
            (pain ?o)
            (not (= ?o ?other_o))
        )
        :effect (and
            (harmony)
            (province ?o)
            (craves ?o ?other_o)
            (not (province ?other_o))
            (not (pain ?o))
        )
    )

    ;; 4. Feast (?o ?other_o): Requires (Craves ?o ?other_o), (Province ?o), (Harmony). Results in (Pain ?o), (Province ?other_o) and removes the preconditions.
    (:action feast
        :parameters (?o - object ?other_o - object)
        :precondition (and
            (craves ?o ?other_o)
            (province ?o)
            (harmony)
            (not (= ?o ?other_o))
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