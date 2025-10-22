(define (domain blocksworld-sequenced)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent stage)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
    (stage ?s - stage)
  )

  ;; Robot1 action 1: unstack(H, A) at stage s0 -> s1
  (:action r1-unstack-H-A
    :precondition (and (on h a) (clear h) (handempty robot1) (stage s0))
    :effect (and
      (holding robot1 h)
      (clear a)
      (not (on h a))
      (not (clear h))
      (not (handempty robot1))
      (not (stage s0))
      (stage s1)
    )
  )

  ;; Robot1 action 2: putdown(H) at stage s1 -> s2
  (:action r1-putdown-H
    :precondition (and (holding robot1 h) (stage s1))
    :effect (and
      (ontable h)
      (clear h)
      (handempty robot1)
      (not (holding robot1 h))
      (not (stage s1))
      (stage s2)
    )
  )

  ;; Robot1 action 3: unstack(A, F) at stage s2 -> s3
  (:action r1-unstack-A-F-1
    :precondition (and (on a f) (clear a) (handempty robot1) (stage s2))
    :effect (and
      (holding robot1 a)
      (clear f)
      (not (on a f))
      (not (clear a))
      (not (handempty robot1))
      (not (stage s2))
      (stage s3)
    )
  )

  ;; Robot1 action 4: stack(A, F) at stage s3 -> s4
  (:action r1-stack-A-F
    :precondition (and (holding robot1 a) (clear f) (stage s3))
    :effect (and
      (on a f)
      (clear a)
      (not (holding robot1 a))
      (not (clear f))
      (handempty robot1)
      (not (stage s3))
      (stage s4)
    )
  )

  ;; Robot1 action 5: unstack(A, F) at stage s4 -> s5
  (:action r1-unstack-A-F-2
    :precondition (and (on a f) (clear a) (handempty robot1) (stage s4))
    :effect (and
      (holding robot1 a)
      (clear f)
      (not (on a f))
      (not (clear a))
      (not (handempty robot1))
      (not (stage s4))
      (stage s5)
    )
  )

  ;; Robot2 action 6: stack(A, H) at stage s5 -> s6
  (:action r2-stack-A-H
    :precondition (and (holding robot2 a) (clear h) (stage s5))
    :effect (and
      (on a h)
      (clear a)
      (not (holding robot2 a))
      (not (clear h))
      (handempty robot2)
      (not (stage s5))
      (stage s6)
    )
  )

  ;; Robot2 action 7: unstack(A, H) at stage s6 -> s7
  (:action r2-unstack-A-H
    :precondition (and (on a h) (clear a) (handempty robot2) (stage s6))
    :effect (and
      (holding robot2 a)
      (clear h)
      (not (on a h))
      (not (clear a))
      (not (handempty robot2))
      (not (stage s6))
      (stage s7)
    )
  )

  ;; Robot2 action 8: stack(A, F) at stage s7 -> s8
  (:action r2-stack-A-F
    :precondition (and (holding robot2 a) (clear f) (stage s7))
    :effect (and
      (on a f)
      (clear a)
      (not (holding robot2 a))
      (not (clear f))
      (handempty robot2)
      (not (stage s7))
      (stage s8)
    )
  )

  ;; Robot2 action 9: unstack(C, G) at stage s8 -> s9
  (:action r2-unstack-C-G
    :precondition (and (on c g) (clear c) (handempty robot2) (stage s8))
    :effect (and
      (holding robot2 c)
      (clear g)
      (not (on c g))
      (not (clear c))
      (not (handempty robot2))
      (not (stage s8))
      (stage s9)
    )
  )

  ;; Robot2 action 10: putdown(C) at stage s9 -> s10
  (:action r2-putdown-C
    :precondition (and (holding robot2 c) (stage s9))
    :effect (and
      (ontable c)
      (clear c)
      (handempty robot2)
      (not (holding robot2 c))
      (not (stage s9))
      (stage s10)
    )
  )
)