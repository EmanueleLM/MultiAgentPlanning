(define (problem orchestrated_stacking)
  (:domain orchestrated_multiagent)

  (:objects
    A B C D E F G H I J K - block
    tbl - table
  )

  (:init
    ;; Initial stacks (bottom -> top)
    ;; Stack1: bottom F then H then J then C then E then G then B then A
    (ontable F)
    (on H F)
    (on J H)
    (on C J)
    (on E C)
    (on G E)
    (on B G)
    (on A B)

    ;; Stack2: bottom D then K then I
    (ontable D)
    (on K D)
    (on I K)

    ;; Only top blocks are clear
    (clear A)
    (clear I)

    ;; Ownership according to agents' capabilities (as inferred and reconciled)
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
  )

  (:goal
    (and
      ;; Final single stack bottom-to-top: K on table, J on K, I on J, H on I, G on H,
      ;; F on G, E on F, D on E, C on D, B on C, A on B
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
    )
  )
)