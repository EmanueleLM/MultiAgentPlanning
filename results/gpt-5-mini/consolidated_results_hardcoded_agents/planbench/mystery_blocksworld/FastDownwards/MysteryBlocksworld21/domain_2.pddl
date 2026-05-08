(define (domain orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)
  (:predicates
    (province ?x - object)
    (planet ?x - object)
    (craves ?x - object ?y - object)
    (pain ?x - object)
    (harmony)
    (current ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  ;; ATTACK: consumes the current stage and moves to the successor stage
  (:action attack
    :parameters (?o - object ?s - stage ?s2 - stage)
    :precondition (and
      (province ?o)
      (planet ?o)
      (harmony)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (pain ?o)
      (not (province ?o))
      (not (planet ?o))
      (not (harmony))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; SUCCUMB: consumes the current stage and moves to the successor stage
  (:action succumb
    :parameters (?o - object ?s - stage ?s2 - stage)
    :precondition (and
      (pain ?o)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (province ?o)
      (planet ?o)
      (harmony)
      (not (pain ?o))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; OVERCOME: consumes the current stage and moves to the successor stage
  (:action overcome
    :parameters (?actor - object ?other - object ?s - stage ?s2 - stage)
    :precondition (and
      (pain ?actor)
      (province ?other)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (harmony)
      (province ?actor)
      (craves ?actor ?other)
      (not (pain ?actor))
      (not (province ?other))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; FEAST: consumes the current stage and moves to the successor stage
  (:action feast
    :parameters (?actor - object ?other - object ?s - stage ?s2 - stage)
    :precondition (and
      (craves ?actor ?other)
      (province ?actor)
      (harmony)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (pain ?other)
      (province ?other)
      (not (craves ?actor ?other))
      (not (province ?actor))
      (not (harmony))
      (not (current ?s))
      (current ?s2)
    )
  )
)