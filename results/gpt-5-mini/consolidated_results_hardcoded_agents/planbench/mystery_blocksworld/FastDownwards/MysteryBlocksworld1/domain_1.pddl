(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)
  (:predicates
    (craves ?x - obj ?y - obj)
    (province ?x - obj)
    (planet ?x - obj)
    (harmony)
    (pain)
    (at-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Attack action: consumes a province and a planet (possibly different objects) and harmony, produces pain,
  ;; and advances the global stage.
  (:action attacker_attack
    :parameters (?p - obj ?pl - obj ?from - stage ?to - stage)
    :precondition (and
      (province ?p)
      (planet ?pl)
      (harmony)
      (at-stage ?from)
      (next ?from ?to)
    )
    :effect (and
      (pain)
      (not (province ?p))
      (not (planet ?pl))
      (not (harmony))
      (not (at-stage ?from))
      (at-stage ?to)
    )
  )

  ;; Succumb action: consumes pain and advances the stage; restores province, planet and harmony to a chosen object.
  (:action succumber_succumb
    :parameters (?x - obj ?from - stage ?to - stage)
    :precondition (and
      (pain)
      (at-stage ?from)
      (next ?from ?to)
    )
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain))
      (not (at-stage ?from))
      (at-stage ?to)
    )
  )

  ;; Overcome action: requires province on 'other' and pain; grants harmony, province to ?x and (craves ?x ?other),
  ;; removes the province from other and consumes pain; advances the stage.
  (:action overcomer_overcome
    :parameters (?x - obj ?other - obj ?from - stage ?to - stage)
    :precondition (and
      (province ?other)
      (pain)
      (at-stage ?from)
      (next ?from ?to)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?other)
      (not (province ?other))
      (not (pain))
      (not (at-stage ?from))
      (at-stage ?to)
    )
  )

  ;; Feast action: requires that ?x craves ?other and ?x has province and harmony;
  ;; produces pain and transfers province to other; removes the craves relation and harmony; advances the stage.
  (:action feaster_feast
    :parameters (?x - obj ?other - obj ?from - stage ?to - stage)
    :precondition (and
      (craves ?x ?other)
      (province ?x)
      (harmony)
      (at-stage ?from)
      (next ?from ?to)
    )
    :effect (and
      (pain)
      (province ?other)
      (not (craves ?x ?other))
      (not (province ?x))
      (not (harmony))
      (not (at-stage ?from))
      (at-stage ?to)
    )
  )
)