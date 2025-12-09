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

  ;; ATTACK: requires province, planet and harmony on the same object; consumes current stage and moves to successor
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

  ;; SUCCUMB: requires pain on the object; restores province, planet and harmony; consumes current stage and moves to successor
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

  ;; OVERCOME: requires pain on actor and province on other; gives actor province and a craving for other and restores harmony;
  ;; removes province from other and removes pain from actor; consumes current stage and moves to successor
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

  ;; FEAST: requires actor craves other, actor has province and harmony; actor becomes in pain, other becomes province;
  ;; removes the craving, actor's province and harmony; consumes current stage and moves to successor
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
      (pain ?actor)
      (province ?other)
      (not (craves ?actor ?other))
      (not (province ?actor))
      (not (harmony))
      (not (current ?s))
      (current ?s2)
    )
  )
)