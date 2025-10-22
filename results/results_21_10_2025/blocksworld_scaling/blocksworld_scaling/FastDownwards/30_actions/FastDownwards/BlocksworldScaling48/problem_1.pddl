(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  (:objects
    K A E N H B I L J D G C M F - block
  )

  (:init
    ;; classification
    (vowel A) (vowel E) (vowel I)
    (consonant K) (consonant N) (consonant H) (consonant B)
    (consonant L) (consonant J) (consonant D) (consonant G)
    (consonant C) (consonant M) (consonant F)

    ;; initial placements (as provided)
    (ontable K)
    (ontable A)
    (ontable E)

    (on N E)
    (on I N)
    (on J I)
    (on F J)

    (on H K)
    (on B H)
    (on C B)

    (on L A)
    (on D L)
    (on G D)
    (on M G)

    ;; only the top blocks are initially movable
    (top C)
    (top M)
    (top F)

    ;; Note: other blocks are intentionally not listed as top.
  )

  (:goal (and
    ;; Goal chain: A on B on C on D on E on F on G on H on I on J on K on L on M on N on table
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