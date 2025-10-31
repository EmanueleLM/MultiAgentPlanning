(define (problem Hanoi2Agents15DisksInstance5)
  (:domain tower-hanoi-multiagent)

  ;; Objects
  (:objects
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
  )

  ;; Initial state: all disks stacked on left peg top(A) ... bottom(O)
  (:init
    ;; stack relationships (directly on)
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-disk H I)
    (on-disk I J)
    (on-disk J K)
    (on-disk K L)
    (on-disk L M)
    (on-disk M N)
    (on-disk N O)
    (on-peg O left)

    ;; clearance: only the top disk A is clear among disks; middle and right pegs empty
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ;; Agent capabilities (agent_1 may move A-H, agent_2 may move I-O)
    (agent1-disk A) (agent1-disk B) (agent1-disk C) (agent1-disk D)
    (agent1-disk E) (agent1-disk F) (agent1-disk G) (agent1-disk H)

    (agent2-disk I) (agent2-disk J) (agent2-disk K) (agent2-disk L)
    (agent2-disk M) (agent2-disk N) (agent2-disk O)

    ;; size ordering facts: smaller X Y iff X is strictly smaller than Y
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K) (smaller A L) (smaller A M) (smaller A N) (smaller A O)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L) (smaller B M) (smaller B N) (smaller B O)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M) (smaller C N) (smaller C O)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N) (smaller D O)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J) (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K) (smaller F L) (smaller F M) (smaller F N) (smaller F O)
    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L) (smaller G M) (smaller G N) (smaller G O)
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M) (smaller H N) (smaller H O)
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N) (smaller I O)
    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O)
    (smaller K L) (smaller K M) (smaller K N) (smaller K O)
    (smaller L M) (smaller L N) (smaller L O)
    (smaller M N) (smaller M O)
    (smaller N O)
  )

  ;; Goal state: left peg (top-to-bottom) B, D, E, F, G, H, I, J, K, L, M, N, O
  ;; middle peg (top-to-bottom) A, C
  ;; right peg empty (clear)
  (:goal (and
    ;; left stack: B on D, D on E, ..., N on O, O on left
    (on-disk B D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-disk H I)
    (on-disk I J)
    (on-disk J K)
    (on-disk K L)
    (on-disk L M)
    (on-disk M N)
    (on-disk N O)
    (on-peg O left)

    ;; middle stack: A on C, C on middle
    (on-disk A C)
    (on-peg C middle)

    ;; right peg empty
    (clear-peg right)
  ))
)

; -------------------------------------------------------------------------
; Integrated agent primitive move list (human-readable comment):
; The orchestrator received the following minimal, legal primitive moves from agent_1
; (agent_2 has no moves in the initial state because disks I..O are not clear):
;
; 1) agent_1: move disk A from left to middle
; 2) agent_1: move disk B from left to right
; 3) agent_1: move disk A from middle to right
; 4) agent_1: move disk C from left to middle
; 5) agent_1: move disk A from right to middle
; 6) agent_1: move disk B from right to left
;
; These six moves are a legal sequence under the Tower of Hanoi rules and the agent
; movement restrictions and yield the goal configuration encoded above.
; -------------------------------------------------------------------------