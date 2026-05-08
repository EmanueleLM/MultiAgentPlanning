(define (domain craving-economy)
  ;; Repaired, instance-specific domain for MysteryBlocksworld13.
  ;; Notes / assumptions (documented for the user):
  ;; - The original specification was ambiguous about whether Attack acts on the actor
  ;;   or on a distinct victim. To keep the model small and explicit for this instance
  ;;   we model Attack as a unary action that makes the acting object be in pain
  ;;   (it consumes that object's province and planet and global harmony).
  ;; - Feast and Overcome are binary and move/transfer province tokens and create pain/craving
  ;;   as in the specification. Succumb restores province/planet/harmony for the object that is in pain.
  ;; - Self-targeting is allowed (no different(...) predicate). If self-targeting is undesired,
  ;;   reintroduce inequality constraints in the problem instance.
  ;; - This domain uses only STRIPS + negative preconditions supported by FastDownwards.
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (province ?o - object)         ; object holds a Province token
    (planet ?o - object)           ; object holds a Planet token
    (pain ?o - object)             ; object is in pain
    (craves ?x - object ?y - object) ; object x craves object y
    (harmony)                      ; global harmony token
  )

  ;; Attack: actor consumes its own province+planet+harmony and becomes in pain.
  ;; Preconditions: actor must currently have province, planet and global harmony.
  ;; Effects: actor becomes in pain; actor loses province and planet; harmony removed.
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

  ;; Succumb: a pained object succumbs, restoring province, planet and harmony, removing pain.
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

  ;; Overcome: actor (in pain) overcomes another object that currently has a province.
  ;; Preconditions: actor must be in pain; other must have province.
  ;; Effects: creates harmony, gives province to actor, creates craves(actor,other),
  ;; and removes province from other and removes pain from actor.
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

  ;; Feast: actor that craves other and holds a province and while harmony exists
  ;; feasts on other: this removes the craving and the actor's province and harmony,
  ;; and makes the 'other' be in pain and receive a province.
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