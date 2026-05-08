(define (domain MysteryBlocksworld13)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        object
    )
    (:predicates
        (Craves ?x - object ?y - object)
        (Province ?x - object)
        (Planet ?x - object)
        (Pain ?x - object)
        (Harmony)
    )
    (:functions
        (total-cost)
    )

    ;; Attack(X): Pre: Province(X), Planet(X), Harmony. Add: Pain(X). Del: Province(X), Planet(X), Harmony.
    (:action Attack
        :parameters (?x - object)
        :precondition (and
            (Province ?x)
            (Planet ?x)
            (Harmony)
        )
        :effect (and
            (not (Province ?x))
            (not (Planet ?x))
            (not (Harmony))
            (Pain ?x)
            (increase (total-cost) 1)
        )
    )

    ;; Succumb(X): Pre: Pain(X). Add: Province(X), Planet(X), Harmony. Del: Pain(X).
    (:action Succumb
        :parameters (?x - object)
        :precondition (Pain ?x)
        :effect (and
            (not (Pain ?x))
            (Province ?x)
            (Planet ?x)
            (Harmony)
            (increase (total-cost) 1)
        )
    )

    ;; Overcome(X, Y): Pre: Province(Y), Pain(X). Add: Harmony, Province(X), Craves(X, Y). Del: Province(Y), Pain(X).
    (:action Overcome
        :parameters (?x - object ?y - object)
        :precondition (and
            (Province ?y)
            (Pain ?x)
        )
        :effect (and
            (not (Province ?y))
            (not (Pain ?x))
            (Harmony)
            (Province ?x)
            (Craves ?x ?y)
            (increase (total-cost) 1)
        )
    )

    ;; Feast(X, Y): Pre: Craves(X, Y), Province(X), Harmony. Add: Pain(X), Province(Y). Del: Craves(X, Y), Province(X), Harmony.
    (:action Feast
        :parameters (?x - object ?y - object)
        :precondition (and
            (Craves ?x ?y)
            (Province ?x)
            (Harmony)
        )
        :effect (and
            (not (Craves ?x ?y))
            (not (Province ?x))
            (not (Harmony))
            (Pain ?x)
            (Province ?y)
            (increase (total-cost) 1)
        )
    )
)