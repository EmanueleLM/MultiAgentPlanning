(define (problem multi-agent-blocks-problem)
  (:domain blocks-multi-agent)
  (:objects
    A E - vowel
    B C D - consonant
  )
  (:init
    (ontable A)
    (on B C)
    (on C D)
    (on D E)
    (ontable E)
    (clear A)
    (clear B)
    (handempty-vowel)
    (handempty-cons)
  )
  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (ontable E)
  ))
)