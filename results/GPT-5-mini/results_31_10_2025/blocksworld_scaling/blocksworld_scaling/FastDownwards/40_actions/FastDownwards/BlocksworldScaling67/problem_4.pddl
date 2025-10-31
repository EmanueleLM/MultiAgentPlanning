(define (problem bw-multi-problem)
  (:domain blocksworld-multiagent)
  (:objects
    A E I - vowel
    B C D F G H J K - consonant
  )
  (:init
    (ontable H)
    (on B H)
    (on C B)
    (on K C)

    (ontable J)
    (on F J)
    (on A F)
    (on G A)
    (on D G)

    (ontable E)
    (on I E)

    (clear K)
    (clear D)
    (clear I)

    (handempty-vowel)
    (handempty-consonant)
  )

  (:goal (and
    (ontable K)
    (on J K)
    (on I J)
    (on H I)
    (on G H)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
  ))
)