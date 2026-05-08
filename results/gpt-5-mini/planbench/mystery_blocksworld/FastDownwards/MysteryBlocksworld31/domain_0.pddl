(define (domain jack_of_all_trades)
  (:requirements :strips :typing)
  (:types object)
  (:predicates
    (province ?x - object)
    (planet ?x - object)
    (harmony)
    (pain ?x - object)
    (craves ?x ?y - object)
  )

  (:action attack
    :parameters (?x - object)
    :precondition (and
      (province ?x)
      (planet ?x)
      (harmony)
    )
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?x - object)
    :precondition (and
      (pain ?x)
    )
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
    )
  )

  (:action overcome
    :parameters (?x - object ?other - object)
    :precondition (and
      (province ?other)
      (pain ?x)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?other)
      (not (province ?other))
      (not (pain ?x))
    )
  )

  (:action feast
    :parameters (?x - object ?other - object)
    :precondition (and
      (craves ?x ?other)
      (province ?x)
      (harmony)
    )
    :effect (and
      (pain ?x)
      (province ?other)
      (not (craves ?x ?other))
      (not (province ?x))
      (not (harmony))
    )
  )
)