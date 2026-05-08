(define (domain provinces-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (craves ?s - object ?o - object)
    (harmony)
    (pain)
  )

  ;; Modeling notes:
  ;; - Actions are prefixed with the agent role to keep models distinct.
  ;; - province and planet are unary predicates over objects.
  ;; - harmony and pain are 0-ary predicates (global facts).
  ;; - The model follows the human specification exactly:
  ;;   * Attack requires (province ?p), (planet ?pl), (harmony) and produces (pain)
  ;;     while deleting the province, planet and harmony facts named in the parameters.
  ;;   * Succumb requires (pain) and restores specified province and planet and harmony,
  ;;     deleting (pain).
  ;;   * Overcome requires that the second parameter be a province and that (pain) holds;
  ;;     it grants harmony and makes the first parameter a province and create a craves
  ;;     relation from the first to the second; it deletes the second's province and (pain).
  ;;   * Feast requires a craves relation (feaster -> prey), a province on the feaster,
  ;;     and harmony; it produces (pain) and makes the prey a province, while deleting
  ;;     the craves fact, the feaster's province, and harmony.
  ;; - The small explicit model avoids tokens/bookkeeping and encodes all structural
  ;;   constraints as preconditions/effects so invalid transitions are impossible.

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
    )
  )

  (:action succumber_succumb
    :parameters (?province-target - object ?planet-target - object)
    :precondition (and
      (pain)
    )
    :effect (and
      (harmony)
      (province ?province-target)
      (planet ?planet-target)
      (not (pain))
    )
  )

  (:action overcomer_overcome
    :parameters (?winner - object ?loser - object)
    :precondition (and
      (province ?loser)
      (pain)
      (not (= ?winner ?loser))
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
      (not (= ?feaster ?prey))
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