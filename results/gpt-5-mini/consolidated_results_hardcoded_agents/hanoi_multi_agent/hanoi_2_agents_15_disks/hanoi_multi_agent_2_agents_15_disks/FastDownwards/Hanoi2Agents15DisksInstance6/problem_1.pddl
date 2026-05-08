; Problem: Hanoi 2-agents 15 disks (A..O), pegs: left middle right
; Public: initial all disks stacked on left (top A ... bottom O)
; Goal: left contains E..O (top E), middle contains A..D (top A), right empty
; Assumptions / notes:
; - Agent permissions are enforced: agent_1 may move A..H, agent_2 may move I..O.
; - The cooperative plan that moves A..D to middle can be executed entirely by agent_1.
; - Agent_2 is permitted to move I..O but does not need to move them for this goal.
; - The domain enforces that only the top disk of a peg/disk can be moved and forbids
;   placing a larger disk onto a smaller one via the (smaller ...) predicate.
(define (problem hanoi-multiagent-problem-15)
  (:domain hanoi-multiagent)

  (:objects
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
  )

  (:init
    ; Stack on left (immediate-on relations): top A on left, B on A, ..., O on N
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

    ; Only the top disk A is clear initially
    (clear A)

    ; Peg emptiness: middle and right are empty initially
    (peg-empty middle)
    (peg-empty right)

    ; Agent permissions
    (agent1-allowed A) (agent1-allowed B) (agent1-allowed C) (agent1-allowed D)
    (agent1-allowed E) (agent1-allowed F) (agent1-allowed G) (agent1-allowed H)

    (agent2-allowed I) (agent2-allowed J) (agent2-allowed K) (agent2-allowed L)
    (agent2-allowed M) (agent2-allowed N) (agent2-allowed O)

    ; Size ordering: declare all required smaller relations (A smallest, O largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K)
    (smaller A L) (smaller A M) (smaller A N) (smaller A O)

    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L)
    (smaller B M) (smaller B N) (smaller B O)

    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M)
    (smaller C N) (smaller C O)

    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I)
    (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N)
    (smaller D O)

    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O)

    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K)
    (smaller F L) (smaller F M) (smaller F N) (smaller F O)

    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L)
    (smaller G M) (smaller G N) (smaller G O)

    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M)
    (smaller H N) (smaller H O)

    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N)
    (smaller I O)

    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O)

    (smaller K L) (smaller K M) (smaller K N) (smaller K O)

    (smaller L M) (smaller L N) (smaller L O)

    (smaller M N) (smaller M O)

    (smaller N O)
  )

  (:goal (and
    ; middle peg must have A (top), B on A, C on B, D on C
    (on A middle)
    (on B A)
    (on C B)
    (on D C)

    ; left peg must have E (top) .. O (bottom)
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

    ; right peg empty
    (peg-empty right)
  ))