(define (problem Blocksworld10Instance12-problem)
  (:domain blocksworld-multiagent)

  (:objects A B C D E F G H - block)

  (:init
    ;; Initial on / ontable relations
    (on C A)
    (on A H)
    (ontable H)

    (ontable B)

    (on E D)
    (on G E)
    (on F G)
    (ontable D)

    ;; Clear blocks initially (tops of stacks)
    (clear C)
    (clear F)
    (clear B)

    ;; Both agents start with empty hands
    (handempty1)
    (handempty2)
  )

  ;; Goal: final arrangement after the provided action sequence
  (:goal (and
    (on C A)
    (on A H)
    (ontable H)

    (ontable B)
    (on F B)

    (ontable D)
    (on E D)

    (ontable G)
  ))
)