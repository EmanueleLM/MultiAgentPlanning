(define (domain MysteryBlocksworld20)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types object)

    (:predicates
        (Province ?o - object)
        (Planet ?o - object)
        (Harmony)
        (Pain ?o - object)
        (ObjectCraves ?o1 - object ?o2 - object)
    )

    (:functions
        (total-cost) - number
    )

    ; Action 1: Attack(?o). Pre: (Province ?o), (Planet ?o), (Harmony). Effects: ADD (Pain ?o) / DEL (Province ?o), (Planet ?o), (Harmony).
    (:action Attack
        :parameters (?o - object)
        :precondition (and
            (Province ?o)
            (Planet ?o)
            (Harmony)
        )
        :effect (and
            (not (Province ?o))
            (not (Planet ?o))
            (not (Harmony))
            (Pain ?o)
            (increase (total-cost) 1)
        )
    )

    ; Action 2: Succumb(?o). Pre: (Pain ?o). Effects: ADD (Province ?o), (Planet ?o), (Harmony) / DEL (Pain ?o).
    (:action Succumb
        :parameters (?o - object)
        :precondition (and
            (Pain ?o)
        )
        :effect (and
            (not (Pain ?o))
            (Province ?o)
            (Planet ?o)
            (Harmony)
            (increase (total-cost) 1)
        )
    )

    ; Action 3: Overcome(?o1 ?o2). Pre: (Province ?o2), (Pain ?o1). Effects: ADD (Harmony), (Province ?o1), (ObjectCraves ?o1 ?o2) / DEL (Province ?o2), (Pain ?o1).
    (:action Overcome
        :parameters (?o1 - object ?o2 - object)
        :precondition (and
            (Province ?o2)
            (Pain ?o1)
        )
        :effect (and
            (not (Province ?o2))
            (not (Pain ?o1))
            (Harmony)
            (Province ?o1)
            (ObjectCraves ?o1 ?o2)
            (increase (total-cost) 1)
        )
    )

    ; Action 4: Feast(?o1 ?o2). Pre: (ObjectCraves ?o1 ?o2), (Province ?o1), (Harmony). Effects: ADD (Pain ?o1), (Province ?o2) / DEL (ObjectCraves ?o1 ?o2), (Province ?o1), (Harmony).
    (:action Feast
        :parameters (?o1 - object ?o2 - object)
        :precondition (and
            (ObjectCraves ?o1 ?o2)
            (Province ?o1)
            (Harmony)
        )
        :effect (and
            (not (ObjectCraves ?o1 ?o2))
            (not (Province ?o1))
            (not (Harmony))
            (Pain ?o1)
            (Province ?o2)
            (increase (total-cost) 1)
        )
    )
)