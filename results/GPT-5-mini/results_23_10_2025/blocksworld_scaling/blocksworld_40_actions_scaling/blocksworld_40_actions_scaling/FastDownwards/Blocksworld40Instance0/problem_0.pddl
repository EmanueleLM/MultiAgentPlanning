(define (problem blocks-final)
  (:domain blocks-world)
  (:objects A B C D E F G H I J K L - block)
  (:init
    ;; Initial configuration (public information)
    (ontable A)
    (on C A)
    (on D C)

    (ontable E)
    (on J E)
    (on L J)
    (on G L)
    (on F G)

    (ontable I)
    (on K I)
    (on B K)

    (ontable H)

    ;; clear blocks (tops of their towers)
    (clear D)
    (clear F)
    (clear B)
    (clear H)

    (handempty)
  )
  (:goal
    (and
      ;; Final arrangement derived from the full action sequence
      (ontable B)
      (on A B)
      (on C A)
      (on D C)
      (on E D)
      (on F E)
      (on G F)
      (on H G)
      (on I H)
      (on J I)
      (on K J)
      (ontable L)

      ;; final conditions
      (clear K)
      (handempty)
    )
  )
)