(define (problem blocksworld-easy-scaling-4)
  (:domain blocksworld)
  (:objects
    B - block
    Y - block
    O - block
    R - block
  )
  (:init
    (hand-empty)
    (ontable R)
    (ontable Y)
    (on B O)
    (on O R)
    (clear B)
    (clear Y)
  )
  (:goal (and
    (on B Y)
    (on O R)
  ))
)