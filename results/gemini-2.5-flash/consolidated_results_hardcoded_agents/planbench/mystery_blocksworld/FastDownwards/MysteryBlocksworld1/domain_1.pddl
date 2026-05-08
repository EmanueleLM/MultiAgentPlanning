(define (domain MysteryBlocksworld1)
    (:requirements :strips :typing :negative-preconditions)
    (:types object)

    (:predicates
        (Province ?o - object)
        (Planet ?o - object)
        (Harmony)
        (Pain ?o - object)
        (Craves ?o1 - object ?o2 - object)
    )

    ;; Domain_Planner Actions
    
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

    ;; Action_Planner Actions

    (:action Overcome
        :parameters (?o - object ?other_o - object)
        :precondition (and
            (Province ?other_o)
            (Pain ?o)
        )
        :effect (and
            (Harmony)
            (Province ?o)
            (Craves ?o ?other_o)
            (not (Province ?other_o))
            (not (Pain ?o))
        )
    )

    (:action Feast
        :parameters (?o - object ?other_o - object)
        :precondition (and
            (Craves ?o ?other_o)
            (Province ?o)
            (Harmony)
        )
        :effect (and
            (Pain ?o)
            (Province ?other_o)
            (not (Craves ?o ?other_o))
            (not (Province ?o))
            (not (Harmony))
        )
    )
)