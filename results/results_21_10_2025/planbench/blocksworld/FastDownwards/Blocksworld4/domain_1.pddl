(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  ;; Predicates:
  ;; (on ?x ?y)    : block ?x is directly on block ?y
  ;; (ontable ?x)  : block ?x is directly on the table
  ;; (clear ?x)    : block ?x has nothing on top of it and is not held
  ;; (holding ?x)  : the agent is holding block ?x
  ;; (handempty)   : the agent's hand is empty
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  ;;; Actions correspond to the public action names.
  ;;; Comments below keep visible the intended usage (player intentions).

  ;; pick-up: pick up a clear block from the table (player1 partial plan uses this)
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

  ;; unstack: remove a clear block from on top of another block
  (:action unstack
    :parameters (?b - block ?below - block)
    :precondition (and (on ?b ?below) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (on ?b ?below))
      (clear ?below)
      (not (clear ?b))
      (not (handempty))
    )
  )

  ;; put-down: put the held block down onto the table
  (:action put-down
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?b))
      (handempty)
    )
  )

  ;; stack: place the held block onto another clear block
  (:action stack
    :parameters (?b - block ?below - block)
    :precondition (and (holding ?b) (clear ?below))
    :effect (and
      (on ?b ?below)
      (not (clear ?below))
      (clear ?b)
      (not (holding ?b))
      (handempty)
    )
  )
)