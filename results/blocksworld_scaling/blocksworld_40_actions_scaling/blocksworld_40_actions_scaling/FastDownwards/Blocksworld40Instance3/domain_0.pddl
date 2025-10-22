(define (domain blocks)
  (:requirements :strips :typing)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  ;; pick a clear block from the table
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

  ;; unstack a clear block ?x from block ?y
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
              (not (on ?x ?y))
              (not (clear ?x))
              (not (handempty))
              (holding ?x)
              (clear ?y)
            )
  )

  ;; put held block down on the table
  (:action putdown
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
              (not (holding ?x))
              (ontable ?x)
              (handempty)
              (clear ?x)
            )
  )

  ;; stack a held block ?x onto a clear block ?y
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
              (not (holding ?x))
              (not (clear ?y))
              (handempty)
              (on ?x ?y)
              (clear ?x)
            )
  )
)