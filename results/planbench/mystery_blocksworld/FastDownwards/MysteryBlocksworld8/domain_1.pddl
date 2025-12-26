(define (domain mystery-blocksworld8)
    (:requirements :strips :typing)
    (:types item)

    (:predicates
        (Province ?o - item)
        (Planet ?o - item)
        (Harmony)
        (Pain ?o - item)
        (ObjectCraves ?o1 - item ?o2 - item)
    )

    ;; 1. Attack object (?o)
    (:action attack
        :parameters (?o - item)
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

    ;; 2. Succumb object (?o)
    (:action succumb
        :parameters (?o - item)
        :precondition (Pain ?o)
        :effect (and
            (Province ?o)
            (Planet ?o)
            (Harmony)
            (not (Pain ?o))
        )
    )

    ;; 3. Overcome object (?o ?o_other)
    (:action overcome
        :parameters (?o - item ?o_other - item)
        :precondition (and
            (Province ?o_other)
            (Pain ?o)
        )
        :effect (and
            (Harmony)
            (Province ?o)
            (ObjectCraves ?o ?o_other)
            (not (Province ?o_other))
            (not (Pain ?o))
        )
    )

    ;; 4. Feast object (?o ?o_other)
    (:action feast
        :parameters (?o - item ?o_other - item)
        :precondition (and
            (ObjectCraves ?o ?o_other)
            (Province ?o)
            (Harmony)
        )
        :effect (and
            (Pain ?o)
            (Province ?o_other)
            (not (ObjectCraves ?o ?o_other))
            (not (Province ?o))
            (not (Harmony))
        )
    )
)