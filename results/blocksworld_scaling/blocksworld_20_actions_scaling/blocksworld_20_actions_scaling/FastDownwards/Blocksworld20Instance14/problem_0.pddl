(define (problem blocks-final-arrangement)
  (:domain blocksworld)
  (:objects A B C D E F G H - block)

  (:init
    ;; initial placement (as provided in public information)
    (on A B)
    (on B G)
    (on G C)
    (ontable C)
    (on H A)
    (on F H)
    (on E F)
    (ontable D)

    ;; initial clear blocks: only the top blocks E and D
    (clear E)
    (clear D)

    ;; arm initially empty
    (handempty)
  )

  (:goal
    (and
      ;; final arrangement computed after applying actions 1..20
      (on A B)
      (on B G)
      (on G C)
      (ontable C)
      (on H A)
      (on F H)
      (on D F)
      (ontable E)
    )
  )
)