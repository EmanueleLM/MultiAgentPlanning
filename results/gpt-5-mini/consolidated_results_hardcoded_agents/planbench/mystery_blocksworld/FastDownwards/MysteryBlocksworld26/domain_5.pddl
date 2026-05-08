(define (domain provinces)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (craves ?x ?y - obj)
    (harmony)
    (pain)
    (current ?s - stage)
    (next ?s1 ?s2 - stage)
  )

  (:action attack_expert-attack
    :parameters (?prov - obj ?pl - obj ?s - stage ?s2 - stage)
    :precondition (and
      (province ?prov)
      (planet ?pl)
      (harmony)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (pain)
      (not (province ?prov))
      (not (planet ?pl))
      (not (harmony))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action attack_expert-succumb
    :parameters (?prov - obj ?pl - obj ?s - stage ?s2 - stage)
    :precondition (and
      (pain)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (province ?prov)
      (planet ?pl)
      (harmony)
      (not (pain))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action feast_expert-overcome
    :parameters (?x - obj ?other - obj ?s - stage ?s2 - stage)
    :precondition (and
      (province ?other)
      (pain)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?other)
      (not (province ?other))
      (not (pain))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action feast_expert-feast
    :parameters (?x - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
      (craves ?x ?y)
      (province ?x)
      (harmony)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (pain)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
      (not (current ?s))
      (current ?s2)
    )
  )
)