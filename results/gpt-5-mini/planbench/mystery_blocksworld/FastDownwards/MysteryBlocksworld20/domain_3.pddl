(define (domain provinces-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (craves ?s - object ?o - object)
    (harmony)
    (pain)
    ;; records which province/planet pair was removed by the last attack
    (attacked ?p - object ?pl - object)
  )

  ;;; Modeling notes:
  ;;; - Attack removes a specific (province, planet) pair; we record that pair with (attacked p pl)
  ;;;   so that Succumb can restore exactly that pair. This makes the restore operation
  ;;;   explicit and prevents implicit nondeterministic restoration.
  ;;; - Succumb requires a prior Attack (attacked) and current pain to restore the same pair.
  ;;; - Overcome grants a province to the winner and causes the winner to crave the loser,
  ;;;   consuming the prior province of the loser and clearing pain/harmony appropriately.
  ;;; - Feast consumes a craving while toggling province/harmony/pain as specified.
  ;;; These choices follow the human specification while keeping the model explicit and structural.

  (:action attacker_attack
    :parameters (?province - object ?planet - object)
    :precondition (and
      (province ?province)
      (planet ?planet)
      (harmony)
    )
    :effect (and
      (pain)
      (not (province ?province))
      (not (planet ?planet))
      (not (harmony))
      (attacked ?province ?planet)
    )
  )

  (:action succumber_succumb
    :parameters (?province-target - object ?planet-target - object)
    :precondition (and
      (pain)
      (attacked ?province-target ?planet-target)
    )
    :effect (and
      (harmony)
      (province ?province-target)
      (planet ?planet-target)
      (not (pain))
      (not (attacked ?province-target ?planet-target))
    )
  )

  (:action overcomer_overcome
    :parameters (?winner - object ?loser - object)
    :precondition (and
      (province ?loser)
      (pain)
    )
    :effect (and
      (harmony)
      (province ?winner)
      (craves ?winner ?loser)
      (not (province ?loser))
      (not (pain))
    )
  )

  (:action feaster_feast
    :parameters (?feaster - object ?prey - object)
    :precondition (and
      (craves ?feaster ?prey)
      (province ?feaster)
      (harmony)
    )
    :effect (and
      (pain)
      (province ?prey)
      (not (craves ?feaster ?prey))
      (not (province ?feaster))
      (not (harmony))
    )
  )
)