(define (domain mystery_blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (pain ?o - object)
    (harmony)
    (craves ?s - object ?t - object)
    (different ?x - object ?y - object)
  )

  ;; Attack action (striker)
  (:action striker-attack
    :parameters (?attacker - object ?target - object)
    :precondition (and
      (province ?attacker)
      (planet ?target)
      (harmony)
      (different ?attacker ?target)
    )
    :effect (and
      (pain ?target)
      (not (province ?attacker))
      (not (planet ?target))
      (not (harmony))
    )
  )

  ;; Succumb action (relish)
  (:action relish-succumb
    :parameters (?o - object)
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

  ;; Overcome action (overcomer)
  (:action overcomer-overcome
    :parameters (?subject - object ?other - object)
    :precondition (and
      (province ?other)
      (pain ?subject)
      (different ?subject ?other)
    )
    :effect (and
      (harmony)
      (province ?subject)
      (craves ?subject ?other)
      (not (province ?other))
      (not (pain ?subject))
    )
  )

  ;; Feast action (overcomer)
  (:action overcomer-feast
    :parameters (?subject - object ?other - object)
    :precondition (and
      (craves ?subject ?other)
      (province ?subject)
      (harmony)
      (different ?subject ?other)
    )
    :effect (and
      (pain ?subject)
      (province ?other)
      (not (craves ?subject ?other))
      (not (province ?subject))
      (not (harmony))
    )
  )
)