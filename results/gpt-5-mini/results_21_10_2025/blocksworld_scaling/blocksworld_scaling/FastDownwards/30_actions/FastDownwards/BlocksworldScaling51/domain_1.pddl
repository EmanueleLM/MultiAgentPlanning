; Domain: BlocksworldScaling51
; Assumptions and modeling notes:
; - There are 5 table spots (table1 .. table5) to allow temporary separate stacks.
; - Agents: vowel_agent (may move only vowel-labeled blocks A,E,I,O), consonant_agent
;   (may move only consonant-labeled blocks). orchestrator is present as an object but
;   has no moving actions.
; - Only top blocks (marked by (clear ?b)) can be picked. Agents hold at most one block
;   at a time (handempty / holding).
; - We separate picks from block-support vs table-support to avoid conditional effects.
; - Place-on-block requires the target block to be clear. Place-on-table does not require
;   a clear table spot (multiple stacks per table spot are prevented by making table spots
;   distinct and placing only one block at a given table spot as base in practice).
; - No placeholders; all predicates, types and actions are explicit and Fast Downward compatible.
(define (domain BlocksworldScaling51)
  :requirements :strips :typing :negative-preconditions
  :types block loc agent

  :predicates
    (on ?b - block ?p - (either block loc))   ; block b is directly on support p (block or loc)
    (clear ?b - block)                        ; block b has nothing on it (top of its stack)
    (handempty ?a - agent)                    ; agent a has empty hand
    (holding ?a - agent ?b - block)           ; agent a holds block b
    (is-vowel ?b - block)                     ; block is vowel (A,E,I,O)
    (is-consonant ?b - block)                 ; block is consonant (others)
    (vowel-agent ?a - agent)                  ; agent is the vowel-moving agent
    (consonant-agent ?a - agent)              ; agent is the consonant-moving agent
  )

  ; --------------------
  ; Vowel agent actions
  ; --------------------
  (:action vowel-pick-from-block
    :parameters (?a - agent ?b - block ?p - block)
    :precondition (and
                    (vowel-agent ?a)
                    (handempty ?a)
                    (clear ?b)
                    (is-vowel ?b)
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

  (:action vowel-pick-from-table
    :parameters (?a - agent ?b - block ?t - loc)
    :precondition (and
                    (vowel-agent ?a)
                    (handempty ?a)
                    (clear ?b)
                    (is-vowel ?b)
                    (on ?b ?t)
                   )
    :effect (and
              (not (on ?b ?t))
              (not (handempty ?a))
              (holding ?a ?b)
              (not (clear ?b))
              ; table locs are not modeled with clear/unclear toggles
            )
  )

  (:action vowel-place-on-block
    :parameters (?a - agent ?b - block ?y - block)
    :precondition (and
                    (vowel-agent ?a)
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
                    (vowel-agent ?a)
                    (holding ?a ?b)
                    (is-vowel ?b)
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
  (:action consonant-pick-from-block
    :parameters (?a - agent ?b - block ?p - block)
    :precondition (and
                    (consonant-agent ?a)
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

  (:action consonant-pick-from-table
    :parameters (?a - agent ?b - block ?t - loc)
    :precondition (and
                    (consonant-agent ?a)
                    (handempty ?a)
                    (clear ?b)
                    (is-consonant ?b)
                    (on ?b ?t)
                   )
    :effect (and
              (not (on ?b ?t))
              (not (handempty ?a))
              (holding ?a ?b)
              (not (clear ?b))
            )
  )

  (:action consonant-place-on-block
    :parameters (?a - agent ?b - block ?y - block)
    :precondition (and
                    (consonant-agent ?a)
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
                    (consonant-agent ?a)
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