(define (problem blocks-multiagent-verify-final)
  (:domain blocks-world-multiagent)
  (:objects A B C D E F G H I J K L - block)

  (:init
    (on B I)
    (on C B)
    (on D E)
    (on E F)
    (on G D)
    (on H G)
    (on J L)
    (on L K)
    (on-table A)
    (on-table F)
    (on-table I)
    (on-table K)

    (clear A)
    (clear C)
    (clear H)
    (clear J)

    (handempty1)
    (handempty2)
  )

  (:goal (and (verified)))
)