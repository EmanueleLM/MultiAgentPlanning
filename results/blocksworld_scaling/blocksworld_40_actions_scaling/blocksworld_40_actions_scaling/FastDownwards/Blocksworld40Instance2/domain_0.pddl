(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  ;; Predicates:
  ;; (on ?x ?y)    - block ?x is directly on block ?y
  ;; (ontable ?x)  - block ?x is directly on the table
  ;; (clear ?x)    - nothing is on block ?x
  ;; (holding ?x)  - the (single) agent is holding block ?x
  ;; (handempty)   - the agent's hand is empty
  (:predicates 
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  ;;; Standard BlocksWorld actions
  ;;; pickup: pick a clear block from the table
  ;;; (used by mover1 at action 1 in the narrative)
  (:action pickup
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and 
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty))
              (holding ?x)
            )
  )

  ;;; putdown: put the held block down onto the table
  ;;; (used by agents in narrative but in our integrated trace this was not applied to C)
  (:action putdown
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
              (ontable ?x)
              (clear ?x)
              (handempty)
              (not (holding ?x))
            )
  )

  ;;; unstack: pick up a clear block that is on top of another block
  ;;;
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
              (holding ?x)
              (not (on ?x ?y))
              (not (clear ?x))
              (clear ?y)
              (not (handempty))
            )
  )

  ;;; stack: put a held block on top of a clear block
  ;;;
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (not (clear ?y))
              (handempty)
              (not (holding ?x))
            )
  )
)