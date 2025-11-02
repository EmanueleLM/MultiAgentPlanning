(define (problem blocks-world-verify-final)
  (:domain blocks)
  (:objects A B C D E F G H I J K L M - block)

  (:init
    (ontable L)
    (ontable B)
    (ontable C)
    (ontable F)
    (ontable G)

    (on A L)
    (on M A)
    (on H M)

    (on D B)
    (on J D)

    (on K C)

    (on E F)

    (on I G)

    (clear H)
    (clear J)
    (clear K)
    (clear E)
    (clear I)

    (handempty)
  )

  (:goal (and (verified)))
)