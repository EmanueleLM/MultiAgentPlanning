(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)
  (:objects
    A E I - vowel
    B C D F G H J K L - consonant
  )

  (:init
    ;; Initial stacks (merged and normalized to uppercase objects)
    ;; Stack 1: A (table) <- I <- L <- K <- E <- F (top)
    (ontable A)
    (on I A)
    (on L I)
    (on K L)
    (on E K)
    (on F E)

    ;; Stack 2: C (table) <- D <- H <- G <- J <- B (top)
    (ontable C)
    (on D C)
    (on H D)
    (on G H)
    (on J G)
    (on B J)

    ;; Clear top blocks
    (clear F)
    (clear B)

    ;; Both agents start with empty hands
    (handempty-v)
    (handempty-c)
  )

  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J K)
    (on K L)
    (ontable L)
  ))
)