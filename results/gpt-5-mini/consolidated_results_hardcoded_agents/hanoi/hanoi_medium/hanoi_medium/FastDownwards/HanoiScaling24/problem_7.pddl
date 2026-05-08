(define (problem hanoi-5-disks)
  (:domain hanoi-orchestrator)

  (:objects
    a b c d e           - disk
    left middle right   - peg

    ;; explicit stages t0 .. t31 for 31 ordered moves (minimal solution for 5 disks)
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 - stage
  )

  (:init
    ;; initial stacking (top-to-bottom on the middle peg): a on b, b on c, c on d, d on e, e on middle
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e middle)

    ;; clear facts: top disk and empty pegs (only top disk a and empty pegs left/right are clear)
    (clear a)
    (clear left)
    (clear right)

    ;; current stage starts at t0 (actions will advance the single current marker along next chain)
    (current t0)

    ;; explicit successor chain for 31 moves
    (next t0 t1) (next t1 t2) (next t2 t3) (next t3 t4) (next t4 t5)
    (next t5 t6) (next t6 t7) (next t7 t8) (next t8 t9) (next t9 t10)
    (next t10 t11) (next t11 t12) (next t12 t13) (next t13 t14) (next t14 t15)
    (next t15 t16) (next t16 t17) (next t17 t18) (next t18 t19) (next t19 t20)
    (next t20 t21) (next t21 t22) (next t22 t23) (next t23 t24) (next t24 t25)
    (next t25 t26) (next t26 t27) (next t27 t28) (next t28 t29) (next t29 t30)
    (next t30 t31)

    ;; static size ordering (a < b < c < d < e)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)
  )

  (:goal
    (and
      ;; final stacking on right (top-to-bottom): a on b, b on c, c on d, d on e, e on right
      (on a b)
      (on b c)
      (on c d)
      (on d e)
      (on e right)

      ;; left and middle must be empty (no disk directly on them)
      (clear left)
      (clear middle)

      ;; top disk clear
      (clear a)

      ;; terminal stage enforced exactly: the unique current stage must be the final stage t31
      (current t31)
    )
  )
)