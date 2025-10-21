(define (domain blocksworld)
  (:requirements :strips :typing)
  (:types block)

  ;; Predicates:
  ;; (on ?x ?y)       : block ?x is directly on block ?y
  ;; (ontable ?x)     : block ?x is directly on the table
  ;; (clear ?x)       : block ?x has nothing on top of it
  ;; (holding ?x)     : the agent is holding block ?x
  ;; (handempty)      : the agent's hand is empty
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  ;; Action: pick-up (pick up a clear block from the table)
  ;; Corresponds to the public "pick-up" rule (player1 intention example).
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

  ;; Action: unstack (remove a clear block from on top of another block)
  ;; Corresponds to the public "unstack" rule (player2 observation of unstack applicability).
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

  ;; Action: put-down (put the held block down onto the table)
  ;; Corresponds to the public "put-down" rule.
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

  ;; Action: stack (place the held block onto another clear block)
  ;; Corresponds to the public "stack" rule (used in the provided partial plan).
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