(define (problem Hanoi7Instance17)
  (:domain hanoi)
  (:objects
    A B C D E F G - disk
    left middle right - peg
    left_agent middle_agent right_agent orchestrator - agent
  )

  (:init
    (on-peg G left)
    (on-disk F G)
    (on-disk E F)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
    (agent-of left_agent left)
    (agent-of middle_agent middle)
    (agent-of right_agent right)
  )

  (:goal (and
    (on-peg G right)
    (on-disk F G)
    (on-disk E F)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)
  ))
)