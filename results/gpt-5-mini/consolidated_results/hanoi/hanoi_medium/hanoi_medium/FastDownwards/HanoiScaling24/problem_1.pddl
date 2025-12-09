(define (problem hanoi-5-disks)
  (:domain hanoi-orchestrator)

  ;; Objects (untyped lists)
  (:objects
    a b c d e           ;; disks: a smallest ... e largest
    left middle right   ;; pegs
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31
  )

  ;; Initial state:
  ;; The entire tower is on the middle peg (top-to-bottom: a on b, b on c, c on d, d on e, e on middle).
  ;; left and right pegs are empty and clear. The active stage is t0.
  (:init
    ;; stacking
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e middle)

    ;; clear facts: top disk and empty pegs
    (clear a)
    (clear left)
    (clear right)

    ;; stage marker: start at t0
    (stage t0)

    ;; successor chain for 31 moves (minimal solution needs 31 moves for 5 disks)
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

  ;; Goal: after 31 moves (stage t31), the full tower is on the right peg in same order,
  ;; and left and middle pegs are empty (clear). Top disk a must be clear.
  (:goal
    (and
      ;; stacked on right: a on b, b on c, c on d, d on e, e on right
      (on a b)
      (on b c)
      (on c d)
      (on d e)
      (on e right)

      ;; left and middle must be empty (clear)
      (clear left)
      (clear middle)

      ;; top disk is clear
      (clear a)

      ;; terminal stage enforced exactly
      (stage t31)
    )
  )
)