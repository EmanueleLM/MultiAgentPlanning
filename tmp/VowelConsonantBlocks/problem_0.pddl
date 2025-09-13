(define (problem rearrange-blocks)
  (:domain blocksworld)

  (:objects
    A O B C - block
  )

  (:init
    (ontable A)
    (ontable O)
    (ontable B)
    (ontable C)
    (clear A)
    (clear O)
    (clear B)
    (clear C)
    (handempty)
    (vowel A)
    (vowel O)
    (consonant B)
    (consonant C)
  )

  (:goal (and
    (ontable A)
    (ontable B)
    (on C O)
    (on O B)
  ))

)