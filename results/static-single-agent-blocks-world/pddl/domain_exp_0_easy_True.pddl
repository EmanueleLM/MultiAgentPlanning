(define (domain blocks)
  (:requirements :typing)
  (:types block)

  ;;; Predicates ------------------------------------------------------------
  (:predicates
    (ontable ?x   - block)          ; block x is directly on the table
    (on      ?x ?y   - block)      ; block x is stacked on block y
    (clear   ?x   - block)          ; nothing is on top of block x
    (handempty)                     ; the agent’s hand is free
    (holding ?x   - block)          ; the agent is holding block x
  )

  ;;; Actions ---------------------------------------------------------------
  ;; Pick up a clear block that is on the table
  (:action pickup
    :parameters (?x - block)
    :precondition (and
                    (handempty)
                    (ontable ?x)
                    (clear ?x))
    :effect (and
              (holding ?x)
              (not (handempty))
              (not (ontable ?x))
              (not (clear ?x))) )

  ;; Put a held block onto the table
  (:action putdown
    :parameters (?x - block)
    :precondition (holding ?x)
    :effect (and
              (ontable ?x)
              (clear ?x)
              (handempty)
              (not (holding ?x))) )

  ;; Move a held block to on top of another clear block
  (:action stack
    :parameters (?x ?y - block)
    :precondition (and
                    (holding ?x)
                    (clear ?y))
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (handempty)
              (not (holding ?x))
              (not (clear ?y))) )

  ;; Unstack a held-clear block (the block x is on top of y)
  (:action unstack
    :parameters (?x ?y - block)
    :precondition (and
                    (handempty)
                    (on ?x ?y)
                    (clear ?x))
    :effect (and
              (holding ?x)
              (clear ?y)
              (not (on ?x ?y))
              (not (clear ?x))) )
)