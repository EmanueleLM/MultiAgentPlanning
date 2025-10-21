(define (problem blocksworld-m-a)
  (:domain multiagent-blocks)

  (:objects
    A B C D E F G H I J K L M - block
    pileC pileL pileS - place
  )

  (:init
    ;; places
    (place pileC) (place pileL) (place pileS)

    ;; blocks
    (block A) (block B) (block C) (block D) (block E) (block F) (block G)
    (block H) (block I) (block J) (block K) (block L) (block M)

    ;; vowel / consonant classification
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)
    (consonant L) (consonant M)

    ;; initial stacks (bottom -> top)
    ;; pileC: C (bottom) - B - G - I - J (top)
    (on C pileC) (on B C) (on G B) (on I G) (on J I)
    (clear J)

    ;; pileL: L (bottom on table) - K - F - D - M - E - A - H (top)
    (on L pileL) (on K L) (on F K) (on D F) (on M D) (on E M) (on A E) (on H A)
    (clear H)

    ;; pileS is empty and clear
    (clear pileS)
  )

  ;; goal: stacked A on B on C ... L on M and M on the table (pileS will represent the table spot for M)
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
    (on M pileS)
  ))
)