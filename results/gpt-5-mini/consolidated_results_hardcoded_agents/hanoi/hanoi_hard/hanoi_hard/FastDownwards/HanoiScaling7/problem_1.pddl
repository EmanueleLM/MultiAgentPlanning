(define (problem hanoi6-problem)
  (:domain hanoi-6)

  (:objects
    ;; disks: A smallest ... F largest (mapped to d1..d6)
    d1 d2 d3 d4 d5 d6 - disk
    ;; pegs: left, middle, right
    pegL pegM pegR - peg
    ;; explicit discrete time steps 0..63 (63 moves required)
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32 t33 t34 t35 t36 t37 t38 t39 t40 t41 t42 t43 t44 t45 t46 t47 t48 t49 t50 t51 t52 t53 t54 t55 t56 t57 t58 t59 t60 t61 t62 t63 - time
  )

  (:init
    ;; Initial stack on the middle peg (top d1 ... bottom d6)
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 d6)
    (on d6 pegM)

    ;; Clear facts: top disk and empty pegs (left and right start empty)
    (clear d1)
    (clear pegL)
    (clear pegR)

    ;; Size ordering (strict): d6 largest ... d1 smallest
    (larger d6 d5) (larger d6 d4) (larger d6 d3) (larger d6 d2) (larger d6 d1)
    (larger d5 d4) (larger d5 d3) (larger d5 d2) (larger d5 d1)
    (larger d4 d3) (larger d4 d2) (larger d4 d1)
    (larger d3 d2) (larger d3 d1)
    (larger d2 d1)

    ;; Time pointer starts at t0
    (now t0)

    ;; Successor chain enforces contiguous single-step progression
    (next t0 t1) (next t1 t2) (next t2 t3) (next t3 t4) (next t4 t5) (next t5 t6) (next t6 t7) (next t7 t8)
    (next t8 t9) (next t9 t10) (next t10 t11) (next t11 t12) (next t12 t13) (next t13 t14) (next t14 t15) (next t15 t16)
    (next t16 t17) (next t17 t18) (next t18 t19) (next t19 t20) (next t20 t21) (next t21 t22) (next t22 t23) (next t23 t24)
    (next t24 t25) (next t25 t26) (next t26 t27) (next t27 t28) (next t28 t29) (next t29 t30) (next t30 t31) (next t31 t32)
    (next t32 t33) (next t33 t34) (next t34 t35) (next t35 t36) (next t36 t37) (next t37 t38) (next t38 t39) (next t39 t40)
    (next t40 t41) (next t41 t42) (next t42 t43) (next t43 t44) (next t44 t45) (next t45 t46) (next t46 t47) (next t47 t48)
    (next t48 t49) (next t49 t50) (next t50 t51) (next t51 t52) (next t52 t53) (next t53 t54) (next t54 t55) (next t55 t56)
    (next t56 t57) (next t57 t58) (next t58 t59) (next t59 t60) (next t60 t61) (next t61 t62) (next t62 t63)
  )

  (:goal (and
    ;; Goal stack on the right peg (top d1 ... bottom d6)
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 d6)
    (on d6 pegR)

    ;; Terminal clear conditions required by the specification
    (clear d1)    ;; top disk must be clear
    (clear pegL)  ;; left peg must be empty
    (clear pegM)  ;; middle peg must be empty

    ;; Enforce completion at time t63 (forces exactly 63 move actions)
    (now t63)
  ))
)