(define (problem Blocksworld20Instance12-final)
  (:domain blocks-world)
  (:objects A B C D E F G H I J - block)
  (:init
    ; table blocks
    (ontable C)
    (ontable G)

    ; on relationships
    (on E C)
    (on B E)
    (on H B)
    (on F H)
    (on I F)
    (on J G)
    (on A J)
    (on D A)

    ; clear tops
    (clear D)
    (clear I)

    ; hand state
    (handempty)
  )
  (:goal (and
    (ontable C)
    (ontable G)
    (on E C)
    (on B E)
    (on H B)
    (on F H)
    (on I F)
    (on J G)
    (on A J)
    (on D A)
  ))
)