(define (problem blocks-multiagent-instance)
  (:domain blocks-multiagent)
  (:objects
    A B C D E F G H I - block
    mover1 mover2 - agent
  )

  (:init
    ;; Initial stacks (bottom -> top):
    ;; Stack1: A, E, B
    ;; Stack2: D, F
    ;; Stack3: G, I, H, C

    (on E A)
    (on B E)

    (on F D)

    (on I G)
    (on H I)
    (on C H)

    (ontable A)
    (ontable D)
    (ontable G)

    ;; clear = top blocks
    (clear B)
    (clear F)
    (clear C)

    ;; Hands / global carrying state: nobody holds anything initially
    (handempty mover1)
    (handempty mover2)
    (nooneholding)
  )

  ;; Goal: final configuration after applying the given ordered action sequence
  (:goal (and
    ;; Final stacks (derived from the provided execution trace)
    ;; Table stack [A, E]
    (on E A)
    (ontable A)

    ;; Table stack [F, D, B]
    (on D F)
    (on B D)
    (ontable F)

    ;; Table stack [C]
    (ontable C)

    ;; Stack [G, I, H]
    (on I G)
    (on H I)
    (ontable G)

    ;; Hands empty at the end and globally no one holding anything
    (handempty mover1)
    (handempty mover2)
    (nooneholding)
  ))
)