(define (domain block-world)
  (:requirements :strips :typing)
  (:types block)
  (:predicates
    (handempty)
    (holding ?b - block)
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
  )

  ;; pick-up: pick a clear block from the table into the single hand
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

  ;; unstack: pick a clear block from on top of another block into the single hand
  (:action unstack
    :parameters (?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (clear ?c)
      (not (on ?b ?c))
      (not (handempty))
    )
  )

  ;; put-down: place a held block onto the table
  (:action put-down
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  ;; stack: place a held block on top of a clear block
  (:action stack
    :parameters (?b - block ?c - block)
    :precondition (and (holding ?b) (clear ?c))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (clear ?c))
      (not (holding ?b))
    )
  )
)