(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)
  (:objects
    A B C D E F G H I J K - block
    agent1 agent2 - agent
  )

  (:init
    ;; All blocks start on the table and are clear
    (ontable A) (clear A)
    (ontable B) (clear B)
    (ontable C) (clear C)
    (ontable D) (clear D)
    (ontable E) (clear E)
    (ontable F) (clear F)
    (ontable G) (clear G)
    (ontable H) (clear H)
    (ontable I) (clear I)
    (ontable J) (clear J)
    (ontable K) (clear K)

    ;; Both agents start with empty hands
    (handempty agent1)
    (handempty agent2)
  )

  (:goal (and
    ;; Derived final arrangement
    (on A I)
    (on B D)
    (ontable C)
    (on D K)
    (on E G)
    (ontable F)
    (ontable G)
    (on H A)
    (ontable I)
    (ontable J)
    (on K H)
  ))
)