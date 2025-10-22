(define (domain blocksworld-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types place agent stage block - place)

  (:constants table0 - place)

  (:predicates
    (on ?x - block ?y - place)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?ag - agent ?x - block)
    (handempty ?ag - agent)
    (at-stage ?s - stage)
    (succ ?s - stage ?s2 - stage)
    (allowed-move ?s - stage ?x - block ?y - place)
  )

  (:action unstack
    :parameters (?ag - agent ?x - block ?y - place ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (succ ?s ?s2)
      (allowed-move ?s ?x ?y)
      (on ?x ?y)
      (clear ?x)
      (handempty ?ag)
    )
    :effect (and
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?x))
      (not (handempty ?ag))
      (holding ?ag ?x)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action putdown
    :parameters (?ag - agent ?x - block ?y - place ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (succ ?s ?s2)
      (allowed-move ?s ?x ?y)
      (holding ?ag ?x)
    )
    :effect (and
      (not (holding ?ag ?x))
      (ontable ?x)
      (clear ?x)
      (handempty ?ag)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action pickup
    :parameters (?ag - agent ?x - block ?y - place ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (succ ?s ?s2)
      (allowed-move ?s ?x ?y)
      (ontable ?x)
      (clear ?x)
      (handempty ?ag)
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty ?ag))
      (holding ?ag ?x)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action stack
    :parameters (?ag - agent ?x - block ?y - place ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (succ ?s ?s2)
      (allowed-move ?s ?x ?y)
      (holding ?ag ?x)
      (clear ?y)
    )
    :effect (and
      (not (holding ?ag ?x))
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (handempty ?ag)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)