(define (domain MysteryBlocksworld10)
    (:requirements :strips :typing :negative-preconditions)
    (:types object)

    (:predicates
        (Province ?o - object)
        (Planet ?o - object)
        (Harmony)
        (Pain ?o - object)
        (ObjectCraves ?o1 - object ?o2 - object)
    )

    ;; 1. Attack (?o)
    (:action Attack
        :parameters (?o - object)
        :precondition (and
            (Province ?o)
            (Planet ?o)
            (Harmony)
        )
        :effect (and
            (Pain ?o)
            (not (Province ?o))
            (not (Planet ?o))
            (not (Harmony))
        )
    )

    ;; 2. Succumb (?o)
    (:action Succumb
        :parameters (?o - object)
        :precondition (Pain ?o)
        :effect (and
            (Province ?o)
            (Planet ?o)
            (Harmony)
            (not (Pain ?o))
        )
    )

    ;; 3. Overcome (?o1 ?o2)
    (:action Overcome
        :parameters (?o1 - object ?o2 - object)
        :precondition (and
            (Province ?o2)
            (Pain ?o1)
        )
        :effect (and
            (Harmony)
            (Province ?o1)
            (ObjectCraves ?o1 ?o2)
            (not (Province ?o2))
            (not (Pain ?o1))
        )
    )

    ;; 4. Feast (?o1 ?o2)
    (:action Feast
        :parameters (?o1 - object ?o2 - object)
        :precondition (and
            (ObjectCraves ?o1 ?o2)
            (Province ?o1)
            (Harmony)
        )
        :effect (and
            (Pain ?o1)
            (Province ?o2)
            (not (ObjectCraves ?o1 ?o2))
            (not (Province ?o1))
            (not (Harmony))
        )
    )
)