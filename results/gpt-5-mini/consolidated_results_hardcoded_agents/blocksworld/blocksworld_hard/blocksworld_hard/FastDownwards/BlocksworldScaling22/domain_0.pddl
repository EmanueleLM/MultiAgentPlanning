(define (domain blocksworld)
  (:requirements :strips :typing)
  (:types object)
  (:predicates
    (block ?x - object)        ; true for blocks
    (table ?t - object)        ; true for the table object
    (on ?x - object ?y - object)   ; x is directly on y (y can be block or table)
    (ontable ?x - object)      ; x is on the table
    (clear ?x - object)        ; nothing is on x
    (holding ?x - object)      ; the robot/agent is holding x
    (handempty)                ; the robot/agent hand is empty
  )

  ;; Pick up a block from the table
  (:action pickup
    :parameters (?x - object)
    :precondition (and
      (block ?x)
      (ontable ?x)
      (clear ?x)
      (handempty)
    )
    :effect (and
      (holding ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty))
    )
  )

  ;; Put a held block down onto the table
  (:action putdown
    :parameters (?x - object)
    :precondition (and
      (block ?x)
      (holding ?x)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
    )
  )

  ;; Unstack a block from another block (take top block ?x off ?y)
  (:action unstack
    :parameters (?x - object ?y - object)
    :precondition (and
      (block ?x)
      (block ?y)
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

  ;; Stack a held block onto another block
  (:action stack
    :parameters (?x - object ?y - object)
    :precondition (and
      (block ?x)
      (block ?y)
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