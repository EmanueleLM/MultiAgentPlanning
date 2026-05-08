(define (domain crave_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (pain ?o - obj)
    (craves ?x - obj ?y - obj)
    (harmony)
  )

  ;; Attack: requires Province(?x), Planet(?x), and Harmony.
  ;; Effects: Pain(?x); removes Province(?x), Planet(?x), and Harmony.
  (:action attacker-attack
    :parameters (?x - obj)
    :precondition (and (province ?x) (planet ?x) (harmony))
    :effect (and
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
      (pain ?x)
    )
  )

  ;; Succumb: requires Pain(?x).
  ;; Effects: restores Province(?x), Planet(?x), Harmony; removes Pain(?x).
  (:action succumb-succumb
    :parameters (?x - obj)
    :precondition (pain ?x)
    :effect (and
      (not (pain ?x))
      (province ?x)
      (planet ?x)
      (harmony)
    )
  )

  ;; Overcome: requires Pain(?x) and Province(?y) for a distinct other object y.
  ;; Effects: creates Harmony, gives Province to x, creates Craves(x,y), removes Province(y) and Pain(x).
  (:action overcomer-overcome
    :parameters (?x - obj ?y - obj)
    :precondition (and (pain ?x) (province ?y) (not (= ?x ?y)))
    :effect (and
      (not (pain ?x))
      (not (province ?y))
      (province ?x)
      (craves ?x ?y)
      (harmony)
    )
  )

  ;; Feast: requires Craves(?x,?y), Province(?x), and Harmony for distinct objects.
  ;; Effects: produces Pain(?x), gives Province to ?y, removes the craving, removes Province(?x) and Harmony.
  (:action feaster-feast
    :parameters (?x - obj ?y - obj)
    :precondition (and (craves ?x ?y) (province ?x) (harmony) (not (= ?x ?y)))
    :effect (and
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
      (pain ?x)
      (province ?y)
    )
  )
)