(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  ;; Standard single-agent blocks world domain.
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  ;; pickup: pick a clear block from the table
  (:action pickup
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
              (holding ?b)
              (not (ontable ?b))
              (not (handempty))
            )
  )

  ;; putdown: put a held block on the table
  (:action putdown
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty)
              (not (holding ?b))
            )
  )

  ;; unstack: pick a clear block from atop another block
  (:action unstack
    :parameters (?b - block ?x - block)
    :precondition (and (on ?b ?x) (clear ?b) (handempty))
    :effect (and
              (holding ?b)
              (clear ?x)
              (not (on ?b ?x))
              (not (handempty))
            )
  )

  ;; stack: place a held block onto another clear block
  (:action stack
    :parameters (?b - block ?x - block)
    :precondition (and (holding ?b) (clear ?x))
    :effect (and
              (on ?b ?x)
              (clear ?b)
              (handempty)
              (not (holding ?b))
              (not (clear ?x))
            )
  )
)