(define (domain provinces-plan)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (province ?o - object)
    (planet ?o - object)
    (craves ?x - object ?y - object)
    (harmony)
    (pain)
    ;; explicit inequality predicate to enforce "other" / distinctness constraints
    (different ?x - object ?y - object)
  )

  ;; Attack consumes a named Province and a named Planet and Harmony, producing Pain.
  (:action attack
    :parameters (?prov - object ?planet - object)
    :precondition (and
      (province ?prov)
      (planet ?planet)
      (harmony)
      (different ?prov ?planet)
    )
    :effect (and
      (pain)
      (not (province ?prov))
      (not (planet ?planet))
      (not (harmony))
    )
  )

  ;; Succumb_Restore is the parameterized inverse of Attack: given Pain,
  ;; it restores the named Province and Planet and Harmony.
  (:action succumb-restore
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

  ;; Feast: subject x feasts on y; requires Craves(x,y), Province(x), Harmony.
  ;; Produces Pain and transfers Province to y, removes Craves(x,y).
  ;; Enforce x != y with (different ?x ?y).
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

  ;; Overcome: subject x overcomes other y; requires Province(y) and Pain.
  ;; Produces Harmony, Province(x), and Craves(x,y); removes Province(y) and Pain.
  ;; Enforce x != y with (different ?x ?y).
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
)