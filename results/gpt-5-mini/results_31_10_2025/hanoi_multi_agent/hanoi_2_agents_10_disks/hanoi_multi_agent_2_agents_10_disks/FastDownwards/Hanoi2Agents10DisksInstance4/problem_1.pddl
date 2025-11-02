; Multi-agent Tower of Hanoi problem for Fast Downward
; Public info:
; - Pegs: left, middle, right
; - Disks: A (smallest) ... J (largest)
; - Agent 1 may move disks A B C D E
; - Agent 2 may move disks F G H I J
;
; The proposed concrete move sequence (issued by agent_1) is listed in the
; <proposed_solution> section above. Agent_2 performs no moves in that plan.
; This PDDL problem encodes the initial state and the goal configuration and
; enforces that only agent_1 can move A-E and only agent_2 can move F-J. The
; domain models legal Tower-of-Hanoi primitive moves; a planner using this
; domain/problem can verify the feasibility of achieving the goal.

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

    ; only the topmost disk A is clear; pegs middle and right are empty
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

    ; right peg empty is implied by no disk being on-peg right or on-disk chain rooted at right.
  ))
)