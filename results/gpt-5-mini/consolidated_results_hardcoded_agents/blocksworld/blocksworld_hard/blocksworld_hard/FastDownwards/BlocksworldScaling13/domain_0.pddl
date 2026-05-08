; Domain: blocksworld
; Notes on modeling choices (auditor / ambiguity decisions):
; - We adopt the classical STRIPS blocksworld encoding with four block predicates:
;     (on ?x ?y), (ontable ?x), (clear ?x), and (holding ?x), plus the 0-ary predicate (handempty).
; - We include both tabletop pickup/putdown and stack/unstack actions so all legal classical moves are possible.
; - When a block is picked up or unstacked it ceases to be on-table / on another block and the agent becomes non-handempty.
; - When a block is placed (stacked or put down) the corresponding clear/ontable/on/holding predicates are updated so mutual-exclusion invariants are preserved by action preconditions and effects.
; - No negative preconditions are used; all exclusivity is enforced by the action preconditions/effects (planner-friendly).
; - Requirements are limited to :strips and :typing, compatible with FastDownwards.
(define (domain blocksworld)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)    ; ?x is directly on ?y
    (ontable ?x - block)          ; ?x is directly on the table
    (clear ?x - block)            ; no block is on ?x
    (holding ?x - block)          ; the agent is holding ?x
    (handempty)                   ; the agent's hand is empty
  )

  ; Pick up a clear block from the table into the hand
  (:action pickup
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ; Put down a held block onto the table
  (:action putdown
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?b))
      (handempty)
    )
  )

  ; Unstack a clear block from another block into the hand
  (:action unstack
    :parameters (?b - block ?below - block)
    :precondition (and (on ?b ?below) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (clear ?below)
      (not (on ?b ?below))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ; Stack a held block onto a clear block
  (:action stack
    :parameters (?b - block ?below - block)
    :precondition (and (holding ?b) (clear ?below))
    :effect (and
      (on ?b ?below)
      (clear ?b)
      (not (clear ?below))
      (not (holding ?b))
      (handempty)
    )
  )
)