(define (problem Hanoi5Instance6)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on left: E bottom, then D, C, B, A top
    (on-peg E left)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)

    ;; clear markers
    (clear A)
    (clear-peg middle)
    (clear-peg right)

    ;; size ordering: bigger X Y means X strictly larger than Y
    (bigger B A)
    (bigger C A) (bigger C B)
    (bigger D A) (bigger D B) (bigger D C)
    (bigger E A) (bigger E B) (bigger E C) (bigger E D)
  )

  (:goal (and
    ;; all disks on right in same order: E bottom ... A top
    (on-peg E right)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)
    (clear A)
  ))
)