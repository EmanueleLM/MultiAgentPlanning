(define (problem blocksworld_sequence_problem)
  (:domain blocksworld_sequence)

  (:objects
    A B C D E F - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - step
  )

  (:init
    ;; Initial stacks:
    (ontable A)
    (on E A)
    (on D E)

    (ontable C)
    (on B C)
    (on F B)

    ;; Initially top blocks are clear
    (clear D)
    (clear F)

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