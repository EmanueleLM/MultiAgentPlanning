(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (province ?x - object)
    (planet ?x - object)
    (pain ?x - object)
    (craves ?x ?y - object)
    (harmony)
  )

  (:action attack
    :parameters (?x - object)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?x - object)
    :precondition (and (pain ?x))
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
    )
  )

  (:action overcome
    :parameters (?actor - object ?other - object)
    :precondition (and (province ?other) (pain ?actor))
    :effect (and
      (harmony)
      (province ?actor)
      (craves ?actor ?other)
      (not (province ?other))
      (not (pain ?actor))
    )
  )

  (:action feast
    :parameters (?actor - object ?other - object)
    :precondition (and (craves ?actor ?other) (province ?actor) (harmony))
    :effect (and
      (pain ?actor)
      (province ?other)
      (not (craves ?actor ?other))
      (not (province ?actor))
      (not (harmony))
    )
  )
)