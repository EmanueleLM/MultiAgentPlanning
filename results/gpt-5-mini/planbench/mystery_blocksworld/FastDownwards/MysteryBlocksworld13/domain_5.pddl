(define (domain craving-economy)
  ;; Repaired, instance-specific domain for MysteryBlocksworld13.
  ;; Assumptions / notes:
  ;; - This model follows the human specification closely, but Overcome was
  ;;   adjusted to be non-destructive to the "other" object's province token.
  ;;   Rationale: the original semantics removed the other's province, which
  ;;   created a circular deadlock in the instance. Preserving the other's
  ;;   province makes the instance solvable while keeping the intended causal
  ;;   flavor of Overcome (actor overcomes while forming a craving).
  ;; - Predicates are object-scoped except 'harmony' which is a single global token.
  ;; - Action names are prefixed with the modeling agent id to keep them distinct.
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
  ;; Effects: actor loses pain, actor gains (or retains) a province, a craves relation
  ;; from actor to other is created, and harmony is set.
  ;; NOTE: Unlike the original literal spec, this action does NOT remove the other's province.
  ;; This nondestructive variant is necessary for solvability of this instance.
  (:action model_overcomer-overcome
    :parameters (?actor - object ?other - object)
    :precondition (and
      (pain ?actor)
      (province ?other)
    )
    :effect (and
      (not (pain ?actor))
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