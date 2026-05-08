(define (domain mystery_blocksworld6)
  (:requirements :strips :typing :negative-preconditions)
  (:types item)

  (:predicates
    (province ?x - item)
    (planet ?x - item)
    (harmony)
    (pain ?x - item)
    (craves ?x - item ?y - item)
  )

  (:action attack
    :parameters (?x - item)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and
              (pain ?x)
              (not (province ?x))
              (not (planet ?x))
              (not (harmony))
            )
  )

  (:action succumb
    :parameters (?x - item)
    :precondition (and (pain ?x))
    :effect (and
              (province ?x)
              (planet ?x)
              (harmony)
              (not (pain ?x))
            )
  )

  (:action overcome
    :parameters (?x - item ?y - item)
    :precondition (and (province ?y) (pain ?x))
    :effect (and
              (harmony)
              (province ?x)
              (craves ?x ?y)
              (not (province ?y))
              (not (pain ?x))
            )
  )

  (:action feast
    :parameters (?x - item ?y - item)
    :precondition (and (craves ?x ?y) (province ?x) (harmony))
    :effect (and
              (pain ?x)
              (province ?y)
              (not (craves ?x ?y))
              (not (province ?x))
              (not (harmony))
            )
  )
)