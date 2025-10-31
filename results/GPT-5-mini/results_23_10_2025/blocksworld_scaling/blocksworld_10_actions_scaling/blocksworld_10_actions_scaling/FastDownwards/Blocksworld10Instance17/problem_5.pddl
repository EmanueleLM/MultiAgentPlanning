(define (problem blocksworld_sequence_problem)
  (:domain blocksworld_sequence)

  (:objects
    a b c d e f - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - step
  )

  (:init
    (ontable a)
    (on e a)
    (on d e)
    (ontable c)
    (on b c)
    (on f b)
    (clear d)
    (clear f)
    (handempty)
    (curr s0)
  )

  (:goal (and
    (curr s10)
    (handempty)
  ))
)