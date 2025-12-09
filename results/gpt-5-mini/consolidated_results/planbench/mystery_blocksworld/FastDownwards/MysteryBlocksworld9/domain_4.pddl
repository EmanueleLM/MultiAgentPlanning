(define (domain mysteryblocksworld9)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (harmony)
    (pain)
    (craves ?src - obj ?tgt - obj)
    (attacked ?prov - obj ?pl - obj)
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  (:action attack
    :parameters (?prov - obj ?pl - obj ?s - stage ?s2 - stage)
    :precondition (and (province ?prov) (planet ?pl) (harmony) (current ?s) (next ?s ?s2))
    :effect (and
      (pain)
      (attacked ?prov ?pl)
      (not (province ?prov))
      (not (planet ?pl))
      (not (harmony))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action succumb
    :parameters (?prov - obj ?pl - obj ?s - stage ?s2 - stage)
    :precondition (and (pain) (attacked ?prov ?pl) (current ?s) (next ?s ?s2))
    :effect (and
      (province ?prov)
      (planet ?pl)
      (harmony)
      (not (pain))
      (not (attacked ?prov ?pl))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action overcome
    :parameters (?obj - obj ?other - obj ?s - stage ?s2 - stage)
    :precondition (and (province ?other) (pain) (current ?s) (next ?s ?s2))
    :effect (and
      (harmony)
      (province ?obj)
      (craves ?obj ?other)
      (not (province ?other))
      (not (pain))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action feast
    :parameters (?src - obj ?tgt - obj ?s - stage ?s2 - stage)
    :precondition (and (craves ?src ?tgt) (province ?src) (harmony) (current ?s) (next ?s ?s2))
    :effect (and
      (pain)
      (province ?tgt)
      (not (craves ?src ?tgt))
      (not (province ?src))
      (not (harmony))
      (not (current ?s))
      (current ?s2)
    )
  )
)