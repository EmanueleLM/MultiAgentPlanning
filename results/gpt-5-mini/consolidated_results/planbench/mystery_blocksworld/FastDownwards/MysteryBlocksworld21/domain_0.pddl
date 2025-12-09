(define (domain orchestrator)
  (:requirements :strips :typing)
  (:types object)
  (:predicates
    (province ?x - object)
    (planet ?x - object)
    (craves ?x - object ?y - object)
    (pain ?x - object)
    (harmony)
    (attacked-province ?x - object)
    (attacked-planet ?x - object)
  )

  ;; ATTACK-PROVINCE
  (:action attack-province
    :parameters (?o - object)
    :precondition (and
      (province ?o)
      (harmony)
    )
    :effect (and
      (pain ?o)
      (attacked-province ?o)
      (not (province ?o))
      (not (harmony))
    )
  )

  ;; ATTACK-PLANET
  (:action attack-planet
    :parameters (?o - object)
    :precondition (and
      (planet ?o)
      (harmony)
    )
    :effect (and
      (pain ?o)
      (attacked-planet ?o)
      (not (planet ?o))
      (not (harmony))
    )
  )

  ;; SUCCUMB-PROVINCE
  (:action succumb-province
    :parameters (?o - object)
    :precondition (and
      (pain ?o)
      (attacked-province ?o)
    )
    :effect (and
      (province ?o)
      (harmony)
      (not (pain ?o))
      (not (attacked-province ?o))
    )
  )

  ;; SUCCUMB-PLANET
  (:action succumb-planet
    :parameters (?o - object)
    :precondition (and
      (pain ?o)
      (attacked-planet ?o)
    )
    :effect (and
      (planet ?o)
      (harmony)
      (not (pain ?o))
      (not (attacked-planet ?o))
    )
  )

  ;; OVERCOME
  (:action overcome
    :parameters (?actor - object ?other - object)
    :precondition (and
      (pain ?actor)
      (province ?other)
    )
    :effect (and
      (harmony)
      (province ?actor)
      (craves ?actor ?other)
      (not (pain ?actor))
      (not (province ?other))
    )
  )

  ;; FEAST
  (:action feast
    :parameters (?actor - object ?other - object)
    :precondition (and
      (craves ?actor ?other)
      (province ?actor)
      (harmony)
    )
    :effect (and
      (pain ?other)
      (province ?other)
      (not (craves ?actor ?other))
      (not (province ?actor))
      (not (harmony))
    )
  )
)