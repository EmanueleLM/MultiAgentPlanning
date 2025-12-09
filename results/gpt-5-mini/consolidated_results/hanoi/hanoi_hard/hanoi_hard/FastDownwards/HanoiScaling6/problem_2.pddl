(define (problem hanoi-6-disks-revised)
  (:domain hanoi-multiagent-revised)

  (:objects
    ;; concrete disk objects, assigned to size-specific subtypes to encode ordering
    diskA - diskA_type
    diskB - diskB_type
    diskC - diskC_type
    diskD - diskD_type
    diskE - diskE_type
    diskF - diskF_type

    left middle right - peg
  )

  (:init
    ;; Initial stack on left: top->bottom diskA, diskB, diskC, diskD, diskE, diskF
    (on diskA diskB)
    (on diskB diskC)
    (on diskC diskD)
    (on diskD diskE)
    (on diskE diskF)
    (on diskF left)

    ;; Top-clear facts initially (only positive facts; absent clear facts are false)
    (clear diskA)
    (clear middle)
    (clear right)
  )

  (:goal (and
    ;; final stack on right: bottom diskF on right, then diskE on diskF, ..., diskA on diskB
    (on diskF right)
    (on diskE diskF)
    (on diskD diskE)
    (on diskC diskD)
    (on diskB diskC)
    (on diskA diskB)

    ;; require both left and middle pegs to be empty at the end
    (clear left)
    (clear middle)
  ))
)