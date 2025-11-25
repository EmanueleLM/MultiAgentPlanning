(define (problem hanoi3-problem)
  (:domain hanoi3)
  (:objects
    diskA diskB diskC diskD - disk
    left middle right - peg
  )
  (:init
    ;; size ordering (strict): A < B < C < D (and transitive pairs)
    (smaller diskA diskB)
    (smaller diskA diskC)
    (smaller diskA diskD)
    (smaller diskB diskC)
    (smaller diskB diskD)
    (smaller diskC diskD)

    ;; initial stacking: all disks on right in order (D bottom, C on D, B on C, A on B)
    (on-peg diskD right)
    (on-disk diskC diskD)
    (on-disk diskB diskC)
    (on-disk diskA diskB)

    ;; top and emptiness facts
    (top diskA right)
    (empty left)
    (empty middle)
    ;; right is not empty (omitted as a fact), left and middle explicitly empty
  )

  (:goal (and
    ;; all disks stacked on left in order D bottom -> C -> B -> A top
    (on-peg diskD left)
    (on-disk diskC diskD)
    (on-disk diskB diskC)
    (on-disk diskA diskB)
    (top diskA left)

    ;; middle and right must be empty
    (empty middle)
    (empty right)
  ))
)