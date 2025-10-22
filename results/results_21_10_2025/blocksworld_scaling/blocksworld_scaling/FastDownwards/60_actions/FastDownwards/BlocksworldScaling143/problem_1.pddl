(define (problem BlocksworldScaling143_problem)
  (:domain BlocksworldScaling143)

  (:objects
    L J D M E K H F I A G B C - block
    vowel_agent consonant_agent orchestrator - agent
  )

  (:init
    ;; static classification
    (vowel A)
    (vowel E)
    (vowel I)

    (consonant B)
    (consonant C)
    (consonant D)
    (consonant F)
    (consonant G)
    (consonant H)
    (consonant J)
    (consonant K)
    (consonant L)
    (consonant M)

    ;; Initial stacks (bottom -> top)
    ;; Stack1: L, J, K, H, I, A, G, B, C
    (on J L)
    (on K J)
    (on H K)
    (on I H)
    (on A I)
    (on G A)
    (on B G)
    (on C B)
    (on-table L)

    ;; Stack2: D, F
    (on F D)
    (on-table D)

    ;; Stack3: M, E
    (on E M)
    (on-table M)

    ;; Tops are clear
    (clear C)
    (clear F)
    (clear E)

    ;; Agents free
    (free vowel_agent)
    (free consonant_agent)
  )

  (:goal
    (and
      ;; Desired single stack bottom-to-top: M, L, K, J, I, H, G, F, E, D, C, B, A
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
      (on-table M)
      (clear A)
    )
  )
)