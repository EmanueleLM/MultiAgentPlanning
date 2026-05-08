(define (domain block-orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block)

  (:predicates
    (ontable ?b - block)                 ; block is on the table
    (on ?b - block ?b2 - block)         ; block b is on block b2
    (clear ?b - block)                   ; nothing is on block b
    (holding ?a - agent ?b - block)      ; agent a is holding block b
    (handempty ?a - agent)               ; agent a has an empty hand
  )

  ;-----------------------------------------------------------------
  ; Planner actions (the planner may pick and place to the table,
  ; and hand over held blocks to the auditor; the planner is not
  ; permitted to place a block on top of another block)
  ;-----------------------------------------------------------------

  (:action planner-pick
    :parameters (?p - agent ?x - block)
    :precondition (and (handempty ?p) (clear ?x) (ontable ?x))
    :effect (and
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty ?p))
              (holding ?p ?x)
            )
  )

  (:action planner-place-on-table
    :parameters (?p - agent ?x - block)
    :precondition (and (holding ?p ?x))
    :effect (and
              (ontable ?x)
              (clear ?x)
              (handempty ?p)
              (not (holding ?p ?x))
            )
  )

  (:action planner-handover-to-auditor
    :parameters (?p - agent ?a - agent ?x - block)
    :precondition (and (holding ?p ?x) (handempty ?a))
    :effect (and
              (not (holding ?p ?x))
              (holding ?a ?x)
              (handempty ?p)
              (not (handempty ?a))
            )
  )

  ;-----------------------------------------------------------------
  ; Auditor actions (the auditor may pick and place; only the auditor
  ; has an action that places a block on top of another block)
  ;-----------------------------------------------------------------

  (:action auditor-pick
    :parameters (?a - agent ?x - block)
    :precondition (and (handempty ?a) (clear ?x) (ontable ?x))
    :effect (and
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty ?a))
              (holding ?a ?x)
            )
  )

  (:action auditor-place-on-table
    :parameters (?a - agent ?x - block)
    :precondition (and (holding ?a ?x))
    :effect (and
              (ontable ?x)
              (clear ?x)
              (handempty ?a)
              (not (holding ?a ?x))
            )
  )

  (:action auditor-place-on-block
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (holding ?a ?x) (clear ?y))
    :effect (and
              (on ?x ?y)
              (not (holding ?a ?x))
              (handempty ?a)
              (not (clear ?y))
              (clear ?x)
            )
  )

)