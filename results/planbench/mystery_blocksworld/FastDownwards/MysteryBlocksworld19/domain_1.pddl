(define (domain mystery-abstract-domain)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types object)

    (:predicates
        (Province ?o - object)
        (Planet ?o - object)
        (Pain ?o - object)
        (Harmony) ; Global state flag
        (ObjectCraves ?o1 - object ?o2 - object) ; o1 craves o2
    )

    (:functions
        (total-cost)
    )

    ; Action Attack: Preconditions: Province object, Planet object, Harmony. Effects: Pain object, NOT Province object, NOT Planet object, NOT Harmony.
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

    ; Action Succumb: Preconditions: Pain object. Effects: Province object, Planet object, Harmony, NOT Pain object.
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
    
    ; Action Overcome: Preconditions: Province other object, Pain object. Effects: Harmony, Province object, Object Craves other object, NOT Province other object, NOT Pain object.
    ; ?o1 is the object in Pain, ?o2 is the Province object being overcome.
    (:action overcome
        :parameters (?o1 - object ?o2 - object)
        :precondition (and
            (Pain ?o1)
            (Province ?o2)
            (not (= ?o1 ?o2))
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

    ; Action Feast: Preconditions: Object Craves other object, Province object, Harmony. Effects: Pain object, Province other object, NOT Object Craves other object, NOT Province object, NOT Harmony.
    ; ?o1 is the Province object that craves ?o2.
    (:action feast
        :parameters (?o1 - object ?o2 - object)
        :precondition (and
            (ObjectCraves ?o1 ?o2)
            (Province ?o1)
            (Harmony)
            (not (= ?o1 ?o2))
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