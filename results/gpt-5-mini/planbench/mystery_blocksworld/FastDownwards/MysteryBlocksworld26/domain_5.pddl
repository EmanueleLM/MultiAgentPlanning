(define (domain mystery_blocksworld26)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types object)

  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (craves ?x - object ?y - object)
    (harmony)
    (pain)
    (removed_province ?o - object)
    (removed_planet ?o - object)
  )

  ;; Attack: consumes a province and a planet and breaks harmony; produces pain.
  ;; Records which province and planet were removed so they can be restored only if
  ;; they were previously removed.
  (:action attack
    :parameters (?prov - object ?plt - object)
    :precondition (and
      (province ?prov)
      (planet ?plt)
      (harmony)
    )
    :effect (and
      (pain)
      (not (province ?prov))
      (not (planet ?plt))
      (not (harmony))
      (removed_province ?prov)
      (removed_planet ?plt)
    )
  )

  ;; Succumb: requires that pain is present and that specific province and planet
  ;; were previously removed. Restores those markers and harmony, and clears the removed marks.
  (:action succumb
    :parameters (?prov - object ?plt - object)
    :precondition (and
      (pain)
      (removed_province ?prov)
      (removed_planet ?plt)
    )
    :effect (and
      (harmony)
      (province ?prov)
      (planet ?plt)
      (not (pain))
      (not (removed_province ?prov))
      (not (removed_planet ?plt))
    )
  )

  ;; Overcome: when some other object holds a province and there is pain,
  ;; the subject gains a province and craves the other, harmony is restored,
  ;; and the other's province and the pain are removed (and recorded).
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
      (removed_province ?other)
    )
  )

  ;; Feast: an object feasts on another if it craves it, is a province, and harmony holds.
  ;; Feast produces pain, transfers province to the feasted-on object, and removes the craves relation and harmony.
  ;; The province removed from the feeder is recorded.
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
      (removed_province ?who)
    )
  )
)