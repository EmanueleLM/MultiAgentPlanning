(define (domain craving-domain)
  :requirements :strips :typing :negative-preconditions
  :types obj stage
  :predicates
    (province ?x - obj)
    (planet ?x - obj)
    (craves ?x ?y - obj)
    (pain ?x - obj)
    (harmony)
    (distinct ?x ?y - obj)
    (current ?t - stage)
    (succ ?t1 ?t2 - stage)
  ;; Actions advance the explicit discrete time/stage token from a stage to its successor.
  ;; Each action consumes the current stage and produces its successor, enforcing contiguous
  ;; progression and preventing oscillating instantaneous re-use of deleted/added facts.
  (:action Attack
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

  (:action Succumb
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

  (:action Overcome
    :parameters (?x - obj ?y - obj ?t - stage ?t2 - stage)
    :precondition (and
      (province ?y)
      (pain ?x)
      (distinct ?x ?y)
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

  (:action Feast
    :parameters (?x - obj ?y - obj ?t - stage ?t2 - stage)
    :precondition (and
      (craves ?x ?y)
      (province ?x)
      (harmony)
      (distinct ?x ?y)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (pain ?y)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
      (not (current ?t))
      (current ?t2)
    )
  )
)