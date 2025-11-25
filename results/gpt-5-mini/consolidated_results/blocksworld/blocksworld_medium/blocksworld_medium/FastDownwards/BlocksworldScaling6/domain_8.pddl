(define (domain BlocksworldScaling6)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (ontable ?b - block)
    (on ?b - block ?c - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
  )

  (:action PickUp
    :parameters (?b - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
    )
  )

  (:action Unstack
    :parameters (?b - block ?c - block)
    :precondition (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b ?c))
      (clear ?c)
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
    )
  )

  (:action PutDown
    :parameters (?b - block)
    :precondition (and
      (holding ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  (:action Stack
    :parameters (?b - block ?c - block)
    :precondition (and
      (holding ?b)
      (clear ?c)
    )
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (not (clear ?c))
      (handempty)
      (not (holding ?b))
      (not (ontable ?b))
    )
  )
)