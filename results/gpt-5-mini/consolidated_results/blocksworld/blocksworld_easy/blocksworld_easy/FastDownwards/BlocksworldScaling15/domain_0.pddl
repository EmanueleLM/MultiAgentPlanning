(define (domain blocks-stacker)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  ;; pick-up: pick a block from the table
  (:action pick-up
    :parameters (?x - block)
    :precondition (and
      (on-table ?x)
      (clear ?x)
      (handempty)
    )
    :effect (and
      (holding ?x)
      (not (on-table ?x))
      (not (clear ?x))
      (not (handempty))
    )
  )

  ;; unstack: remove a block ?x from on top of block ?y
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

  ;; put-down: put a held block on the table
  (:action put-down
    :parameters (?x - block)
    :precondition (and
      (holding ?x)
    )
    :effect (and
      (on-table ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
    )
  )

  ;; stack: put a held block ?x on top of block ?y
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