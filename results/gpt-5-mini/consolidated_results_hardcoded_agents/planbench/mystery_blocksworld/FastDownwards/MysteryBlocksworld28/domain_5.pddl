(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)
  (:predicates
    (province ?x - obj)
    (planet ?x - obj)
    (craves ?x ?y - obj)
    (pain ?x - obj)
    (harmony)
    (current ?t - stage)
    (succ ?t1 ?t2 - stage)
  )

  (:action attack
    :parameters (?x - obj ?t - stage ?t2 - stage)
    :precondition (and
      (province ?x)
      (planet ?x)
      (harmony)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?x))
      (not (harmony))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action succumb
    :parameters (?x - obj ?t - stage ?t2 - stage)
    :precondition (and
      (pain ?x)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (province ?x)
      (planet ?x)
      (harmony)
      (not (pain ?x))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action overcome
    :parameters (?x - obj ?y - obj ?t - stage ?t2 - stage)
    :precondition (and
      (province ?y)
      (pain ?x)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain ?x))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action feast
    :parameters (?x - obj ?y - obj ?t - stage ?t2 - stage)
    :precondition (and
      (craves ?x ?y)
      (province ?x)
      (harmony)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (pain ?x)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
      (not (current ?t))
      (current ?t2)
    )
  )
)