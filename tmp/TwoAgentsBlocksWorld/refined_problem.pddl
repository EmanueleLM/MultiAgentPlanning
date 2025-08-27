(define (problem multi-agent-arrangement)
  (:domain multi-agent-blocks)
  (:objects 
    A B C D E F G I O U - block
  )
  
  (:init 
    (vowel A) (vowel E) (vowel I) (vowel O) (vowel U)
    (consonant-block B) (consonant-block C) (consonant-block D)
    (consonant-block F) (consonant-block G)
    (on-table A) (on-table B) (on-table C) (on-table D) (on-table E)
    (on-table F) (on-table G) (on-table I) (on-table U) (on-table O)
    (clear A) (clear B) (clear C) (clear D) (clear E)
    (clear F) (clear G) (clear I) (clear U) (clear O)
    (hand-empty)
  )
  
  (:goal 
    (and 
      (on-table A)
      (on-table E)
      (on-table I)
      (on-table O)
      (on-table U)
      (on B C)
      (on C D)
      (on D F)
      (on F G)
    )
  )
)