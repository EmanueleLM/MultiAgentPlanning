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

  ;; Note: to enforce that Succumb restores exactly the province/planet pair
  ;; removed by a prior Attack, attacker_attack records the pair using (attacked ?p ?pl).
  ;; Succumb requires that attacked pair to restore the same facts.
  ;; Attack is forbidden on the same object as both province and planet (requires distinct).
  ;; The model uses explicit structural predicates and does not rely on implicit bookkeeping.

  (:action attacker_attack
    :parameters (?province - object ?planet - object)
    :precondition (and
      (province ?province)
      (planet ?planet)
      (harmony)
      (not (= ?province ?planet))
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