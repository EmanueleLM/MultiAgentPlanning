(define (problem multi-agent-blocks-problem)
  (:domain blocks-multi-agent)
  (:objects
    a e - vowel
    b c d - consonant
  )
  (:init
    (ontable a)
    (on b c)
    (on c d)
    (on d e)
    (ontable e)
    (clear a)
    (clear b)
    (handempty-vowel)
    (handempty-cons)
  )
  (:goal (and
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (ontable e)
  ))
)