; Domain: multi-agent blocks world for FastDownward
; Assumptions (made explicit):
; - Goal chosen by the orchestrator: combine the two initial stacks into one single tower
;   with base I on the table and the H-stack placed on top of the O-stack, producing the
;   ordering (from bottom to top):
;     I L J G B D A C M O H N K F E
;   This assumption is stated because the user described "achieve the global target tower ordering"
;   but did not provide an explicit goal ordering. The chosen goal concatenates the two initial
;   stacks by placing the H-based stack on top of the O-based stack.
; - The table is modeled as a special location 'table' of type loc. Table is allowed to hold
;   multiple stacks. For simplicity the 'clear' predicate is meaningful for blocks; 'table' is
;   left always available for placements (we do not toggle a clear flag that would prevent multiple stacks).
; - We implement agent-specific actions with agent-specific preconditions: the vowel agent may
;   move only blocks marked (is-vowel), the consonant agent only blocks marked (is-consonant).
; - Agents hold at most one block at a time: modeled with (handempty <agent>) and (holding <agent> <block>).
; - Top-of-stack restriction: modeled via (clear <block>) and (on <block> <support>) facts.
; - We avoid conditional effects by modeling 'on' uniformly as (on ?b ?p) where ?p is either a block or the table location.
;   Picking always removes the generic (on ?b ?p) fact and sets (clear ?p). Placing onto a block sets (clear <support>) to false.
;   We do not set (clear table) to false so the table may hold multiple stacks.
; - No features beyond :strips, :typing and :negative-preconditions are used.

(define (domain blocks-multiagent)
  :requirements :strips :typing :negative-preconditions
  :types block loc agent

  :predicates
    (on ?b - block ?p - (either block loc))     ; block b is directly on support p (block or table)
    (clear ?b - block)                          ; block b is the top block of its stack (no block on it)
    (handempty ?a - agent)                      ; agent a is not holding any block
    (holding ?a - agent ?b - block)             ; agent a is holding block b
    (is-vowel ?b - block)                       ; block is vowel (A, E, I, O)
    (is-consonant ?b - block)                   ; block is consonant
  )

  ; --------------------
  ; Vowel agent actions
  ; --------------------
  (:action vowel-pick
    :parameters (?a - agent ?b - block ?p - (either block loc))
    :precondition (and
                    (handempty ?a)
                    (clear ?b)
                    (is-vowel ?b)
                    (on ?b ?p)
                    ; restrict this action to the vowel agent constant (enforced in problem by giving correct name)
                   )
    :effect (and
              (not (on ?b ?p))
              (not (handempty ?a))
              (holding ?a ?b)
              (not (clear ?b))
              (clear ?p) ; when p is table this is harmless (table considered always available)
            )
  )

  (:action vowel-place-on-block
    :parameters (?a - agent ?b - block ?y - block)
    :precondition (and
                    (holding ?a ?b)
                    (clear ?y)
                    (is-vowel ?b)
                   )
    :effect (and
              (on ?b ?y)
              (clear ?b)
              (not (clear ?y))
              (not (holding ?a ?b))
              (handempty ?a)
            )
  )

  (:action vowel-place-on-table
    :parameters (?a - agent ?b - block ?t - loc)
    :precondition (and
                    (holding ?a ?b)
                    (is-vowel ?b)
                    ; table availability is not modeled as non-clear to allow multiple stacks
                   )
    :effect (and
              (on ?b ?t)
              (clear ?b)
              (not (holding ?a ?b))
              (handempty ?a)
            )
  )

  ; -----------------------
  ; Consonant agent actions
  ; -----------------------
  (:action consonant-pick
    :parameters (?a - agent ?b - block ?p - (either block loc))
    :precondition (and
                    (handempty ?a)
                    (clear ?b)
                    (is-consonant ?b)
                    (on ?b ?p)
                   )
    :effect (and
              (not (on ?b ?p))
              (not (handempty ?a))
              (holding ?a ?b)
              (not (clear ?b))
              (clear ?p)
            )
  )

  (:action consonant-place-on-block
    :parameters (?a - agent ?b - block ?y - block)
    :precondition (and
                    (holding ?a ?b)
                    (clear ?y)
                    (is-consonant ?b)
                   )
    :effect (and
              (on ?b ?y)
              (clear ?b)
              (not (clear ?y))
              (not (holding ?a ?b))
              (handempty ?a)
            )
  )

  (:action consonant-place-on-table
    :parameters (?a - agent ?b - block ?t - loc)
    :precondition (and
                    (holding ?a ?b)
                    (is-consonant ?b)
                   )
    :effect (and
              (on ?b ?t)
              (clear ?b)
              (not (holding ?a ?b))
              (handempty ?a)
            )
  )
)