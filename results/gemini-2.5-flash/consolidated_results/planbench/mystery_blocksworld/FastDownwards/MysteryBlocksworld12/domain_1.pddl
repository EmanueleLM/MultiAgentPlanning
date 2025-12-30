(define (domain MysteryBlocksworld12)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        object
    )
    (:predicates
        (Province ?o - object)
        (Planet ?o - object)
        (Harmony)
        (Pain ?o - object)
        (Craves ?o1 - object ?o2 - object)
    )
    (:functions
        (total-cost)
    )

    ;; Rules for Attack(?o): Requires (Province ?o), (Planet ?o), (Harmony). Effects: Adds (Pain ?o). Removes (Province ?o), (Planet ?o), (Harmony).
    (:action attack
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
            (increase (total-cost) 1)
        )
    )

    ;; Rules for Succumb(?o): Requires (Pain ?o). Effects: Adds (Province ?o), (Planet ?o), (Harmony). Removes (Pain ?o).
    (:action succumb
        :parameters (?o - object)
        :precondition (Pain ?o)
        :effect (and
            (Province ?o)
            (Planet ?o)
            (Harmony)
            (not (Pain ?o))
            (increase (total-cost) 1)
        )
    )

    ;; Rules for Overcome(?o1 ?o2): Requires (Province ?o2), (Pain ?o1). Effects: Adds (Harmony), (Province ?o1), (Craves ?o1 ?o2). Removes (Province ?o2), (Pain ?o1). 
    (:action overcome
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
            (increase (total-cost) 1)
        )
    )

    ;; Rules for Feast(?o1 ?o2): Requires (Craves ?o1 ?o2), (Province ?o1), (Harmony). Effects: Adds (Pain ?o1), (Province ?o2). Removes (Craves ?o1 ?o2), (Province ?o1), (Harmony).
    (:action feast
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
            (increase (total-cost) 1)
        )
    )
)