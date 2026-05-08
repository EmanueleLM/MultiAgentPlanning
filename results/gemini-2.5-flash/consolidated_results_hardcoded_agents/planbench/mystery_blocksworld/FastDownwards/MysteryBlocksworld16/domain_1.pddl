(define (domain MysteryBlocksworld16)
    (:requirements :strips :typing :negative-preconditions)
    (:types entity)
    
    (:predicates
        (craves ?o1 - entity ?o2 - entity)
        (harmony)
        (planet ?o - entity)
        (province ?o - entity)
        (pain ?o - entity)
    )

    (:action attack
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

    (:action succumb
        :parameters (?o - entity)
        :precondition (pain ?o)
        :effect (and 
            (province ?o)
            (planet ?o)
            (harmony)
            (not (pain ?o))
        )
    )

    (:action overcome
        :parameters (?o - entity ?o2 - entity)
        :precondition (and 
            (province ?o2) 
            (pain ?o)
        )
        :effect (and 
            (harmony)
            (province ?o)
            (craves ?o ?o2)
            (not (province ?o2))
            (not (pain ?o))
        )
    )

    (:action feast
        :parameters (?o - entity ?o2 - entity)
        :precondition (and 
            (craves ?o ?o2) 
            (province ?o) 
            (harmony)
        )
        :effect (and 
            (pain ?o)
            (province ?o2)
            (not (craves ?o ?o2))
            (not (province ?o))
            (not (harmony))
        )
    )
)