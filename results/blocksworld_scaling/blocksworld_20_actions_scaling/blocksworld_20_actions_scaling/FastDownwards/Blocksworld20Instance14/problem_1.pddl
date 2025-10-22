(define (problem Blocksworld20Instance14-final)
  (:domain blocksworld)
  (:objects A B C D E F G H - block)

  (:init
    ;; initial placement as provided
    (on A B)
    (on B G)
    (on G C)
    (ontable C)
    (on H A)
    (on F H)
    (on E F)
    (ontable D)

    ;; initial clear blocks
    (clear E)
    (clear D)

    ;; arm initially empty
    (handempty)
  )

  (:goal
    (and
      ;; final arrangement derived from executing actions 1..20
      (on A B)
      (on B G)
      (on G C)
      (on H A)
      (on F H)
      (on D F)
      (ontable C)
      (ontable E)
    )
  )
)