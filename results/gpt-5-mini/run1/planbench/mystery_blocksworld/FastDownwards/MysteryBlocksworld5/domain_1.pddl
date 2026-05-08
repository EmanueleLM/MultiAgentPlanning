(define (domain mystery_blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (province ?o - obj)        ;; object holds a province
    (planet ?o - obj)          ;; object is a planet
    (harmony)                  ;; global harmony flag
    (pain ?o - obj)            ;; object is in pain
    (craves ?a - obj ?b - obj) ;; a craves b
  )

  ;; Attack action: attack ?x using ?y as the planet reference.
  ;; Preconditions: ?x has province, ?y is a planet, and harmony holds.
  ;; Effects: ?x becomes in pain; remove province from ?x, remove planet status from ?y, remove harmony.
  (:action attack
    :parameters (?x - obj ?y - obj)
    :precondition (and
      (province ?x)
      (planet ?y)
      (harmony)
    )
    :effect (and
      (pain ?x)
      (not (province ?x))
      (not (planet ?y))
      (not (harmony))
    )
  )

  ;; Succumb action: the object succumbs to pain.
  ;; Preconditions: the object is in pain.
  ;; Effects: restore province and planet to the same object and restore harmony; remove pain.
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

  ;; Overcome action: ?x overcomes with respect to other object ?y.
  ;; Preconditions: ?y currently has a province, and ?x is in pain.
  ;; Effects: set harmony, give province to ?x, create craves(?x,?y); remove province from ?y and remove pain from ?x.
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

  ;; Feast action: ?x feasts on its craving of ?y.
  ;; Preconditions: ?x craves ?y, ?x has a province, and harmony holds.
  ;; Effects: ?x gains pain, ?y gains a province; remove the craving from ?x to ?y, remove province from ?x, remove harmony.
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