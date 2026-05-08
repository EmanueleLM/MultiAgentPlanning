(define (domain craving-economy)
  ;; Repaired, instance-specific domain for MysteryBlocksworld13.
  ;; Notes / assumptions (documented for the user):
  ;; - Actions and predicates follow the human specification exactly.
  ;; - province and planet are boolean tokens that objects may hold.
  ;; - harmony is a single global token (zero-ary predicate).
  ;; - craves is a binary relation between objects.
  ;; - The instance encoded in the problem is inconsistent / likely infeasible
  ;;   under these semantics (planner will report no plan). We preserve the
  ;;   original causal semantics rather than changing resources to force
  ;;   solvability.
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (province ?o - object)           ; object holds a Province token
    (planet ?o - object)             ; object holds a Planet token
    (pain ?o - object)               ; object is in pain
    (craves ?x - object ?y - object) ; object x craves object y
    (harmony)                        ; global harmony token
  )

  ;; Attack: consumes province, planet and the global harmony for the actor,
  ;; and makes the actor be in pain.
  (:action model_attacker-attack
    :parameters (?actor - object)
    :precondition (and
      (province ?actor)
      (planet ?actor)
      (harmony)
    )
    :effect (and
      (not (province ?actor))
      (not (planet ?actor))
      (not (harmony))
      (pain ?actor)
    )
  )

  ;; Succumb: a pained object succumbs, removing pain and restoring
  ;; province, planet and harmony to that same object.
  (:action model_succumb-succumb
    :parameters (?obj - object)
    :precondition (and
      (pain ?obj)
    )
    :effect (and
      (not (pain ?obj))
      (province ?obj)
      (planet ?obj)
      (harmony)
    )
  )

  ;; Overcome: an actor in pain overcomes another object that currently has a province.
  ;; Effects: actor loses pain, actor gains the other's province, the other loses its province,
  ;; a craves relation from actor to other is created, and harmony is set.
  (:action model_overcomer-overcome
    :parameters (?actor - object ?other - object)
    :precondition (and
      (pain ?actor)
      (province ?other)
    )
    :effect (and
      (not (pain ?actor))
      (not (province ?other))
      (province ?actor)
      (craves ?actor ?other)
      (harmony)
    )
  )

  ;; Feast: an actor that currently craves another and holds a province while harmony exists
  ;; feasts on the other. This removes the craving and the actor's province and harmony,
  ;; and makes the other object be in pain and receive a province.
  (:action model_feaster-feast
    :parameters (?actor - object ?other - object)
    :precondition (and
      (craves ?actor ?other)
      (province ?actor)
      (harmony)
    )
    :effect (and
      (not (craves ?actor ?other))
      (not (province ?actor))
      (not (harmony))
      (pain ?other)
      (province ?other)
    )
  )
)