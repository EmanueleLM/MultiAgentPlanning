(define (domain block-orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (ontable ?b - block)                 ; block is directly on the table
    (on ?b - block ?b2 - block)         ; block b is directly on block b2
    (clear ?b - block)                  ; nothing is on block b and the block is not picked up
    (holding ?b - block)                ; the single hand is holding block b
    (handempty)                         ; the single hand is empty
    (current-stage ?s - stage)          ; the current discrete stage/time
    (succ ?s - stage ?s2 - stage)       ; successor relation between stages
  )

  ;; Pick up a clear block from the table (hand must be empty). Advances stage by succ.
  (:action pick-up
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and (handempty) (clear ?x) (ontable ?x) (current-stage ?s) (succ ?s ?s2))
    :effect (and
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty))
              (holding ?x)
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  ;; Unstack a clear block that is on top of another block. Advances stage by succ.
  (:action unstack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and (handempty) (clear ?x) (on ?x ?y) (current-stage ?s) (succ ?s ?s2))
    :effect (and
              (not (on ?x ?y))
              (clear ?y)
              (not (clear ?x))
              (not (handempty))
              (holding ?x)
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  ;; Put the held block down onto the table. Advances stage by succ.
  (:action put-down
    :parameters (?x - block ?s - stage ?s2 - stage)
    :precondition (and (holding ?x) (current-stage ?s) (succ ?s ?s2))
    :effect (and
              (ontable ?x)
              (clear ?x)
              (handempty)
              (not (holding ?x))
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )

  ;; Stack the held block onto another clear block. Advances stage by succ.
  ;; Prevent stacking a block onto itself using a negative equality precondition.
  (:action stack
    :parameters (?x - block ?y - block ?s - stage ?s2 - stage)
    :precondition (and (holding ?x) (clear ?y) (current-stage ?s) (succ ?s ?s2) (not (= ?x ?y)))
    :effect (and
              (on ?x ?y)
              (not (holding ?x))
              (handempty)
              (not (clear ?y))
              (clear ?x)
              (not (current-stage ?s))
              (current-stage ?s2)
            )
  )
)