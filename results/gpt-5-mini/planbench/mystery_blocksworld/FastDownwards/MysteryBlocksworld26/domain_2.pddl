(define (domain mystery_blocksworld26)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (craves ?x - object ?y - object)
    (harmony)
    (pain)
    ;; explicit distinctness predicate to model "other" constraints
    (different ?x - object ?y - object)
  )

  ;; Attack: requires a province (some object), a planet (some object), and harmony.
  ;; Effects: produces pain and removes the specified province and planet and harmony.
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

  ;; Succumb: requires pain. Restores a chosen province and planet and harmony; clears pain.
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

  ;; Overcome: subject ?x overcomes other ?y.
  ;; Requires that ?y currently holds a province and that pain is true.
  ;; Effects: set harmony, give province to ?x, create (craves ?x ?y), remove province from ?y and clear pain.
  (:action overcome
    :parameters (?x - object ?y - object)
    :precondition (and
      (province ?y)
      (pain)
      (different ?x ?y)
    )
    :effect (and
      (harmony)
      (province ?x)
      (craves ?x ?y)
      (not (province ?y))
      (not (pain))
    )
  )

  ;; Feast: subject ?x feasts on ?y.
  ;; Requires (craves ?x ?y), ?x being a province, and harmony.
  ;; Effects: produces pain, transfers province to ?y, and removes the craves, the province on ?x, and harmony.
  (:action feast
    :parameters (?x - object ?y - object)
    :precondition (and
      (craves ?x ?y)
      (province ?x)
      (harmony)
      (different ?x ?y)
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