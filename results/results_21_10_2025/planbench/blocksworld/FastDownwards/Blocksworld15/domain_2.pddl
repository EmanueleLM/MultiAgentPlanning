(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b - block ?x - block)
    (on-table ?b - block)
    (clear ?b - block)
    (handempty)
    (holding ?b - block)
  )

  (:action pick-up
    :parameters (?b - block)
    :precondition (and (handempty) (on-table ?b) (clear ?b) (not (holding ?b)))
    :effect (and
      (holding ?b)
      (not (handempty))
      (not (on-table ?b))
      (not (clear ?b))
    )
  )

  (:action unstack
    :parameters (?b - block ?x - block)
    :precondition (and (handempty) (on ?b ?x) (clear ?b) (not (holding ?b)))
    :effect (and
      (holding ?b)
      (not (handempty))
      (clear ?x)
      (not (on ?b ?x))
      (not (clear ?b))
    )
  )

  (:action put-down
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
      (handempty)
      (not (holding ?b))
      (on-table ?b)
      (clear ?b)
    )
  )

  (:action stack
    :parameters (?b - block ?x - block)
    :precondition (and (holding ?b) (clear ?x) (not (= ?b ?x)))
    :effect (and
      (not (holding ?b))
      (handempty)
      (on ?b ?x)
      (not (clear ?x))
      (clear ?b)
      (not (on-table ?b))
    )
  )
)