(define (domain blocksworld-sequenced)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent step)
  (:constants s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - step)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
    (at-step ?s - step)
  )

  (:action step1-pickup-d
    :parameters (?ag - agent)
    :precondition (and (at-step s0) (ontable d) (clear d) (handempty ?ag))
    :effect (and
      (not (ontable d))
      (not (clear d))
      (not (handempty ?ag))
      (holding ?ag d)
      (not (at-step s0))
      (at-step s1)
    )
  )

  (:action step2-putdown-d
    :parameters (?ag - agent)
    :precondition (and (at-step s1) (holding ?ag d))
    :effect (and
      (ontable d)
      (clear d)
      (handempty ?ag)
      (not (holding ?ag d))
      (not (at-step s1))
      (at-step s2)
    )
  )

  (:action step3-pickup-d
    :parameters (?ag - agent)
    :precondition (and (at-step s2) (ontable d) (clear d) (handempty ?ag))
    :effect (and
      (not (ontable d))
      (not (clear d))
      (not (handempty ?ag))
      (holding ?ag d)
      (not (at-step s2))
      (at-step s3)
    )
  )

  (:action step4-stack-d-on-e
    :parameters (?ag - agent)
    :precondition (and (at-step s3) (holding ?ag d) (clear e))
    :effect (and
      (on d e)
      (clear d)
      (not (clear e))
      (handempty ?ag)
      (not (holding ?ag d))
      (not (at-step s3))
      (at-step s4)
    )
  )

  (:action step5-unstack-c-from-f
    :parameters (?ag - agent)
    :precondition (and (at-step s4) (on c f) (clear c) (handempty ?ag))
    :effect (and
      (holding ?ag c)
      (clear f)
      (not (on c f))
      (not (clear c))
      (not (handempty ?ag))
      (not (at-step s4))
      (at-step s5)
    )
  )

  (:action step6-stack-c-on-d
    :parameters (?ag - agent)
    :precondition (and (at-step s5) (holding ?ag c) (clear d))
    :effect (and
      (on c d)
      (clear c)
      (not (clear d))
      (handempty ?ag)
      (not (holding ?ag c))
      (not (at-step s5))
      (at-step s6)
    )
  )

  (:action step7-unstack-c-from-d
    :parameters (?ag - agent)
    :precondition (and (at-step s6) (on c d) (clear c) (handempty ?ag))
    :effect (and
      (holding ?ag c)
      (clear d)
      (not (on c d))
      (not (clear c))
      (not (handempty ?ag))
      (not (at-step s6))
      (at-step s7)
    )
  )

  (:action step8-stack-c-on-f
    :parameters (?ag - agent)
    :precondition (and (at-step s7) (holding ?ag c) (clear f))
    :effect (and
      (on c f)
      (clear c)
      (not (clear f))
      (handempty ?ag)
      (not (holding ?ag c))
      (not (at-step s7))
      (at-step s8)
    )
  )

  (:action step9-unstack-c-from-f
    :parameters (?ag - agent)
    :precondition (and (at-step s8) (on c f) (clear c) (handempty ?ag))
    :effect (and
      (holding ?ag c)
      (clear f)
      (not (on c f))
      (not (clear c))
      (not (handempty ?ag))
      (not (at-step s8))
      (at-step s9)
    )
  )

  (:action step10-putdown-c
    :parameters (?ag - agent)
    :precondition (and (at-step s9) (holding ?ag c))
    :effect (and
      (ontable c)
      (clear c)
      (handempty ?ag)
      (not (holding ?ag c))
      (not (at-step s9))
      (at-step s10)
    )
  )
)