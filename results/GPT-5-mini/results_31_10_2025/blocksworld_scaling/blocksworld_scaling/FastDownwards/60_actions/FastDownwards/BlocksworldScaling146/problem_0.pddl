(define (problem multi-agent-blocksworld-problem)
  (:domain multi-agent-blocksworld)
  (:objects
    A B C D E F G H I J K - block
    tA tB tC tD tE tF tG tH tI tJ tK - tablepos
  )

  (:init
    ; Initial: each block stands alone on a distinct table position (topmost and clear).
    (ontable A tA)
    (ontable B tB)
    (ontable C tC)
    (ontable D tD)
    (ontable E tE)
    (ontable F tF)
    (ontable G tG)
    (ontable H tH)
    (ontable I tI)
    (ontable J tJ)
    (ontable K tK)

    ; No empty table positions initially
    ; (empty ...) are therefore not listed.

    ; All blocks start clear (single-block stacks)
    (clear A) (clear B) (clear C) (clear D) (clear E)
    (clear F) (clear G) (clear H) (clear I) (clear J) (clear K)

    ; Vowel / consonant classification (AEI are vowels; all others consonants)
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)
    (consonant H) (consonant J) (consonant K)
  )

  ; Global goal: single stack bottom-to-top K, J, I, H, G, F, E, D, C, B, A with K on the table (at tK)
  (:goal (and
    (ontable K tK)
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