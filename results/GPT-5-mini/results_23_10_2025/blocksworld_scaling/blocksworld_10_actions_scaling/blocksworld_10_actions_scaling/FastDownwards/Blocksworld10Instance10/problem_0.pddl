(define (problem bw-final-arrangement)
  (:domain blocks-world-multiagent)
  (:objects A B C D E F G - block)
  (:init
    ;; table bottoms
    (ontable A)
    (ontable D)
    (ontable E)

    ;; on relationships (initial)
    (on B G)
    (on C D)
    (on F A)
    (on G E)

    ;; clear top blocks initially
    (clear B)
    (clear C)
    (clear F)

    ;; agent state
    (handempty)
  )

  (:goal
    (and
      ;; final table bottoms
      (ontable A)
      (ontable D)
      (ontable E)
      (ontable C)
      (ontable B)

      ;; final on relationships
      (on F A)
      (on G E)
    )
  )
)