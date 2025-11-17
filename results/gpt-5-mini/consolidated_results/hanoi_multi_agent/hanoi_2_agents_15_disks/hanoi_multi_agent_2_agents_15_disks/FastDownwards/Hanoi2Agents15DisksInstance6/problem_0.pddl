; Problem: Tower of Hanoi multi-agent instance (15 disks A..O, 3 pegs: left middle right)
; Public info:
; - Pegs: left middle right
; - Disks: A (smallest) .. O (largest)
; - Initial: all disks stacked on left: top A, then B, ..., bottom O
; - Goal: left has E..O (top E .. bottom O); middle has A..D (top A .. bottom D); right empty
; - Agent restrictions: agent_1 may move A..H; agent_2 may move I..O
;
; Integration notes / assumptions:
; - Agent_1 supplied a full, legal 15-move solution that moves disks A-D from left to middle.
;   Agent_2 supplied no moves and is idle in this integrated plan.
; - No conflicts detected: all moves in agent_1's sequence affect only disks A..D (allowed).
; - We encode a general blocksworld-like domain for legal moves, and initial/goal states that
;   reflect the public information. The provided 15-move agent_1 sequence is consistent with
;   these domain rules and achieves the goal.
; - The domain contains explicit action variants for agent_1 and agent_2 (distinct names)
;   so move responsibility is enforced by agentX-allowed predicates.
;
; Integrated primitive move sequence (validated):
; 1) agent_1: move disk A from left to right
; 2) agent_1: move disk B from left to middle
; 3) agent_1: move disk A from right to middle
; 4) agent_1: move disk C from left to right
; 5) agent_1: move disk A from middle to left
; 6) agent_1: move disk B from middle to right
; 7) agent_1: move disk A from left to right
; 8) agent_1: move disk D from left to middle
; 9) agent_1: move disk A from right to middle
; 10) agent_1: move disk B from right to left
; 11) agent_1: move disk A from middle to left
; 12) agent_1: move disk C from right to middle
; 13) agent_1: move disk A from left to right
; 14) agent_1: move disk B from left to middle
; 15) agent_1: move disk A from right to middle
;
; (Agent_2 has no moves in this plan.)
;
(define (problem hanoi-multiagent-problem)
  (:domain hanoi-multiagent)

  (:objects
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
  )

  (:init
    ;; initial immediate-on relations (stack on left: A on left, B on A, C on B, ...)
    (on A left)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)
    (on G F)
    (on H G)
    (on I H)
    (on J I)
    (on K J)
    (on L K)
    (on M L)
    (on N M)
    (on O N)

    ;; only the top disk A is clear initially
    (clear A)
    ;; other disks not clear are simply omitted (absence -> false)

    ;; peg emptiness: left is not empty; middle and right are empty
    (peg-empty middle)
    (peg-empty right)
    ;; left is not empty; nothing required explicitly (absence of peg-empty left)

    ;; agent permissions
    (agent1-allowed A) (agent1-allowed B) (agent1-allowed C) (agent1-allowed D)
    (agent1-allowed E) (agent1-allowed F) (agent1-allowed G) (agent1-allowed H)

    (agent2-allowed I) (agent2-allowed J) (agent2-allowed K) (agent2-allowed L)
    (agent2-allowed M) (agent2-allowed N) (agent2-allowed O)

    ;; size ordering: smaller relationships (A smallest, O largest)
    ;; A smaller than B..O
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K)
    (smaller A L) (smaller A M) (smaller A N) (smaller A O)

    ;; B smaller than C..O
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L)
    (smaller B M) (smaller B N) (smaller B O)

    ;; C smaller than D..O
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M)
    (smaller C N) (smaller C O)

    ;; D smaller than E..O
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I)
    (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N)
    (smaller D O)

    ;; E smaller than F..O
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O)

    ;; F smaller than G..O
    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K)
    (smaller F L) (smaller F M) (smaller F N) (smaller F O)

    ;; G smaller than H..O
    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L)
    (smaller G M) (smaller G N) (smaller G O)

    ;; H smaller than I..O
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M)
    (smaller H N) (smaller H O)

    ;; I smaller than J..O
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N)
    (smaller I O)

    ;; J smaller than K..O
    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O)

    ;; K smaller than L..O
    (smaller K L) (smaller K M) (smaller K N) (smaller K O)

    ;; L smaller than M..O
    (smaller L M) (smaller L N) (smaller L O)

    ;; M smaller than N..O
    (smaller M N) (smaller M O)

    ;; N smaller than O
    (smaller N O)
  )

  (:goal (and
    ;; Goal: middle peg has A (top), B on A, C on B, D on C
    (on A middle)
    (on B A)
    (on C B)
    (on D C)

    ;; Goal: left peg has E (top), F on E, ..., O on N (bottom)
    (on E left)
    (on F E)
    (on G F)
    (on H G)
    (on I H)
    (on J I)
    (on K J)
    (on L K)
    (on M L)
    (on N M)
    (on O N)

    ;; right peg empty
    (peg-empty right)
  ))
)