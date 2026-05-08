(define (domain mystery_blocksworld26)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types object)

  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (craves ?x - object ?y - object)
    (harmony)
    (pain)
  )

  ;; Attack: consumes a province and a planet while breaking harmony, produces pain.
  (:action attack
    :parameters (?prov - object ?planet - object)
    :precondition (and
      (province ?prov)
      (planet ?planet)
      (harmony)
    )
    :effect (and
      (pain)
      (not (province ?prov))
      (not (planet ?planet))
      (not (harmony))
    )
  )

  ;; Succumb: when in pain, restore harmony and assign a province and a planet (chosen by parameters).
  (:action succumb
    :parameters (?prov - object ?planet - object)
    :precondition (and
      (pain)
    )
    :effect (and
      (harmony)
      (province ?prov)
      (planet ?planet)
      (not (pain))
    )
  )

  ;; Overcome: some ?x overcomes other ?y (must be distinct).
  ;; Requires that ?y currently holds a province and that pain holds.
  ;; Effects: restore harmony, assign province to ?x, create (craves ?x ?y), remove province from ?y and clear pain.
  (:action overcome
    :parameters (?x - object ?y - object)
    :precondition (and
      (province ?y)
      (pain)
      (not (= ?x ?y))
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain))
    )
  )

  ;; Feast: ?x feasts on ?y (distinct).
  ;; Requires that ?x craves ?y, ?x is a province, and harmony holds.
  ;; Effects: produce pain, transfer province to ?y, and remove the craves relation, the province on ?x, and harmony.
  (:action feast
    :parameters (?x - object ?y - object)
    :precondition (and
      (craves ?x ?y)
      (province ?x)
      (harmony)
      (not (= ?x ?y))
    )
    :effect (and
      (pain)
      (province ?y)
      (not (craves ?x ?y))
      (not (province ?x))
      (not (harmony))
    )
  )
)