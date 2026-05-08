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

  ;; Attack consumes a province and a planet and breaks harmony; produces pain.
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

  ;; Succumb requires pain and restores harmony while assigning a province and a planet.
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

  ;; Overcome: when some OTHER object holds a province and there is pain,
  ;; the subject gains a province and craves the other, harmony is restored,
  ;; and the other's province and the pain are removed.
  (:action overcome
    :parameters (?obj - object ?other - object)
    :precondition (and
      (province ?other)
      (pain)
      (not (= ?obj ?other))
    )
    :effect (and
      (harmony)
      (province ?obj)
      (craves ?obj ?other)
      (not (province ?other))
      (not (pain))
    )
  )

  ;; Feast: an object feasts on another if it craves it, is a province, and harmony holds.
  ;; Feast produces pain, transfers province to the feasted-on object, and removes the craves relation and harmony.
  (:action feast
    :parameters (?who - object ?whom - object)
    :precondition (and
      (craves ?who ?whom)
      (province ?who)
      (harmony)
      (not (= ?who ?whom))
    )
    :effect (and
      (pain)
      (province ?whom)
      (not (craves ?who ?whom))
      (not (province ?who))
      (not (harmony))
    )
  )
)