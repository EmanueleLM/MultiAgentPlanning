(define (problem hanoi-6-multiagent)
  (:domain hanoi-multiagent)
  (:objects
    ; disks: d1 is smallest (top), d6 is largest (bottom)
    d1 d2 d3 d4 d5 d6 - disk

    left middle right - peg

    ; stages: 64 stages indexed t0 .. t63 to allow the canonical minimal solution length (63 moves)
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9
    t10 t11 t12 t13 t14 t15 t16 t17 t18 t19
    t20 t21 t22 t23 t24 t25 t26 t27 t28 t29
    t30 t31 t32 t33 t34 t35 t36 t37 t38 t39
    t40 t41 t42 t43 t44 t45 t46 t47 t48 t49
    t50 t51 t52 t53 t54 t55 t56 t57 t58 t59
    t60 t61 t62 t63 - stage
  )

  (:init
    ; successor relation for contiguous stages
    (succ t0 t1) (succ t1 t2) (succ t2 t3) (succ t3 t4)
    (succ t4 t5) (succ t5 t6) (succ t6 t7) (succ t7 t8)
    (succ t8 t9) (succ t9 t10) (succ t10 t11) (succ t11 t12)
    (succ t12 t13) (succ t13 t14) (succ t14 t15) (succ t15 t16)
    (succ t16 t17) (succ t17 t18) (succ t18 t19) (succ t19 t20)
    (succ t20 t21) (succ t21 t22) (succ t22 t23) (succ t23 t24)
    (succ t24 t25) (succ t25 t26) (succ t26 t27) (succ t27 t28)
    (succ t28 t29) (succ t29 t30) (succ t30 t31) (succ t31 t32)
    (succ t32 t33) (succ t33 t34) (succ t34 t35) (succ t35 t36)
    (succ t36 t37) (succ t37 t38) (succ t38 t39) (succ t39 t40)
    (succ t40 t41) (succ t41 t42) (succ t42 t43) (succ t43 t44)
    (succ t44 t45) (succ t45 t46) (succ t46 t47) (succ t47 t48)
    (succ t48 t49) (succ t49 t50) (succ t50 t51) (succ t51 t52)
    (succ t52 t53) (succ t53 t54) (succ t54 t55) (succ t55 t56)
    (succ t56 t57) (succ t57 t58) (succ t58 t59) (succ t59 t60)
    (succ t60 t61) (succ t61 t62) (succ t62 t63)

    ; initial configuration at stage t0:
    ; Right peg holds from top to bottom: d1, d2, d3, d4, d5, d6
    (on-peg d1 right t0)
    (on-disk d2 d1 t0)
    (on-disk d3 d2 t0)
    (on-disk d4 d3 t0)
    (on-disk d5 d4 t0)
    (on-disk d6 d5 t0)

    ; top disk on right peg at t0 is d1
    (top d1 right t0)

    ; left and middle are empty at t0
    (empty left t0)
    (empty middle t0)

    ; size ordering (static): d1 < d2 < d3 < d4 < d5 < d6
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6)
    (smaller d4 d5) (smaller d4 d6)
    (smaller d5 d6)
  )

  ; Goal: reconstruct entire tower on the middle peg at final stage t63,
  ; with left and right pegs empty at t63.
  (:goal
    (and
      (on-peg d1 middle t63)
      (on-disk d2 d1 t63)
      (on-disk d3 d2 t63)
      (on-disk d4 d3 t63)
      (on-disk d5 d4 t63)
      (on-disk d6 d5 t63)

      (top d1 middle t63)

      (empty left t63)
      (empty right t63)
    )
  )
)