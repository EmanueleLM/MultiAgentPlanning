(define (domain abstract_relationships)
    (:requirements :strips :typing)
    (:types
        entity
    )
    (:predicates
        (province ?e - entity)
        (planet ?e - entity)
        (pain ?e - entity)
        (harmony)
        (craves ?e1 - entity ?e2 - entity)
    )

    (:action Attack
        :parameters (?o - entity)
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

    (:action Succumb
        :parameters (?o - entity)
        :precondition (pain ?o)
        :effect (and 
            (province ?o)
            (planet ?o)
            (harmony)
            (not (pain ?o))
        )
    )

    (:action Overcome
        :parameters (?o1 - entity ?o2 - entity)
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

    (:action Feast
        :parameters (?o1 - entity ?o2 - entity)
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