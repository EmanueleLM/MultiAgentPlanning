(define (domain MysteryBlocksworld0)
    (:requirements :strips :typing :negative-preconditions)
    (:types object)

    (:predicates
        (Province ?o - object)
        (Planet ?o - object)
        (Harmony)
        (Pain ?o - object)
        (Craves ?o1 - object ?o2 - object)
    )

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

    (:action Overcome
        :parameters (?o1 - object ?o2 - object)
        :precondition (and
            (Province ?o2)
            (Pain ?o1)
        )
        :effect (and
            (Harmony)
            (Province ?o1)
            (Craves ?o1 ?o2)
            (not (Province ?o2))
            (not (Pain ?o1))
        )
    )

    (:action Feast
        :parameters (?o1 - object ?o2 - object)
        :precondition (and
            (Craves ?o1 ?o2)
            (Province ?o1)
            (Harmony)
        )
        :effect (and
            (Pain ?o1)
            (Province ?o2)
            (not (Craves ?o1 ?o2))
            (not (Province ?o1))
            (not (Harmony))
        )
    )
)