(define (domain blocks-world-orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:constants blue orange yellow - block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (phase1-done)
  )

  ;; Pick up a block from the table with the single (one) hand
  (:action pick-up
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ;; Unstack a block from another block (grasp top block)
  (:action unstack
    :parameters (?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (clear ?c)
    )
  )

  ;; Put the currently held block down on the table
  (:action put-down
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  ;; Stack blue onto orange — this action both achieves the placement and
  ;; records the completion of the first required ordering step (phase1-done).
  ;; Uses domain constants blue and orange to enforce the intended ordered phase.
  (:action stack-blue-on-orange
    :parameters ()
    :precondition (and (holding blue) (clear orange))
    :effect (and
      (on blue orange)
      (clear blue)
      (not (clear orange))
      (handempty)
      (not (holding blue))
      (phase1-done)
    )
  )

  ;; Stack yellow onto blue — allowed only after blue is placed on orange.
  ;; Enforced by requiring phase1-done as a precondition.
  (:action stack-yellow-on-blue
    :parameters ()
    :precondition (and (holding yellow) (clear blue) (phase1-done))
    :effect (and
      (on yellow blue)
      (clear yellow)
      (not (clear blue))
      (handempty)
      (not (holding yellow))
    )
  )
)