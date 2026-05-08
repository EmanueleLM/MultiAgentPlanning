(define (domain jack_of_all_trades)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (harmony)
    (pain ?o - obj)
    (craves ?x - obj ?y - obj)
  )

  ;; Attack action
  (:action attack
    :parameters (?x - obj)
    :precondition (and
      (province ?x)
      (planet ?x)
      (harmony)
    )
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
    )
  )

  ;; Succumb action
  (:action succumb
    :parameters (?x - obj)
    :precondition (and
      (pain ?x)
    )
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
    )
  )

  ;; Overcome action: overcome ?x ?y  (Overcome object from another object)
  (:action overcome
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (province ?y)
      (pain ?x)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain ?x))
    )
  )

  ;; Feast action: feast ?x ?y  (Feast object from another object)
  (:action feast
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (craves ?x ?y)
      (province ?x)
      (harmony)
    )
    :effect (and
      (pain ?x)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )
)