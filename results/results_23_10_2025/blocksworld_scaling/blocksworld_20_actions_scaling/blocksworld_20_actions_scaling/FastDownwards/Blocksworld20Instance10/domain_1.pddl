(define (domain blocks-multiagent-sequenced)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent step)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?ag - agent ?x - block)
    (handempty ?ag - agent)

    (at-step ?s - step)
    (next ?s - step ?s2 - step)

    (scheduled-unstack ?s - step ?ag - agent ?x - block ?y - block)
    (scheduled-stack   ?s - step ?ag - agent ?x - block ?y - block)
    (scheduled-putdown ?s - step ?ag - agent ?x - block ?y - block)
  )

  ;; Unstack a block ?x from block ?y by agent ?ag at a scheduled step
  (:action unstack-scheduled
    :parameters (?ag - agent ?x - block ?y - block ?s - step ?s2 - step)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty ?ag)
      (at-step ?s)
      (next ?s ?s2)
      (scheduled-unstack ?s ?ag ?x ?y)
    )
    :effect (and
      (not (on ?x ?y))
      (not (clear ?x))
      (clear ?y)
      (not (handempty ?ag))
      (holding ?ag ?x)

      (not (at-step ?s))
      (at-step ?s2)

      (not (scheduled-unstack ?s ?ag ?x ?y))
    )
  )

  ;; Stack a held block ?x onto block ?y by agent ?ag at a scheduled step
  (:action stack-scheduled
    :parameters (?ag - agent ?x - block ?y - block ?s - step ?s2 - step)
    :precondition (and
      (holding ?ag ?x)
      (clear ?y)
      (at-step ?s)
      (next ?s ?s2)
      (scheduled-stack ?s ?ag ?x ?y)
    )
    :effect (and
      (not (holding ?ag ?x))
      (handempty ?ag)
      (not (clear ?y))
      (on ?x ?y)
      (clear ?x)

      (not (at-step ?s))
      (at-step ?s2)

      (not (scheduled-stack ?s ?ag ?x ?y))
    )
  )

  ;; Put a held block ?x down on the table by agent ?ag at a scheduled step
  (:action putdown-scheduled
    :parameters (?ag - agent ?x - block ?dummy - block ?s - step ?s2 - step)
    :precondition (and
      (holding ?ag ?x)
      (at-step ?s)
      (next ?s ?s2)
      (scheduled-putdown ?s ?ag ?x ?dummy)
    )
    :effect (and
      (not (holding ?ag ?x))
      (handempty ?ag)
      (ontable ?x)
      (clear ?x)

      (not (at-step ?s))
      (at-step ?s2)

      (not (scheduled-putdown ?s ?ag ?x ?dummy))
    )
  )
)