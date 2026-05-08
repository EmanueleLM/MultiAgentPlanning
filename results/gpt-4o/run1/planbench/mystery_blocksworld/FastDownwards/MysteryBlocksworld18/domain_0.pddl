(define (domain jack_of_all_trades)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        object_type
    )
    (:predicates
        (province ?x - object_type)
        (planet ?x - object_type)
        (harmony)
        (pain ?x - object_type)
        (object_craves ?x - object_type ?y - object_type)
    )

    (:action attack
        :parameters (?x - object_type)
        :precondition (and (province ?x) (planet ?x) (harmony))
        :effect (and (not (province ?x)) (not (planet ?x)) (not (harmony)) (pain ?x))
    )

    (:action succumb
        :parameters (?x - object_type)
        :precondition (pain ?x)
        :effect (and (not (pain ?x)) (province ?x) (planet ?x) (harmony))
    )

    (:action overcome
        :parameters (?x - object_type ?y - object_type)
        :precondition (and (province ?y) (pain ?x))
        :effect (and (not (province ?y)) (not (pain ?x)) (harmony) (province ?x) (object_craves ?x ?y))
    )

    (:action feast
        :parameters (?x - object_type ?y - object_type)
        :precondition (and (object_craves ?x ?y) (province ?x) (harmony))
        :effect (and (not (object_craves ?x ?y)) (not (province ?x)) (not (harmony)) (pain ?x) (province ?y))
    )
)