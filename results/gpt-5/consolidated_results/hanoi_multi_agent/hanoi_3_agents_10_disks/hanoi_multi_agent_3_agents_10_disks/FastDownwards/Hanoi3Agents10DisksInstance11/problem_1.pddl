(define (problem Hanoi3Agents10DisksInstance11)
  (:domain hanoi3agents)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
    agent_1 agent_2 agent_3 - agent
  )

  ; Ordered cooperative plan (audited) as comments:
  ; agent_1: move disk A from left to middle
  ; agent_1: move disk B from left to right
  ; agent_1: move disk A from middle to right
  ; agent_1: move disk C from left to middle
  ; agent_1: move disk A from right to left
  ; agent_1: move disk B from right to middle
  ; agent_1: move disk A from left to middle
  ; agent_1: move disk D from left to right
  ; agent_1: move disk A from middle to right
  ; agent_1: move disk B from middle to left
  ; agent_1: move disk A from right to left
  ; agent_1: move disk C from middle to right
  ; agent_1: move disk A from left to middle
  ; agent_1: move disk B from left to right
  ; agent_1: move disk A from middle to right
  ; agent_2: move disk E from left to middle
  ; agent_1: move disk A from right to middle
  ; agent_1: move disk B from right to left
  ; agent_1: move disk A from middle to left
  ; agent_1: move disk C from right to middle

  (:init
    ; Initial stack: left has A (top) ... J (bottom); middle, right empty.
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on-peg J left)

    (clear A)
    (clear-peg middle)
    (clear-peg right)

    ; Agent movement permissions
    (can-move agent_1 A)
    (can-move agent_1 B)
    (can-move agent_1 C)
    (can-move agent_1 D)
    (can-move agent_2 E)
    (can-move agent_2 F)
    (can-move agent_2 G)
    (can-move agent_3 H)
    (can-move agent_3 I)
    (can-move agent_3 J)

    ; Size ordering A (smallest) ... J (largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)
  )

  (:goal (and
    ; Left peg: A (top), B, F, G, H, I, J (bottom)
    (on A B)
    (on B F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on-peg J left)

    ; Middle peg: C (top) on E (bottom)
    (on C E)
    (on-peg E middle)

    ; Right peg: D alone
    (on-peg D right)

    ; Ensure the three top disks are exposed
    (clear A)
    (clear C)
    (clear D)
  ))
)