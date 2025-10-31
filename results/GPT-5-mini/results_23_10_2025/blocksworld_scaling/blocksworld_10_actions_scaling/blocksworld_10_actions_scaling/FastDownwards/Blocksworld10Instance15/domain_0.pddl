(define (domain blocks-world-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)     ; block ?x is on block ?y
    (ontable ?x - block)           ; block ?x is on the table
    (clear ?x - block)             ; nothing on top of ?x
    (holding ?x - block)           ; robot is holding ?x
    (handempty)                    ; robot hand is empty
  )

  ;; Unstack a block ?x from a block ?y: pick ?x up from top of ?y
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
    )
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty))
    )
  )

  ;; Stack the block ?x (held) onto block ?y
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and
      (holding ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (clear ?y))
    )
  )
)