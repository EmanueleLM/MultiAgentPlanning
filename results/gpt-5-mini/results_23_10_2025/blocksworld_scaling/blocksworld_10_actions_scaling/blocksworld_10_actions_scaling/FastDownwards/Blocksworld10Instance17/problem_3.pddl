(define (problem blocksworld_sequence_problem)
  (:domain blocksworld_sequence)

  (:objects
    a b c d e f - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - step
  )

  (:init
    ;; Initial stacks:
    (ontable a)
    (on e a)
    (on d e)

    (ontable c)
    (on b c)
    (on f b)

    ;; Initially top blocks are clear
    (clear d)
    (clear f)

    ;; Single manipulator is free (hand empty)
    (handempty)

    ;; Start at step 0
    (curr s0)
  )

  ;; Goal: reach the end of the specified ordered action sequence
  (:goal (and
    (curr s10)
    (handempty)
  ))
)