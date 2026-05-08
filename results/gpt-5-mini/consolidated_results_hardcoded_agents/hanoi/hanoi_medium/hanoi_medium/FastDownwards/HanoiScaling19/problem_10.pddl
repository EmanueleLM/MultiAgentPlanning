(define (problem hanoi-5-right-to-left)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
    st0 st1 st2 st3 st4 st5 st6 st7 st8 st9 st10 st11 st12 st13 st14 st15 st16 st17 st18 st19 st20 st21 st22 st23 st24 st25 st26 st27 st28 st29 st30 st31 - step
  )

  (:init
    (succ st0 st1) (succ st1 st2) (succ st2 st3) (succ st3 st4)
    (succ st4 st5) (succ st5 st6) (succ st6 st7) (succ st7 st8)
    (succ st8 st9) (succ st9 st10) (succ st10 st11) (succ st11 st12)
    (succ st12 st13) (succ st13 st14) (succ st14 st15) (succ st15 st16)
    (succ st16 st17) (succ st17 st18) (succ st18 st19) (succ st19 st20)
    (succ st20 st21) (succ st21 st22) (succ st22 st23) (succ st23 st24)
    (succ st24 st25) (succ st25 st26) (succ st26 st27) (succ st27 st28)
    (succ st28 st29) (succ st29 st30) (succ st30 st31)

    (current st0)

    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)

    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-peg E right)

    (clear-disk A)
    (clear-peg left)
    (clear-peg middle)
  )

  (:goal (and
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-peg E left)

    (clear-peg middle)
    (clear-peg right)

    (current st31)
  ))