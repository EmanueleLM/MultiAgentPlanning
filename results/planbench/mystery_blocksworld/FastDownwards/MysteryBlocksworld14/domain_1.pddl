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

    ;; 1. Attack ?o
    ;; Pre {Province ?o, Planet ?o, Harmony}. Add {Pain ?o}. Del {Province ?o, Planet ?o, Harmony}.
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

    ;; 2. Succumb ?o
    ;; Pre {Pain ?o}. Add {Province ?o, Planet ?o, Harmony}. Del {Pain ?o}.
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

    ;; 3. Overcome ?o1 ?o2
    ;; Pre {Province ?o2, Pain ?o1}. Add {Harmony, Province ?o1, Craves ?o1 ?o2}. Del {Province ?o2, Pain ?o1}.
    (:action overcome
        :parameters (?o1 - object ?o2 - object)
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

    ;; 4. Feast ?o1 ?o2
    ;; Pre {Craves ?o1 ?o2, Province ?o1, Harmony}. Add {Pain ?o1, Province ?o2}. Del {Craves ?o1 ?o2, Province ?o1, Harmony}.
    (:action feast
        :parameters (?o1 - object ?o2 - object)
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