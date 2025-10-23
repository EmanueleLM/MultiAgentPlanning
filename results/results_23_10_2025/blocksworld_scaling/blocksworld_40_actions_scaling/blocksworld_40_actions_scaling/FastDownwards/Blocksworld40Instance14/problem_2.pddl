(define (problem blocks-final-verify)
  (:domain blocks-multiagent-final)
  (:objects
    A B C D E F G H I J K - block
  )

  (:init
    ;; initial on relationships (bottom-to-top)
    (on D B)
    (on G C)
    (on F G)
    (on J F)
    (on I J)
    (on K I)
    (on H E)

    ;; ontable facts for bottoms of stacks
    (ontable A)
    (ontable B)
    (ontable C)
    (ontable E)

    ;; clear blocks (tops of initial stacks)
    (clear A)
    (clear D)
    (clear K)
    (clear H)

    ;; no block is held initially
    (handempty)
  )

  ;; Goal: final arrangement after executing the provided action sequence
  (:goal
    (and
      ;; final on relationships
      (on G C)
      (on F G)
      (on J F)
      (on I J)
      (on H E)
      (on D H)
      (on K A)

      ;; bottoms on table
      (ontable A)
      (ontable B)
      (ontable C)
      (ontable E)

      ;; tops/clears in final state
      (clear I)
      (clear D)
      (clear K)
      (clear B)

      ;; no block is held in final state
      (handempty)
    )
  )
)