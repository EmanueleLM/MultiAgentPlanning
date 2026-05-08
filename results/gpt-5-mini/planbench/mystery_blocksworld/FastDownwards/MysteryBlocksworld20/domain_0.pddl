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
  ;; - Province and Planet are unary predicates on objects (Province(?o), Planet(?o)).
  ;; - Harmony and Pain are modeled as 0-ary fluents: (harmony), (pain).
  ;; - Succumb is parameterized to restore Province/Planet for specific objects.
  ;; - Distinctness is enforced using negative preconditions of the form (not (= ?x ?y)).
  ;;   This prevents self-targeting for Overcome and Feast while allowing Attack to target
  ;;   the same object for province and planet (the original spec allowed that).
  ;; - Effects are STRIPS-style: all adds and deletes apply at action completion.
  ;; - No bookkeeping or token constructs are used; all constraints are encoded as hard
  ;;   preconditions/effects so violating plans are impossible.

  (:action attack
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

  (:action succumb
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

  (:action overcome
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

  (:action feast
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