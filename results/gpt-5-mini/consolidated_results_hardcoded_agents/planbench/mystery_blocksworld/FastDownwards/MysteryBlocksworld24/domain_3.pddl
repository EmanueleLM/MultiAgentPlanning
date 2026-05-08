(define (domain mysteryblocksworld24)
  (:requirements :strips :typing :negative-preconditions)
  (:types object time)

  (:predicates
    (planet ?x - object)
    (province ?x - object)
    (harmony)
    (pain ?x - object)
    (craves ?x - object ?y - object)
    (distinct ?x - object ?y - object)

    (current ?t - time)
    (next ?t1 - time ?t2 - time)
  )

  (:action attacker-attack
    :parameters (?t - time ?t2 - time ?x - object)
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

  (:action succumber-succumb
    :parameters (?t - time ?t2 - time ?x - object)
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

  (:action overcomer-overcome
    :parameters (?t - time ?t2 - time ?x - object ?y - object)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (province ?y)
      (pain ?x)
      (distinct ?x ?y)
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

  (:action feaster-feast
    :parameters (?t - time ?t2 - time ?x - object ?y - object)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (craves ?x ?y)
      (province ?x)
      (harmony)
      (distinct ?x ?y)
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