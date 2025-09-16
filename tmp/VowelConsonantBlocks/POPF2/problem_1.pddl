(define (problem rearrange-blocks)
  (:domain blocksworld)

  (:objects
    A O B C - block
  )

  (:init
    (ontable A)
    (on B A)
    (ontable O)
    (ontable C)
    (clear B)
    (clear O)
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