(define (problem BlocksworldScaling81-problem)
  (:domain blocksworld-multiagent)
  (:objects
    ;; vowels
    A E I O - vowel
    ;; consonants
    M G J D H F N C K L B - consonant
  )
  (:init
    ;; Initial stacks (as specified):
    ;; Stack1 (table): M (on table) - J - D - N - C - O (top)
    (ontable M)
    (on J M)
    (on D J)
    (on N D)
    (on C N)
    (on O C)

    ;; Stack2 (table): G (on table) - E - A - H - F - K - L - B - I (top)
    (ontable G)
    (on E G)
    (on A E)
    (on H A)
    (on F H)
    (on K F)
    (on L K)
    (on B L)
    (on I B)

    ;; Clear (top) facts: initially O and I are the only tops
    (clear O)
    (clear I)
    ;; All other blocks have something on top, so not declared clear here.
  )
  (:goal (and
    ;; Target single stack: O on table, then N on O, M on N, L on M, K on L, J on K,
    ;; I on J, H on I, G on H, F on G, E on F, D on E, C on D, B on C, A on B
    (ontable O)
    (on N O)
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