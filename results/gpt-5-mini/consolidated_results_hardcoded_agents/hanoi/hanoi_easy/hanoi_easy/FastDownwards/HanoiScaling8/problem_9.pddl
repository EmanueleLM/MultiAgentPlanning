(define (problem hanoi-4)
  (:domain hanoi-domain)
  (:objects
    a b c d - disk
    left middle right - peg
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time
  )

  (:init
    ;; time successor chain for 15 moves
    (succ t0 t1) (succ t1 t2) (succ t2 t3) (succ t3 t4)
    (succ t4 t5) (succ t5 t6) (succ t6 t7) (succ t7 t8)
    (succ t8 t9) (succ t9 t10) (succ t10 t11) (succ t11 t12)
    (succ t12 t13) (succ t13 t14) (succ t14 t15)

    ;; start time
    (current t0)

    ;; initial stack on middle peg (bottom d, c, b, a top)
    (on-peg d middle)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; only the topmost disk is clear initially
    (clear-disk a)

    ;; empty pegs at start
    (clear-peg left)
    (clear-peg right)

    ;; static size ordering
    (smaller a b) (smaller a c) (smaller a d)
    (smaller b c) (smaller b d)
    (smaller c d)
  )

  (:goal (and
    ;; final stack on right peg (bottom d, c, b, a top)
    (on-peg d right)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; left and middle must be empty in the goal
    (clear-peg left)
    (clear-peg middle)

    ;; final time after 15 moves
    (current t15)
  ))
)