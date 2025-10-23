(define (problem Blocksworld30Instance3_trace)
  (:domain blocksworld-trace-instance)

  (:objects
    A B C D E F G H I - block
    mover1 mover2 orchestrator - agent
  )

  (:init
    ;; Initial stacks (bottom -> top):
    ;; Stack1: A, E, B
    (on E A)
    (on B E)
    (ontable A)

    ;; Stack2: D, F
    (on F D)
    (ontable D)

    ;; Stack3: G, I, H, C
    (on I G)
    (on H I)
    (on C H)
    (ontable G)

    ;; Clear/top blocks initially
    (clear B)
    (clear F)
    (clear C)

    ;; Nobody is carrying a block initially
    (nooneholding)

    ;; Start of the trace
    (step0)
  )

  ;; Goal: require completion of the given ordered trace (reach step30)
  ;; The final block arrangement is produced as the side effect of the trace actions.
  (:goal (and (step30)))
)