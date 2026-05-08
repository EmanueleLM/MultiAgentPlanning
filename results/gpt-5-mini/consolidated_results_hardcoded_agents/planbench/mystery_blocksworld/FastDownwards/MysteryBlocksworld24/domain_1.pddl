(define (domain mysteryblocksworld24)
  (:requirements :strips :typing :negative-preconditions)
  (:types thing time)

  (:predicates
    (planet ?x - thing)
    (province ?x - thing)
    (harmony)
    (pain ?x - thing)
    (craves ?x - thing ?y - thing)

    ;; discrete stage progression
    (current ?t - time)
    (next ?t1 - time ?t2 - time)
  )

  ;; attacker: Attack action
  (:action attacker-attack
    :parameters (?t - time ?t2 - time ?x - thing)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (province ?x)
      (planet ?x)
      (harmony)
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

  ;; succumber: Succumb action
  (:action succumber-succumb
    :parameters (?t - time ?t2 - time ?x - thing)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (pain ?x)
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

  ;; overcomer: Overcome action
  (:action overcomer-overcome
    :parameters (?t - time ?t2 - time ?x - thing ?y - thing)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (province ?y)   ;; "Province other object"
      (pain ?x)       ;; "Pain object"
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

  ;; feaster: Feast action
  (:action feaster-feast
    :parameters (?t - time ?t2 - time ?x - thing ?y - thing)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (craves ?x ?y)  ;; Object Craves other object
      (province ?x)
      (harmony)
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