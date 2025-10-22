(define (problem blocksworld10instance0)
  (:domain blocksworld-sequenced)
  (:objects
    a b c d e f g h - block
    robot1 robot2 - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - stage
  )
  (:init
    ;; initial stack relations
    (on a f)
    (on h a)
    (on b d)
    (on e b)
    (on g e)
    (on c g)

    ;; table bases
    (ontable d)
    (ontable f)

    ;; clear blocks (tops)
    (clear h)
    (clear c)

    ;; agents hands empty
    (handempty robot1)
    (handempty robot2)

    ;; initial stage
    (stage s0)
  )

  ;; Goal: complete the prescribed sequence (reach final stage)
  (:goal (and (stage s10)))
)