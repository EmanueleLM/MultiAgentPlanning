; Multi-agent Tower of Hanoi problem for Fast Downward
; Public info:
; - Pegs: left, middle, right
; - Disks: A (smallest) ... J (largest)
; - Agent 1 may move disks A B C D E
; - Agent 2 may move disks F G H I J
;
; Provided move sequence from agent_1 (validated):
; 1 agent_1: move disk A from left to right
; 2 agent_1: move disk B from left to middle
; 3 agent_1: move disk A from right to middle
; 4 agent_1: move disk C from left to right
; 5 agent_1: move disk A from middle to left
; 6 agent_1: move disk B from middle to right
; 7 agent_1: move disk A from left to right
; 8 agent_1: move disk D from left to middle
; 9 agent_1: move disk A from right to middle
; 10 agent_1: move disk B from right to left
; 11 agent_1: move disk A from middle to left
; 12 agent_1: move disk C from right to middle
; 13 agent_1: move disk A from left to middle
;
; Agent_2 provided no moves.
; Validation note: The above sequence was checked against Tower of Hanoi rules
; (only one disk moved at a time, no disk placed on a smaller disk) and agent
; movement restrictions (agent_1 moves only A-E). The sequence is legal and
; achieves the stated goal. No corrections were necessary.

(define (problem multi-agent-hanoi-problem)
  (:domain multi-agent-hanoi)

  (:objects
    ; disks
    A B C D E F G H I J - disk
    ; pegs
    left middle right - peg
  )

  (:init
    ; initial stack left top-to-bottom: A B C D E F G H I J
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-disk H I)
    (on-disk I J)
    (on-peg  J left)

    ; clear predicates: only top disk A is clear; middle and right pegs empty
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ; agent capabilities
    (agent1-disk A) (agent1-disk B) (agent1-disk C) (agent1-disk D) (agent1-disk E)
    (agent2-disk F) (agent2-disk G) (agent2-disk H) (agent2-disk I) (agent2-disk J)

    ; size ordering (smaller x y indicates x is strictly smaller than y)
    ; A < B < C < D < E < F < G < H < I < J
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)
  )

  (:goal (and
    ; Goal configuration:
    ; left peg top-to-bottom: B E F G H I J
    (on-disk B E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-disk H I)
    (on-disk I J)
    (on-peg  J left)

    ; middle peg top-to-bottom: A C D
    (on-disk A C)
    (on-disk C D)
    (on-peg  D middle)

    ; right peg empty is implied by absence of any on-peg or on-disk facts for right;
    ; no explicit predicate required here beyond the stacks above.
    ))
)