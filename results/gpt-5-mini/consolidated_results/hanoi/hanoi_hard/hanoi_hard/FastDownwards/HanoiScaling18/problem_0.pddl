(define (problem hanoi-6)
  (:domain hanoi)
  (:objects
    A B C D E F - disk
    left middle right - peg
  )
  (:init
    ;; initial stacked configuration on left: top->bottom A B C D E F
    (on A left)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)

    ;; top-of-stack and empty pegs
    (clear A)
    (clear middle)
    (clear right)

    ;; static size ordering: larger X Y means X is strictly larger than Y
    (larger F E) (larger F D) (larger F C) (larger F B) (larger F A)
    (larger E D) (larger E C) (larger E B) (larger E A)
    (larger D C) (larger D B) (larger D A)
    (larger C B) (larger C A)
    (larger B A)
  )

  ;; Final conditions:
  ;; - all disks must be stacked on the middle peg in the same order A (top) .. F (bottom)
  ;; - require that both stage markers were achieved in order during the plan execution:
  ;;   stage1 enforces that at some point A..E were on right and F remained on left,
  ;;   stage2 enforces that F was moved to middle while A..E were on right,
  ;;   which together enforce the top-level decomposition ordering described in the spec.
  (:goal (and
    (on A middle)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)
    (stage1)
    (stage2)
  ))
)