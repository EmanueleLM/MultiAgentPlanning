(define (problem hanoi-4)
  (:domain hanoi-domain)
  (:objects
    A B C D - disk
    left middle right - peg
    ;; discrete time points 0..15 (minimal horizon for 4 disks: 2^4 - 1 = 15 moves; we include t0 .. t15)
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time
  )

  (:init
    ;; successor/time order
    (succ t0 t1) (succ t1 t2) (succ t2 t3) (succ t3 t4)
    (succ t4 t5) (succ t5 t6) (succ t6 t7) (succ t7 t8)
    (succ t8 t9) (succ t9 t10) (succ t10 t11) (succ t11 t12)
    (succ t12 t13) (succ t13 t14) (succ t14 t15)

    ;; initial stack on middle peg at time t0:
    ;; bottom D on the peg, C on D, B on C, A on B (A is top)
    (on D middle t0)
    (on C D t0)
    (on B C t0)
    (on A B t0)

    ;; initial clear/top facts at t0:
    (clear A t0)         ;; A is top of its stack
    (not (clear B t0))   ;; B has A on top (explicit negation used only as reference; initial facts cannot assert negations directly in PDDL init, so we omit explicit not facts in :init — we supply the positive clear facts required)
    ;; For clarity we assert only the positive clear facts here:
    ;; Pegs left and right are empty (their top positions are free)
    (clear left t0)
    (clear right t0)
    ;; middle peg is not clear at t0 because D (and above it) are on it — we do not assert (clear middle t0)

    ;; Size ordering (static facts)
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)
  )

  ;; Goal: entire tower moved to right peg with same order at final time t15
  (:goal (and
    (on D right t15)
    (on C D t15)
    (on B C t15)
    (on A B t15)
  ))
)