(define (problem Blocksworld20Instance15-prob)
  (:domain blocksworld20instance15)
  (:objects A B C D E F G H - block)
  (:init
    ;; initial on relations
    (on A E)
    (on E G)
    (on H A)
    (on B H)
    (on D C)

    ;; blocks on the table initially
    (ontable C)
    (ontable F)
    (ontable G)

    ;; clear (top) blocks initially
    (clear B)
    (clear D)
    (clear F)

    ;; single arm available
    (handempty)
  )

  ;; Goal corresponds exactly to the final arrangement derived from the action sequence
  (:goal (and
    (on A E)
    (on E G)
    (on H A)
    (on B H)
    (on F B)
    (ontable C)
    (ontable D)
    (ontable G)
  ))
)