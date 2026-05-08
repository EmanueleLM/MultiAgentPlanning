(define (domain craving-economy)
  ; Requirements: limited to features supported by Fast Downwards per instructions.
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  ; Predicates (all fluents explicitly parameterized except Harmony which is single global token)
  (:predicates
    (province ?o - object)        ; object ?o currently holds a Province token
    (planet ?o - object)          ; object ?o currently holds a Planet token
    (pain ?o - object)            ; object ?o is in pain
    (craves ?x - object ?y - object) ; object ?x craves object ?y
    (harmony)                     ; global Harmony token (single boolean)
    (different ?x - object ?y - object) ; explicit inequality relation between distinct objects
  )

  ; Assumptions and invariants (documented here as comments per auditor instructions):
  ; - All fluents are object-scoped and unambiguous: province(x), planet(x), pain(x), craves(x,y).
  ; - different(x,y) is provided in the problem for every ordered pair of distinct objects to
  ;   enforce actor != other constraints. Actions require different(...) where actor and other must differ.
  ; - Harmony is a single global boolean token modeled by predicate (harmony).
  ; - Atomicity: each action's effects are applied atomically by PDDL semantics; transfers remove the source
  ;   token and add the destination token in the same action effect to avoid duplication.
  ; - Conservation semantics are encoded only by the explicit action effects. Succumb and Attack are the
  ;   explicit creators/destroyers of Province and Planet tokens per the spec; Overcome and Feast transfer Province
  ;   between objects atomically. The model assumes these are the only ways Province/Planet tokens change.
  ; - No action permits self-targeting; this is enforced by requiring (different ?actor ?other).
  ; - Succumb and Overcome may only be executed by the object in pain that meets the preconditions.
  ; - No additional external producers/consumers of tokens exist beyond the defined actions and initial state.

  ; Action: attacker-attack(actor, victim)
  ; Preconditions: Province(victim), Planet(victim), Harmony, actor != victim
  ; Effects: remove Province(victim), remove Planet(victim), remove Harmony, add Pain(victim)
  (:action model_attacker-attack
    :parameters (?actor - object ?victim - object)
    :precondition (and
      (province ?victim)
      (planet ?victim)
      (harmony)
      (different ?actor ?victim)
    )
    :effect (and
      (not (province ?victim))
      (not (planet ?victim))
      (not (harmony))
      (pain ?victim)
    )
  )

  ; Action: succumb-succumb(victim)
  ; Preconditions: Pain(victim)
  ; Effects: remove Pain(victim), add Province(victim), add Planet(victim), add Harmony
  (:action model_succumb-succumb
    :parameters (?victim - object)
    :precondition (and
      (pain ?victim)
    )
    :effect (and
      (not (pain ?victim))
      (province ?victim)
      (planet ?victim)
      (harmony)
    )
  )

  ; Action: overcomer-overcome(actor, other)
  ; Preconditions: Pain(actor), Province(other), actor != other
  ; Effects: remove Pain(actor), remove Province(other), add Province(actor), add Craves(actor,other), add Harmony
  (:action model_overcomer-overcome
    :parameters (?actor - object ?other - object)
    :precondition (and
      (pain ?actor)
      (province ?other)
      (different ?actor ?other)
    )
    :effect (and
      (not (pain ?actor))
      (not (province ?other))
      (province ?actor)
      (craves ?actor ?other)
      (harmony)
    )
  )

  ; Action: feaster-feast(actor, other)
  ; Preconditions: Craves(actor,other), Province(actor), Harmony, actor != other
  ; Effects: remove Craves(actor,other), remove Province(actor), remove Harmony, add Pain(other), add Province(other)
  (:action model_feaster-feast
    :parameters (?actor - object ?other - object)
    :precondition (and
      (craves ?actor ?other)
      (province ?actor)
      (harmony)
      (different ?actor ?other)
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