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
      ;; Final arrangement derived from given ordered action sequence
      (ontable A)
      (ontable B)
      (on K B)
      (on C G)
      (ontable D)
      (on F D)
      (ontable E)
      (ontable G)
      (ontable H)
      (on I H)
      (on J L)
      (ontable L)

      ;; agent ends with empty hand
      (handempty)
    )
  )
)