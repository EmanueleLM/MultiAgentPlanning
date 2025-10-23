(define (problem hanoi-5-left-to-right)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
  )

  (:init
    ; initial stack on left peg: top A on B on C on D on E on peg left
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-peg E left)

    ; clear status: only top disk A is clear; middle peg and right peg are empty
    (clear-disk A)
    (not (clear-disk B))
    (not (clear-disk C))
    (not (clear-disk D))
    (not (clear-disk E))

    (not (clear-peg left))
    (clear-peg middle)
    (clear-peg right)

    ; size ordering: A smallest, then B, then C, then D, then E largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  (:goal (and
    ; all disks moved to right peg in same order: A on B, B on C, C on D, D on E, and E on right peg
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-peg E right)
  ))
)