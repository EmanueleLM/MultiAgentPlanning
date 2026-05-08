(define (domain mysteryblocksworld16)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (harmony)
    (pain ?o - obj)
    (craves ?x - obj ?y - obj)
  )

  ;; attacker: attack an object that is both a province and a planet while harmony holds.
  ;; Result: that object becomes in pain; its province and planet flags and global harmony are removed.
  (:action attacker-attack
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

  ;; succumber: when an object is in pain, restore its province and planet flags and global harmony, remove its pain.
  (:action succumber-succumb
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

  ;; overcomer: when primary object ?x is in pain and some other object ?y is a province,
  ;; transfer province to ?x, produce harmony, make ?x crave ?y, and remove province from ?y and pain from ?x.
  (:action overcomer-overcome
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (pain ?x)
      (province ?y)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain ?x))
    )
  )

  ;; feaster: when primary object ?x craves ?y and ?x is a province while harmony holds,
  ;; convert that craving into pain on ?x, transfer province to ?y, and remove the craving, province of ?x and harmony.
  (:action feaster-feast
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