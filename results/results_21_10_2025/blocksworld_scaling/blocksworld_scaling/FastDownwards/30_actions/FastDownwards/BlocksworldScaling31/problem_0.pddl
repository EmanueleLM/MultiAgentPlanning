(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)
  (:objects
    A E I - vowel
    B C D F G H J K L M N - consonant
  )

  (:init
    ;; Stack 1 (table -> top): K - H - N - E - M - G - C - F - D
    (ontable K)
    (on H K)
    (on N H)
    (on E N)
    (on M E)
    (on G M)
    (on C G)
    (on F C)
    (on D F)
    ;; Stack 2 (table -> top): J - B - I - A - L
    (ontable J)
    (on B J)
    (on I B)
    (on A I)
    (on L A)

    ;; Clear/top facts: tops are D and L initially
    (clear D)
    (clear L)
    ;; All other blocks that are not on top do not have (clear ...) in init
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
    (on L M)
    (on M N)
    (ontable N)
  ))
)