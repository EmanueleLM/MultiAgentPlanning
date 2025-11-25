(define (problem hanoi-4)
  (:domain hanoi-domain)
  (:objects
    A B C D - disk
    left middle right - peg
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time
  )

  (:init
    ;; successor/time order (15 moves needed for 4 disks)
    (succ t0 t1) (succ t1 t2) (succ t2 t3) (succ t3 t4)
    (succ t4 t5) (succ t5 t6) (succ t6 t7) (succ t7 t8)
    (succ t8 t9) (succ t9 t10) (succ t10 t11) (succ t11 t12)
    (succ t12 t13) (succ t13 t14) (succ t14 t15)

    ;; start at stage t0
    (current t0)

    ;; initial stack on middle peg (bottom to top: D, C, B, A)
    (on-peg D middle)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)

    ;; top/empty facts at start:
    (clear-disk A)      ;; A is top
    (clear-peg left)
    (clear-peg right)

    ;; static size ordering
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)
  )

  (:goal (and
    ;; final stack on right peg identical order (bottom to top D,C,B,A)
    (on-peg D right)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)

    ;; left and middle pegs must be empty
    (clear-peg left)
    (clear-peg middle)

    ;; and we must have advanced to final stage after 15 moves
    (current t15)
  ))
)