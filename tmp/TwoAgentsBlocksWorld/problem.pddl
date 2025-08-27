```
(define (problem multi-agent-arrangement)
  (:domain multi-agent-blocks)
  (:objects 
    a b c d e f g h i j - block
  )
  
  (:init 
    (vowel a) (vowel e) (vowel i) (vowel o) (vowel u)
    (consonant-block b) (consonant-block c) (consonant-block d)
    (consonant-block f) (consonant-block g) (consonant-block h)
    (on-table a) (on-table b) (on-table c) (on-table d) (on-table e)
    (on-table f) (on-table g) (on-table h) (on-table i) (on-table j)
    (clear a) (clear b) (clear c) (clear d) (clear e)
    (clear f) (clear g) (clear h) (clear i) (clear j)
    (hand-empty)
  )
  
  (:goal 
    (and 
      (on-table a)
      (on-table e)
      (on-table i)
      (on-table o)
      (on-table u)
      (on b c)
      (on c d)
      (on f g)
      (on g h)
    )
  )
)
```