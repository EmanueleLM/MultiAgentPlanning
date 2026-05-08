(define (problem hanoi-5)
  (:domain hanoi-mover)

  (:objects
    d1 d2 d3 d4 d5 - disk
    left middle right - peg
    ; steps for the audited move sequence; an 'end' step to receive the final successor link
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10
    step11 step12 step13 step14 step15 step16 step17 step18 step19 step20
    step21 step22 step23 step24 step25 step26 step27 step28 step29 step30
    step31 end - step
  )

  (:init
    ; initial stack: all five disks on the right peg, largest (d5) at bottom, d1 smallest on top
    (on d5 right)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ; top-of-stack clear flags (only top disk and empty pegs are clear initially)
    (clear left)
    (clear middle)
    (not (clear right)) ; right peg initially has disks, so not clear
    (not (clear d5))
    (not (clear d4))
    (not (clear d3))
    (not (clear d2))
    (clear d1)

    ; size ordering (smaller X Y means X is strictly smaller than Y)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5)
    (smaller d3 d4) (smaller d3 d5)
    (smaller d4 d5)

    ; sequencing links (strict order enforced by ready/succ facts)
    (succ step1 step2) (succ step2 step3) (succ step3 step4) (succ step4 step5)
    (succ step5 step6) (succ step6 step7) (succ step7 step8) (succ step8 step9)
    (succ step9 step10) (succ step10 step11) (succ step11 step12) (succ step12 step13)
    (succ step13 step14) (succ step14 step15) (succ step15 step16) (succ step16 step17)
    (succ step17 step18) (succ step18 step19) (succ step19 step20) (succ step20 step21)
    (succ step21 step22) (succ step22 step23) (succ step23 step24) (succ step24 step25)
    (succ step25 step26) (succ step26 step27) (succ step27 step28) (succ step28 step29)
    (succ step29 step30) (succ step30 step31) (succ step31 end)

    ; start the sequence: only step1 is ready initially
    (ready step1)

    ; The allowed move bindings are derived from the mover's proposed sequence and
    ; validated by the auditor. Each allowed-* fact fixes which disk must move,
    ; from which place, and to which place (peg or disk) at that step.
    ; Step format: (allowed-peg STEP DISK FROM PEG) or (allowed-disk STEP DISK FROM TARGET-DISK)

    ; Steps 1..16 (first half moving top 4 disks to left, then disk5 to middle)
    (allowed-peg  step1  d1  right  middle)    ; 1: d1 R->M  (middle was empty)
    (allowed-peg  step2  d2  right  left)      ; 2: d2 R->L
    (allowed-disk  step3  d1  middle d2)       ; 3: d1 M->L onto d2
    (allowed-peg  step4  d3  right  middle)    ; 4: d3 R->M
    (allowed-disk  step5  d1  left   d4)      ; 5: d1 L->R onto d4
    (allowed-disk  step6  d2  left   d3)      ; 6: d2 L->M onto d3
    (allowed-disk  step7  d1  right  d2)      ; 7: d1 R->M onto d2
    (allowed-peg  step8  d4  right  left)     ; 8: d4 R->L
    (allowed-disk  step9  d1  middle d4)      ; 9: d1 M->L onto d4
    (allowed-disk  step10 d2  middle d5)      ;10: d2 M->R onto d5
    (allowed-disk  step11 d1  left   d2)      ;11: d1 L->R onto d2
    (allowed-disk  step12 d3  middle d4)      ;12: d3 M->L onto d4
    (allowed-peg  step13 d1  right  middle)   ;13: d1 R->M (middle empty)
    (allowed-disk  step14 d2  right  d3)      ;14: d2 R->L onto d3
    (allowed-disk  step15 d1  middle d2)      ;15: d1 M->L onto d2
    (allowed-peg  step16 d5  right  middle)   ;16: d5 R->M (middle empty)

    ; Steps 17..31 (move the 4-disk stack from left to middle)
    (allowed-peg  step17 d1  left   right)    ;17: d1 L->R
    (allowed-disk  step18 d2  left   d5)      ;18: d2 L->M onto d5
    (allowed-disk  step19 d1  right  d2)      ;19: d1 R->M onto d2
    (allowed-peg  step20 d3  left   right)    ;20: d3 L->R
    (allowed-disk  step21 d1  middle d4)      ;21: d1 M->L onto d4
    (allowed-disk  step22 d2  middle d3)      ;22: d2 M->R onto d3
    (allowed-disk  step23 d1  left   d2)      ;23: d1 L->R onto d2
    (allowed-disk  step24 d4  left   d5)      ;24: d4 L->M onto d5
    (allowed-disk  step25 d1  right  d4)      ;25: d1 R->M onto d4
    (allowed-peg  step26 d2  right  left)     ;26: d2 R->L
    (allowed-disk  step27 d1  middle d2)      ;27: d1 M->L onto d2
    (allowed-disk  step28 d3  right  d4)      ;28: d3 R->M onto d4
    (allowed-peg  step29 d1  left   right)    ;29: d1 L->R
    (allowed-disk  step30 d2  left   d3)      ;30: d2 L->M onto d3
    (allowed-disk  step31 d1  right  d2)      ;31: d1 R->M onto d2
  )

  (:goal
    (and
      ; final stack must be middle peg with d5 bottom .. d1 top
      (on d5 middle)
      (on d4 d5)
      (on d3 d4)
      (on d2 d3)
      (on d1 d2)

      ; left and right must be empty at the terminal state
      (clear left)
      (clear right)
    )
  )
)