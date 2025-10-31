(define (problem Blocksworld10Instance1-final)
  (:domain blocksworld_serial_steps)
  (:objects
    A B C D E F G - block
  )

  (:init
    ;; initial stacking as given
    (ontable A)
    (on B E)
    (ontable C)
    (on D C)
    (on E F)
    (on F G)
    (ontable G)

    ;; initially clear tops
    (clear A)
    (clear B)
    (clear D)

    ;; single hand empty at start
    (handempty)

    ;; step counter: start at step0
    (step0)
  )

  ;; Goal: reach completion of the provided ordered action sequence (step10).
  ;; Note: the final arrangement is not written explicitly as a goal; the only
  ;; goal is that the serialized actions complete successfully. If the given
  ;; ordered actions are valid under the domain rules, the planner will reach
  ;; step10 and thus verify feasibility.
  (:goal (and
    (step10)
    (handempty)
  ))
)