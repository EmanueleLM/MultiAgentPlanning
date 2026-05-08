(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (province ?x - obj)
    (planet ?x - obj)
    (pain ?x - obj)
    (craves ?x ?y - obj)
    (harmony)
  )

  ;; attack: requires province, planet, and harmony on the same object
  ;; adds pain on that object; removes province, planet, and harmony
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

  ;; succumb: requires pain on the object
  ;; restores province, planet, and harmony; removes pain
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

  ;; overcome_from: primary ?x overcomes from ?y
  ;; requires province on ?y and pain on ?x
  ;; produces harmony, province on ?x, and craves(?x,?y)
  ;; removes province on ?y and pain on ?x
  (:action overcome_from
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

  ;; feast_from: ?x feasts from ?y
  ;; requires craves(?x,?y), province ?x, and harmony
  ;; produces pain on ?x and province on ?y
  ;; removes craves(?x,?y), province ?x, and harmony
  (:action feast_from
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