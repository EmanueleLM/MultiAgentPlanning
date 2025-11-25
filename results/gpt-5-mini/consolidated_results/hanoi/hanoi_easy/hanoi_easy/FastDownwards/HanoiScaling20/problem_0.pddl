(define (problem hanoi4_serial-problem)
  (:domain hanoi4_serial)
  (:objects
    a b c d - disk
    left middle right - peg
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 step12 step13 step14 step15 step16 - step
  )

  (:init
    ;; initial direct support: Right peg has stack top->bottom a,b,c,d
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-peg  d right)

    ;; which peg each disk resides on (initially all on right)
    (loc a right)
    (loc b right)
    (loc c right)
    (loc d right)

    ;; clear-disk: only the top disk a has no disk on it
    (clear-disk a)
    ;; b, c, d have a disk above them initially, so not declared clear

    ;; clear-peg: left and middle are empty; right is not empty
    (clear-peg left)
    (clear-peg middle)
    ;; right not declared clear

    ;; sequencing: start at step1
    (current-step step1)
  )

  ;; final state requires all disks on the middle peg in order A (top), B, C, D (bottom),
  ;; and left and right pegs empty. Also require the sequencing to have reached step16,
  ;; to enforce that the full ordered sequence was executed.
  (:goal (and
    ;; direct support chain for final stack on middle: a on b, b on c, c on d, d on peg middle
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-peg  d middle)

    ;; location facts: all disks are on middle peg
    (loc a middle)
    (loc b middle)
    (loc c middle)
    (loc d middle)

    ;; pegs left and right are empty
    (clear-peg left)
    (clear-peg right)

    ;; ensure the serialized sequence completed
    (current-step step16)
  ))
)