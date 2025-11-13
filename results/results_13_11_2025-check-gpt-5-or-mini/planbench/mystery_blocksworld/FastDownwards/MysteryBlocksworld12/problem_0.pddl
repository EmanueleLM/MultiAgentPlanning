(define (problem ProblemB)
  (:domain DomainMysteryBlocksworld12)
  (:objects
    b1 b2 b3 - block
  )
  (:init
    (on b1 b2)
    (on b2 b3)
    (ontable b3)
    (clear b1)
    (handempty)
  )
  (:goal (and
    (on b3 b2)
    (on b2 b1)
    (ontable b1)
    (clear b3)
    (handempty)
  ))
)