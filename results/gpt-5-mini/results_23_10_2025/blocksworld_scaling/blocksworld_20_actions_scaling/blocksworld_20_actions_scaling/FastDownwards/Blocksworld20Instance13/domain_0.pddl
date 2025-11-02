(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)    ;; ?x is directly on top of block ?y
    (ontable ?x - block)          ;; ?x is directly on the table
    (clear ?x - block)            ;; nothing on top of ?x
    (handempty)                   ;; no block is being held
    (holding ?x - block)          ;; the agent is holding ?x
  )

  ;; pick up a block from the table
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

  ;; put a held block down onto the table
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

  ;; unstack a top block ?x from block ?y (pick ?x up)
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
      (not (on ?x ?y))
      (holding ?x)
      (clear ?y)
      (not (handempty))
    )
  )

  ;; stack a held block ?x onto block ?y
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (not (clear ?y))
      (handempty)
      (not (holding ?x))
      (clear ?x)
    )
  )
)