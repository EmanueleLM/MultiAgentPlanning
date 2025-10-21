(define (problem multi-agent-stacking-problem)
  (:domain multi-agent-stacking)

  (:objects
    A B C D E F G H I J K L M - block
  )

  (:init
    ;; Public initial stacking facts (merged from both agents' inputs)
    (ontable B)
    (on C B)
    (on D C)
    (on H D)

    (ontable E)
    (on J E)
    (on F J)
    (on G F)
    (on L G)

    (ontable K)
    (on I K)
    (on M I)
    (on A M)

    ;; Tops of stacks known to be clear
    (clear H)
    (clear L)
    (clear A)

    ;; Both agents start with empty hands (distinct hand predicates per agent)
    (handempty-vowel)
    (handempty-cons)

    ;; Agent capabilities (as provided by the two agents)
    ;; Vowel agent can move A, E, I
    (vowel A)
    (vowel E)
    (vowel I)

    ;; Consonant agent can move B C D F G H J K L M
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
  )

  (:goal (and
    ;; Desired final single stack top-to-bottom:
    ;; A on B on C on D on E on F on G on H on I on J on K on L on M
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
    (ontable M)
  ))
)