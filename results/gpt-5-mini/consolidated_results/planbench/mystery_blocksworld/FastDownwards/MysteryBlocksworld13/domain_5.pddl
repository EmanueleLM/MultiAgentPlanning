(define (domain crave_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (pain ?o - obj)
    (craves ?x - obj ?y - obj)
    (harmony)
    (at-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; attacker-attack: requires Province(x), Planet(x), and Harmony, and consumes a stage step.
  ;; Effects: sets Pain(x), removes Province(x), Planet(x), and Harmony; advances the stage.
  (:action attacker-attack
    :parameters (?x - obj ?s - stage ?snext - stage)
    :precondition (and
      (province ?x)
      (planet ?x)
      (harmony)
      (at-stage ?s)
      (succ ?s ?snext)
    )
    :effect (and
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
      (pain ?x)
      (not (at-stage ?s))
      (at-stage ?snext)
    )
  )

  ;; succumb-succumb: requires Pain(x) and consumes a stage step.
  ;; Effects: restores Province(x), Planet(x), Harmony; removes Pain(x); advances the stage.
  (:action succumb-succumb
    :parameters (?x - obj ?s - stage ?snext - stage)
    :precondition (and
      (pain ?x)
      (at-stage ?s)
      (succ ?s ?snext)
    )
    :effect (and
      (not (pain ?x))
      (province ?x)
      (planet ?x)
      (harmony)
      (not (at-stage ?s))
      (at-stage ?snext)
    )
  )

  ;; overcomer-overcome: requires Pain(x) and Province(y) for another object y, and consumes a stage step.
  ;; Effects: creates Harmony, sets Province(x), creates Craves(x,y); removes Province(y) and Pain(x); advances the stage.
  (:action overcomer-overcome
    :parameters (?x - obj ?y - obj ?s - stage ?snext - stage)
    :precondition (and
      (pain ?x)
      (province ?y)
      (at-stage ?s)
      (succ ?s ?snext)
      (not (= ?x ?y))
    )
    :effect (and
      (not (pain ?x))
      (not (province ?y))
      (province ?x)
      (craves ?x ?y)
      (harmony)
      (not (at-stage ?s))
      (at-stage ?snext)
    )
  )

  ;; feaster-feast: requires Craves(x,y), Province(x), and Harmony, and consumes a stage step.
  ;; Effects: produces Pain(x), gives Province(y), removes the craving, removes Province(x) and Harmony; advances the stage.
  (:action feaster-feast
    :parameters (?x - obj ?y - obj ?s - stage ?snext - stage)
    :precondition (and
      (craves ?x ?y)
      (province ?x)
      (harmony)
      (at-stage ?s)
      (succ ?s ?snext)
      (not (= ?x ?y))
    )
    :effect (and
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
      (pain ?x)
      (province ?y)
      (not (at-stage ?s))
      (at-stage ?snext)
    )
  )
)