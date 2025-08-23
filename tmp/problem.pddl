(define (problem rearrange-blocks-coordinated)
  (:domain blocksworld-coordinated)
  (:objects 
    A B C E O - block
  )
  
  (:init
    (ontable A)
    (on B A)
    (ontable C)
    (ontable E)
    (on O C)
    (clear B)
    (clear O)
    (clear E)
    (arm-empty-vowel)
    (handempty-consonant)
    (is-consonant B)
    (is-consonant C)
    (is-vowel A)
    (is-vowel E)
    (is-vowel O)
  )

  (:goal
    (and 
      (on A B)
      (ontable B)
      (on C E)
      (ontable E)
      (ontable O)
      (clear A)
      (clear C)
      (clear O)
    )
  )
)