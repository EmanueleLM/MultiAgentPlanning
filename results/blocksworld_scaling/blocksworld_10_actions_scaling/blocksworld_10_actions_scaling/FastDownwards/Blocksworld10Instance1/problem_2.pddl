(define (problem Blocksworld10Instance1-final)
  (:domain blocksworld_serial_steps)
  (:objects
    A B C D E F G - block
  )
  (:init
    (ontable A)
    (on B E)
    (ontable C)
    (on D C)
    (on E F)
    (on F G)
    (ontable G)
    (clear A)
    (clear B)
    (clear D)
    (handempty)
    (step0)
  )
  (:goal (and
    (step10)
    (handempty)
  ))
)