(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    ;; direct stacking relation: (on x y) means block x is directly on block y
    (on ?x - block ?y - block)

    ;; on the table
    (ontable ?x - block)

    ;; clear means: nothing is on this block and it is not being held
    (clear ?x - block)

    ;; the single-handed agent is holding a specific block
    (holding ?x - block)

    ;; hand empty indicator (true exactly when not holding any block)
    (handempty)

    ;; current discrete stage/time object
    (at ?s - stage)

    ;; successor relation among stages: actions must move from a stage to its successor
    (next ?s1 - stage ?s2 - stage)
  )

  ;; pick-up a clear block from the table, advancing from stage ?s to its successor ?s'
  ;; Preconditions enforce: block is on table, clear, and the hand is empty, and action executes at the current stage.
  ;; Effects enforce contiguous progression of the stage and update the state exactly (no bookkeeping tokens).
  (:action pick-up
    :parameters (?b - block ?s - stage ?s' - stage)
    :precondition (and
      (at ?s)
      (next ?s ?s')
      (ontable ?b)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))     ; a held block is not clear (by the definition of clear)
      (not (handempty))
      (holding ?b)
      (not (at ?s))
      (at ?s')
    )
  )

  ;; unstack a clear block ?b from on top of ?c, advancing stages
  ;; Preconditions enforce the block to be directly on ?c, be clear, and the hand empty.
  ;; Effects remove the on relation, make the underneath block clear, and set holding.
  (:action unstack
    :parameters (?b - block ?c - block ?s - stage ?s' - stage)
    :precondition (and
      (at ?s)
      (next ?s ?s')
      (on ?b ?c)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))   ; held block is not clear
      (not (handempty))
      (holding ?b)
      (clear ?c)         ; the block underneath becomes clear after removing the top block
      (not (at ?s))
      (at ?s')
    )
  )

  ;; put down a held block onto the table, advancing stages
  (:action put-down
    :parameters (?b - block ?s - stage ?s' - stage)
    :precondition (and
      (at ?s)
      (next ?s ?s')
      (holding ?b)
    )
    :effect (and
      (not (holding ?b))
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (at ?s))
      (at ?s')
    )
  )

  ;; stack a held block ?b onto a clear block ?c, advancing stages
  ;; Preconditions enforce: holding the block, destination clear, and stage progression.
  ;; A local immediate 2-cycle is prevented by requiring the destination is not directly on ?b.
  ;; Longer transitive cycles are prevented by problem-level goal correction/auditor guarantees in this instance.
  (:action stack
    :parameters (?b - block ?c - block ?s - stage ?s' - stage)
    :precondition (and
      (at ?s)
      (next ?s ?s')
      (holding ?b)
      (clear ?c)
      (not (on ?c ?b))
    )
    :effect (and
      (not (holding ?b))
      (on ?b ?c)
      (not (ontable ?b))
      (clear ?b)            ; newly placed block has nothing on top
      (not (clear ?c))      ; destination is no longer clear
      (handempty)
      (not (at ?s))
      (at ?s')
    )
  )
)