(define (problem multiagent-blocks-prob)
  (:domain multiagent-blocks)
  (:objects
    A B C D E F G I
    s1 s2 s3
    table
  )

  (:init
    ; classification
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)

    ; table marker
    (table table)

    ; initial stacks: stack1 in slot s1 has bottom D, then C, then B, then top A
    (used s1)
    (base s1 D)
    (top s1 A)
    (on C D)
    (on B C)
    (on A B)
    (on D table)

    ; initial stacks: stack2 in slot s2 has bottom E, then G, then I, then top F
    (used s2)
    (base s2 E)
    (top s2 F)
    (on G E)
    (on I G)
    (on F I)
    (on E table)

    ; third slot available (max 3 stacks)
    (available s3)

    ; top blocks are clear
    (clear A)
    (clear F)

    ; agents start free (holding at most one each)
    (freeV)
    (freeC)
  )

  (:goal (and
    ; Goal: two stacks with bases A and F and the specified on-relations
    (on B A)
    (on D B)
    (on E D)
    (on C F)
    (on I C)
    (on G I)
    (on A table)  ; A and F must be bases on the table
    (on F table)

    ; Stack count constraint implicit via limited slots: no more than 3 used slots may exist.
  ))
)