(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (handempty1)
    (handempty2)
    (holding1 ?x - block)
    (holding2 ?x - block)
  )

  (:action pickup-agent1
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty1))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty1))
      (holding1 ?x)
    )
  )

  (:action putdown-agent1
    :parameters (?x - block)
    :precondition (and (holding1 ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty1)
      (not (holding1 ?x))
    )
  )

  (:action unstack-agent2
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty2))
    :effect (and
      (not (on ?x ?y))
      (clear ?y)
      (not (handempty2))
      (holding2 ?x)
    )
  )

  (:action stack-agent2
    :parameters (?x - block ?y - block)
    :precondition (and (holding2 ?x) (clear ?y))
    :effect (and
      (not (clear ?y))
      (on ?x ?y)
      (clear ?x)
      (handempty2)
      (not (holding2 ?x))
    )
  )

  (:action putdown-agent2
    :parameters (?x - block)
    :precondition (and (holding2 ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty2)
      (not (holding2 ?x))
    )
  )
)