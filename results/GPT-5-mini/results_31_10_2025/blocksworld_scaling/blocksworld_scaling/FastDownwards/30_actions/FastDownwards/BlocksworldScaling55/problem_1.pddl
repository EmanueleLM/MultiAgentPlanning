(define (problem BlocksworldScaling55-problem)
  (:domain blocksworld-vowel-consonant)
  (:objects
    ;; supports: initial stack bases and extra table positions
    S1 S2 S3 - tablepos
    T1 T2 T3 T4 T5 - tablepos

    ;; blocks typed as vowels and consonants
    A E I - vowel
    B C D F G H J - consonant
  )
  (:init
    ;; initial "on" relations (stack bottoms are table positions S1,S2,S3)
    (on A S1)
    (on E A)
    (on C E)
    (on G C)
    (on B G)

    (on H S2)
    (on J H)

    (on I S3)
    (on F I)
    (on D F)

    ;; clear = top blocks initially
    (clear B)
    (clear J)
    (clear D)

    ;; table positions initially empty (S1,S2,S3 are occupied bottoms; T1..T5 empty)
    (empty T1)
    (empty T2)
    (empty T3)
    (empty T4)
    (empty T5)
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
    (on J T1)
  ))
)