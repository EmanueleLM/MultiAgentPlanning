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

    ;; Clear/top facts: only tops initially are D and L
    (clear D)
    (clear L)
  )

  (:goal (and
    ;; target single stack (table -> top): N - M - L - K - J - I - H - G - F - E - D - C - B - A
    (ontable N)
    (on M N)
    (on L M)
    (on K L)
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