(define (domain blocksworld-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block step)

  (:predicates
    (on ?b - block ?s - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?ag - agent ?b - block)
    (handempty ?ag - agent)
    (can-manipulate ?ag - agent ?b - block)
    (at-step ?st - step)
  )

  (:action step1-unstack-c-h
    :parameters ()
    :precondition (and
      (can-manipulate robot1 c)
      (on c h)
      (clear c)
      (handempty robot1)
      (at-step step0)
    )
    :effect (and
      (holding robot1 c)
      (not (on c h))
      (not (clear c))
      (clear h)
      (not (handempty robot1))
      (not (at-step step0))
      (at-step step1)
    )
  )

  (:action step2-stack-c-b
    :parameters ()
    :precondition (and
      (can-manipulate robot1 c)
      (holding robot1 c)
      (clear b)
      (at-step step1)
    )
    :effect (and
      (on c b)
      (clear c)
      (not (clear b))
      (not (holding robot1 c))
      (handempty robot1)
      (not (at-step step1))
      (at-step step2)
    )
  )

  (:action step3-unstack-a-g
    :parameters ()
    :precondition (and
      (can-manipulate robot1 a)
      (on a g)
      (clear a)
      (handempty robot1)
      (at-step step2)
    )
    :effect (and
      (holding robot1 a)
      (not (on a g))
      (not (clear a))
      (clear g)
      (not (handempty robot1))
      (not (at-step step2))
      (at-step step3)
    )
  )

  (:action step4-putdown-a
    :parameters ()
    :precondition (and
      (can-manipulate robot1 a)
      (holding robot1 a)
      (at-step step3)
    )
    :effect (and
      (ontable a)
      (clear a)
      (not (holding robot1 a))
      (handempty robot1)
      (not (at-step step3))
      (at-step step4)
    )
  )

  (:action step5-pickup-a
    :parameters ()
    :precondition (and
      (can-manipulate robot1 a)
      (ontable a)
      (clear a)
      (handempty robot1)
      (at-step step4)
    )
    :effect (and
      (holding robot1 a)
      (not (ontable a))
      (not (clear a))
      (not (handempty robot1))
      (not (at-step step4))
      (at-step step5)
    )
  )

  (:action step6-stack-a-c
    :parameters ()
    :precondition (and
      (can-manipulate robot1 a)
      (holding robot1 a)
      (clear c)
      (at-step step5)
    )
    :effect (and
      (on a c)
      (clear a)
      (not (clear c))
      (not (holding robot1 a))
      (handempty robot1)
      (not (at-step step5))
      (at-step step6)
    )
  )

  (:action step7-pickup-h
    :parameters ()
    :precondition (and
      (can-manipulate robot1 h)
      (ontable h)
      (clear h)
      (handempty robot1)
      (at-step step6)
    )
    :effect (and
      (holding robot1 h)
      (not (ontable h))
      (not (clear h))
      (not (handempty robot1))
      (not (at-step step6))
      (at-step step7)
    )
  )

  (:action step8-putdown-h
    :parameters ()
    :precondition (and
      (can-manipulate robot1 h)
      (holding robot1 h)
      (at-step step7)
    )
    :effect (and
      (ontable h)
      (clear h)
      (not (holding robot1 h))
      (handempty robot1)
      (not (at-step step7))
      (at-step step8)
    )
  )

  (:action step9-unstack-a-c
    :parameters ()
    :precondition (and
      (can-manipulate robot1 a)
      (on a c)
      (clear a)
      (handempty robot1)
      (at-step step8)
    )
    :effect (and
      (holding robot1 a)
      (not (on a c))
      (not (clear a))
      (clear c)
      (not (handempty robot1))
      (not (at-step step8))
      (at-step step9)
    )
  )

  (:action step10-stack-a-g
    :parameters ()
    :precondition (and
      (can-manipulate robot1 a)
      (holding robot1 a)
      (clear g)
      (at-step step9)
    )
    :effect (and
      (on a g)
      (clear a)
      (not (clear g))
      (not (holding robot1 a))
      (handempty robot1)
      (not (at-step step9))
      (at-step step10)
    )
  )
)