(define (problem dual-agent-blocks-problem)
  (:domain dual-agent-blocks)
  (:objects
    A B C D E F G I - block
    S1 S2 S3 - stack
  )
  (:init
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)
    (stack-used S1) (stack-used S2) (stack-free S3)
    (ontable D S1) (on C D) (on B C) (on A B)
    (ontable E S2) (on G E) (on I G) (on F I)
    (bottom D S1) (bottom E S2)
    (clear A)
    (clear F)
    (handempty-va)
    (handempty-ca)
  )
  (:goal (and
    (ontable F S1) (on C F) (on I C) (on G I)
    (ontable A S2) (on B A) (on D B) (on E D)
    (stack-used S1) (stack-used S2) (stack-free S3)
  )))