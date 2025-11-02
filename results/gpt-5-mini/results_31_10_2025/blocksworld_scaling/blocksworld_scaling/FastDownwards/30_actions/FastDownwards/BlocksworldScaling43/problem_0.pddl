(define (problem make-A-on-B-on-C-on-D-on-E-on-F-on-G-on-H-on-I-on-J)
  (:domain blocksworld-multiagent)

  (:objects
    A B C D E F G H I J - block
  )

  (:init
    ; type membership (vowel / consonant)
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

    ; Initial stacks (from table up)
    ; Stack1: F (table) -> H -> C -> I -> B (top)
    (ontable F)
    (on H F)
    (on C H)
    (on I C)
    (on B I)
    (clear B)

    ; Stack2: A (table) -> E -> G (top)
    (ontable A)
    (on E A)
    (on G E)
    (clear G)

    ; Stack3: J (table) -> D (top)
    (ontable J)
    (on D J)
    (clear D)

    ; Both agents start with empty hands
    (handempty-vowel)
    (handempty-cons)
  )

  (:goal
    (and
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E F)
      (on F G)
      (on G H)
      (on H I)
      (on I J)
      (ontable J)
    )
  )
)