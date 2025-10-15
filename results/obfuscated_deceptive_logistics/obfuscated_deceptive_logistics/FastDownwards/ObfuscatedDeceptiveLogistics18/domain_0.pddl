; Domain: orchestrator-domain
; Modeling assumptions:
; - Agent actions are prefixed with "player_" to keep them distinct.
; - All domain objects share a single type "obj".
; - All atomic relations mentioned in the brief are modeled as binary predicates over objects:
;   hand, cats, texture, vase, next, sneeze, stupendous, collect, spring.
; - The use-case text describing exact conditional effects and richer arities was not provided.
;   To produce a FastDownward-compatible STRIPS domain (no conditional effects, no fluents),
;   we conservatively model each predicate as binary and each action with deterministic effects.
; - Preconditions and effects below are minimal, conservative encodings chosen so each action
;   mentions a small, reasonable precondition (one binary predicate involving the first two params)
;   and produces a single binary effect involving the second and third parameters (or second and fourth
;   for wretched). These choices are documented per-action.
; - If the original specification implied different arities or conditional effects, those are
;   unresolved ambiguities and noted in the action comments.
; Requirements: only typing supported by Fast Downward is used.
(define (domain orchestrator-domain)
  (:requirements :typing)
  (:types obj)

  (:predicates
    (hand ?x - obj ?y - obj)
    (cats ?x - obj ?y - obj)
    (texture ?x - obj ?y - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj ?y - obj)
    (stupendous ?x - obj ?y - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj ?y - obj)
  )

  ; Action: paltry object_A object_B object_C
  ; Assumption: paltry requires (hand A B) and as effect establishes (collect B C).
  ; Ambiguity: original conditional effects or alternative arities for "hand"/"collect" not supplied.
  (:action player_paltry
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (hand ?a ?b)
    :effect (and
      (collect ?b ?c)
    )
  )

  ; Action: sip object_A object_B object_C
  ; Assumption: sip requires (vase A B) and produces (sneeze B C).
  ; Ambiguity: could have been conditional on "texture" or other predicates; not provided.
  (:action player_sip
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (vase ?a ?b)
    :effect (and
      (sneeze ?b ?c)
    )
  )

  ; Action: clip object_A object_B object_C
  ; Assumption: clip requires (next A B) and adds (spring B C).
  ; Ambiguity: original description of "clip" effects missing; this is a conservative mapping.
  (:action player_clip
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (next ?a ?b)
    :effect (and
      (spring ?b ?c)
    )
  )

  ; Action: wretched object_A object_B object_C object_D
  ; Assumption: wretched requires (cats A B) and produces (texture C D).
  ; Rationale: this action has four params in original signature; we use first two as precondition
  ; and last two as effect arguments to remain conservative and STRIPS-compliant.
  (:action player_wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj)
    :precondition (cats ?a ?b)
    :effect (and
      (texture ?c ?d)
    )
  )

  ; Action: memory object_A object_B object_C
  ; Assumption: memory requires (texture A B) and produces (stupendous B C).
  ; Ambiguity: original may have conditional effects referencing other predicates.
  (:action player_memory
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (texture ?a ?b)
    :effect (and
      (stupendous ?b ?c)
    )
  )

  ; Action: tightfisted object_A object_B object_C
  ; Assumption: tightfisted requires (collect A B) and produces (hand B C).
  ; Rationale: makes tightfisted a "chain" action that can feed paltry-like preconditions.
  (:action player_tightfisted
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (collect ?a ?b)
    :effect (and
      (hand ?b ?c)
    )
  )

)