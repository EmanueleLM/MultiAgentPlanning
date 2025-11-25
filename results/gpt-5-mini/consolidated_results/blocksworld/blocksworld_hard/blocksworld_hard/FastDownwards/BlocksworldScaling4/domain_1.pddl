(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block stage)

  (:predicates
    (on ?x - block ?y - block)      ; block x is on block y
    (on-table ?x - block)           ; block x is directly on the table
    (clear ?x - block)              ; nothing is on top of block x AND x is not being held
    (holding ?x - block)            ; the agent is holding block x
    (handempty)                     ; the agent's hand is empty
    (current ?s - stage)            ; current discrete stage
    (succ ?s1 - stage ?s2 - stage)  ; stage successor relation
  )

  ;; Pick up a block from the table, advancing the global stage
  (:action pickup
    :parameters (?x - block ?t - stage ?t2 - stage)
    :precondition (and (on-table ?x) (clear ?x) (handempty) (current ?t) (succ ?t ?t2))
    :effect (and
      (holding ?x)
      (not (on-table ?x))
      (not (handempty))
      (not (clear ?x))
      (current ?t2)
      (not (current ?t))
    )
  )

  ;; Unstack a block from another block, advancing the global stage
  (:action unstack
    :parameters (?x - block ?y - block ?t - stage ?t2 - stage)
    :precondition (and (on ?x ?y) (clear ?x) (handempty) (current ?t) (succ ?t ?t2))
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (handempty))
      (not (clear ?x))
      (current ?t2)
      (not (current ?t))
    )
  )

  ;; Put a held block down onto the table, advancing the global stage
  (:action putdown
    :parameters (?x - block ?t - stage ?t2 - stage)
    :precondition (and (holding ?x) (current ?t) (succ ?t ?t2))
    :effect (and
      (on-table ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (current ?t2)
      (not (current ?t))
    )
  )

  ;; Stack a held block onto another block, advancing the global stage
  (:action stack
    :parameters (?x - block ?y - block ?t - stage ?t2 - stage)
    :precondition (and (holding ?x) (clear ?y) (current ?t) (succ ?t ?t2))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (handempty)
      (not (holding ?x))
      (current ?t2)
      (not (current ?t))
    )
  )
)