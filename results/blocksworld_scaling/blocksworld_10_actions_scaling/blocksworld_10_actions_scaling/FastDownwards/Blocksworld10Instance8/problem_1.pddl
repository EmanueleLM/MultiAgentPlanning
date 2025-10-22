(define (problem bw-multi-10-8)
  (:domain blocks-multiagent)
  (:objects
    a b c d e f g - block
    agent1 agent2 orchestrator - agent
  )
  (:init
    ;; Initial stacking: A on B, B on E, E on C, C on D; D, F, G on table
    (on a b)
    (on b e)
    (on e c)
    (on c d)
    (ontable d)
    (ontable f)
    (ontable g)

    ;; Clear top blocks
    (clear a)
    (clear f)
    (clear g)

    ;; Agents' hands empty initially
    (handempty agent1)
    (handempty agent2)
    (handempty orchestrator)
  )

  ;; Goal encodes the final arrangement derived from the action sequence
  (:goal (and
    (ontable a)
    (on b e)
    (on e c)
    (on c d)
    (ontable d)
    (ontable f)
    (on g f)
  ))
)