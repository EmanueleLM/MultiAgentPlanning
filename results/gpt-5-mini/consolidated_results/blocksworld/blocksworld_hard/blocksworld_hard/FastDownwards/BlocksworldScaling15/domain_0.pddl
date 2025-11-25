(define (domain blocks)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?b - block ?s - block)      ; block ?b is on block ?s
    (ontable ?b - block)            ; block ?b is on the table
    (clear ?b - block)              ; no block on top of ?b and ?b is not held
    (holding ?b - block)            ; the hand holds block ?b
    (handempty)                     ; the hand is empty
  )

  ;; pick-up: pick a clear block from the table
  (:action pick-up
    :parameters (?x - block)
    :precondition (and
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

  ;; unstack: pick a clear block from on top of another block
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
    )
    :effect (and
      (holding ?x)
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?x))
      (not (handempty))
    )
  )

  ;; put-down: put the held block onto the table
  (:action put-down
    :parameters (?x - block)
    :precondition (and
      (holding ?x)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
    )
  )

  ;; stack: place the held block onto a clear target block
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