(define (domain MysteryBlocksworld3)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        object
    )
    (:predicates
        (Province ?o - object)
        (Planet ?o - object)
        (Harmony)
        (Pain ?o - object)
        (ObjectCraves ?o1 - object ?o2 - object)
    )
    (:functions
        (total-cost)
    )

    ;; 1. Attack(?o): Pre: Province(?o), Planet(?o), Harmony. Eff: Pain(?o), ~Province(?o), ~Planet(?o), ~Harmony.
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

    ;; 2. Succumb(?o): Pre: Pain(?o). Eff: Province(?o), Planet(?o), Harmony, ~Pain(?o).
    (:action succumb
        :parameters (?o - object)
        :precondition (and
            (Pain ?o)
        )
        :effect (and
            (Province ?o)
            (Planet ?o)
            (Harmony)
            (not (Pain ?o))
            (increase (total-cost) 1)
        )
    )

    ;; 3. Overcome(?o1, ?o2): Pre: Province(?o2), Pain(?o1). Eff: Harmony, Province(?o1), ObjectCraves(?o1, ?o2), ~Province(?o2), ~Pain(?o1).
    (:action overcome
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
            (increase (total-cost) 1)
        )
    )

    ;; 4. Feast(?o1, ?o2): Pre: ObjectCraves(?o1, ?o2), Province(?o1), Harmony. Eff: Pain(?o1), Province(?o2), ~ObjectCraves(?o1, ?o2), ~Province(?o1), ~Harmony.
    (:action feast
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
            (increase (total-cost) 1)
        )
    )
)