(define (domain mysteryblocksworld29)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (province ?x - obj)
    (planet ?x - obj)
    (pain ?x - obj)
    (craves ?x - obj ?y - obj)
    (harmony)
  )

  (:action attack
    :parameters (?prov - obj ?pl - obj)
    :precondition (and
      (province ?prov)
      (planet ?pl)
      (harmony)
    )
    :effect (and
      (pain ?prov)
      (not (province ?prov))
      (not (planet ?pl))
      (not (harmony))
    )
  )

  (:action succumb
    :parameters (?o - obj)
    :precondition (and
      (pain ?o)
    )
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o))
    )
  )

  (:action overcome
    :parameters (?o - obj ?other - obj)
    :precondition (and
      (province ?other)
      (pain ?o)
    )
    :effect (and
      (harmony)
      (province ?o)
      (craves ?o ?other)
      (not (province ?other))
      (not (pain ?o))
    )
  )

  (:action feast
    :parameters (?o - obj ?other - obj)
    :precondition (and
      (craves ?o ?other)
      (province ?o)
      (harmony)
    )
    :effect (and
      (pain ?o)
      (province ?other)
      (not (craves ?o ?other))
      (not (province ?o))
      (not (harmony))
    )
  )
)