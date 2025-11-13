(define (domain blocksworld20)
  (:requirements :strips :typing)
  (:types block)
  (:predicates
    (on ?x ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  (:action pick-up
    :parameters (?b - block)
    :precondition (and (handempty) (ontable ?b) (clear ?b))
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
    )
  )

  (:action unstack
    :parameters (?b - block ?c - block)
    :precondition (and (handempty) (on ?b ?c) (clear ?b))
    :effect (and
      (holding ?b)
      (clear ?c)
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
    )
  )

  (:action put-down
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  (:action stack
    :parameters (?b - block ?c - block)
    :precondition (and (holding ?b) (clear ?c))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?c))
    )
  )
)