(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)
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
    (handfree-vowel)
    (handfree-consonant)
  )
  (:goal (and
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (ontable e)
  ))
)