(define (problem blocksworld10instance19)
  (:domain blocksworld-sequenced)
  (:objects
    a b c d e f g h - block
    manipulator1 manipulator2 orchestrator - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - step
  )
  (:init
    ;; initial arrangement (as given)
    (ontable a)
    (on b a)
    (on h b)
    (on e h)

    (ontable g)
    (on f g)
    (on c f)

    (ontable d)

    ;; clear blocks initially (tops of stacks)
    (clear e)
    (clear c)
    (clear d)

    ;; agents' hands empty initially
    (handempty manipulator1)
    (handempty manipulator2)

    ;; sequence start
    (at-step s0)
  )
  ;; Goal: complete the prescribed sequence (the sequence enforces the final arrangement;
  ;; the final block positions are not directly stated in the goal)
  (:goal (and
    (at-step s10)
    (handempty manipulator1)
    (handempty manipulator2)
  ))
)