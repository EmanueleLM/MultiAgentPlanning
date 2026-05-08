; Domain: Corrected, parameterized actions with provenance and global Harmony.
; Assumptions (made explicit):
; - Objects: a, b, c, d (type obj).
; - Province(obj), Planet(obj), Pain(obj), Craves(subject,target) are per-object boolean predicates.
; - Harmony is a single global boolean expressed by the 0-arity predicate (harmony).
; - Pain tokens are bound to the actor that generated them (no global Pain pool).
; - Succumb restores only the same actor's Province and Planet and only if those tokens are currently absent.
; - Actions that add Harmony require Harmony to be currently false so no duplication occurs; actions that require Harmony require it to be true.
; - Duplicate creation of Province/Planet/Pain/Craves is prevented by preconditions that require the relevant predicate to be absent when an action would add it.
; - Action names are prefixed with the model/agent name to keep agent-provided actions distinct.
; - All actions are atomic (preconditions must hold at start; effects are applied as a single update).
; Note: These assumptions follow the auditor's clarifications and are encoded as preconditions/effects below.

(define (domain craving-transfer)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (province ?o - obj)
    (planet ?o - obj)
    (pain ?o - obj)
    (craves ?s - obj ?t - obj)
    (harmony)  ; global singleton boolean
  )

  ; model_attacker: Attack(actor)
  ; Pre: Province(actor) AND Planet(actor) AND Harmony AND actor currently not in Pain
  ; Effects: remove Province(actor), remove Planet(actor), remove Harmony; add Pain(actor)
  (:action model_attacker_attack
    :parameters (?actor - obj)
    :precondition (and
                    (province ?actor)
                    (planet ?actor)
                    (harmony)
                    (not (pain ?actor))
                  )
    :effect (and
              (not (province ?actor))
              (not (planet ?actor))
              (not (harmony))
              (pain ?actor)
            )
  )

  ; model_succumb: Succumb(actor)
  ; Pre: Pain(actor) AND Harmony is currently false
  ; Also require Province/Planet for actor to be absent to avoid duplicating tokens
  ; Effects: remove Pain(actor); add Province(actor), Planet(actor), Harmony
  (:action model_succumb_succumb
    :parameters (?actor - obj)
    :precondition (and
                    (pain ?actor)
                    (not (harmony))
                    (not (province ?actor))
                    (not (planet ?actor))
                  )
    :effect (and
              (not (pain ?actor))
              (province ?actor)
              (planet ?actor)
              (harmony)
            )
  )

  ; model_overcomer: Overcome(actor,target)
  ; Pre: Pain(actor) AND Province(target) AND Harmony currently false AND actor must not already have a Province
  ; Effects: remove Pain(actor), remove Province(target); add Province(actor), add Craves(actor,target), add Harmony
  (:action model_overcomer_overcome
    :parameters (?actor - obj ?target - obj)
    :precondition (and
                    (pain ?actor)
                    (province ?target)
                    (not (harmony))
                    (not (province ?actor))
                  )
    :effect (and
              (not (pain ?actor))
              (not (province ?target))
              (province ?actor)
              (craves ?actor ?target)
              (harmony)
            )
  )

  ; model_feaster: Feast(actor,target)
  ; Pre: Craves(actor,target) AND Province(actor) AND Harmony AND actor not already in Pain AND target must not already have a Province
  ; Effects: remove Craves(actor,target), remove Province(actor), remove Harmony; add Pain(actor), add Province(target)
  (:action model_feaster_feast
    :parameters (?actor - obj ?target - obj)
    :precondition (and
                    (craves ?actor ?target)
                    (province ?actor)
                    (harmony)
                    (not (pain ?actor))
                    (not (province ?target))
                  )
    :effect (and
              (not (craves ?actor ?target))
              (not (province ?actor))
              (not (harmony))
              (pain ?actor)
              (province ?target)
            )
  )
)