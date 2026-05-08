(define (problem two-agent-hanoi-instance)
  :domain two-agent-hanoi
  :objects
    a b - disk
    left middle right - peg
  :init
    ;; initial stacking: a is on b, b is on the left peg; a is top of left peg
    (on-disk a b)
    (on-peg b left)
    (top left a)

    ;; other pegs empty initially
    (empty middle)
    (empty right)

    ;; size relation: a is smaller than b
    (smaller a b)
  :goal (and
    ;; goal: both disks on middle peg with b at bottom and a on top
    (on-peg b middle)
    (on-disk a b)
    (top middle a)
  )
)