(define (domain blocks-world-fast-downward)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (handempty)
    (holding ?x - block)
    (clear ?x - block)
    (on ?x - block ?y - block)
    (ontable ?x - block)
  )

  ; Actions originating from agent: block_picker
  (:action block_picker-PickUp
    :parameters (?x - block)
    :precondition (and
      (handempty)
      (clear ?x)
      (ontable ?x)
    )
    :effect (and
      (holding ?x)
      (not (handempty))
      (not (clear ?x))
      (not (ontable ?x))
    )
  )

  (:action block_picker-Unstack
    :parameters (?x - block ?y - block)
    :precondition (and
      (handempty)
      (clear ?x)
      (on ?x ?y)
    )
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (handempty))
      (not (clear ?x))
      (not (on ?x ?y))
    )
  )

  ; Actions originating from agent: stack_agent
  (:action stack_agent-PutDown
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

  (:action stack_agent-Stack
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