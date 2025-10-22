(define (problem two-agent-blocks-problem)
  (:domain two-agent-blocks)

  (:objects
    I C G J A E H K D F B - block
  )

  (:init
    ;; initial "on" relations (two stacks)
    (ontable I)
    (on J I)
    (on A J)
    (on E A)
    (on F E)

    (ontable C)
    (on G C)
    (on H G)
    (on K H)
    (on D K)
    (on B D)

    ;; clear = top blocks
    (clear F)
    (clear B)

    ;; type membership
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
    (ontable K)
  ))
)