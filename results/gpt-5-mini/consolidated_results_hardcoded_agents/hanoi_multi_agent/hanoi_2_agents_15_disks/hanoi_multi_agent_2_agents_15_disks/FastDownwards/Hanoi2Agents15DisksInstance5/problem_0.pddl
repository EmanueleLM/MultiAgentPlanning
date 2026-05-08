(define (problem hanoi-15-agents)
  (:domain tower-hanoi-multiagent)

  ;; Objects: disks A..O (15 disks), pegs left/middle/right
  (:objects
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
  )

  ;; Initial state:
  ;; All 15 disks are stacked on the left peg in order (A is the smallest/top, O is largest/bottom):
  ;; Top-to-bottom: A on B on C ... on N on O on left
  (:init
    ;; placement (top-of-stack relationships)
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

    ;; topness / clearance: only A (top) is clear among disks; middle and right pegs are empty
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ;; Agent move responsibilities inferred from the provided primitive move lists:
    ;; Agent 1 proposed and executed moves only for disks A, B, C (these are the disks it moved).
    (agent1-disk A)
    (agent1-disk B)
    (agent1-disk C)

    ;; Agent 2 attempted to move disks I..O but cannot because they are not top; annotate capabilities accordingly.
    ;; This encodes the provided information that agent_2 addressed disks I–O (but these are currently not movable).
    (agent2-disk I)
    (agent2-disk J)
    (agent2-disk K)
    (agent2-disk L)
    (agent2-disk M)
    (agent2-disk N)
    (agent2-disk O)

    ;; Size ordering facts (smaller X Y means X is strictly smaller than Y).
    ;; These facts are necessary to enforce the Tower of Hanoi rule: a disk may only be placed on a larger disk.
    ;; Note: pairs are given for all ordered pairs where the first letter precedes the second in the alphabet.
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

  ;; Goal:
  ;; Move the entire tower from the left peg onto the right peg in the same stacking order (A top ... O bottom).
  ;; That is: A on B, B on C, ..., N on O, O on right.
  (:goal (and
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
    (on-peg O right)
  ))
)

; -------------------------------------------------------------------------
; Validation notes (human-readable comments)
; -------------------------------------------------------------------------
; 1) The provided primitive move list from agent_1:
;    1. move disk A from left to middle.
;    2. move disk B from left to right.
;    3. move disk A from middle to right.
;    4. move disk C from left to middle.
;    5. move disk A from right to middle.
;    6. move disk B from right to left.
;
;    This sequence is a valid partial sequence of legal Tower of Hanoi moves
;    starting from the initial state encoded above (all disks A..O stacked on left).
;    Each step respects the rules: only the top disk on a peg/disk is moved, and
;    a disk is only placed on an empty peg or on a strictly larger disk.
;    Therefore no correction is required for agent_1's proposed moves — they
;    constitute a legal prefix of a plan.
;
; 2) The provided information for agent_2 states:
;    "Agent_2 cannot move any of disks I–O because none of them are the top disk
;    on any peg (disks A–H are above them on the left peg); therefore there are
;    no valid agent_2 moves at this time."
;
;    This is encoded by marking disks I..O with (agent2-disk ...) but, because
;    those disks are not clear (they have smaller disks above them in the initial
;    stack), none of the agent2 move-actions are applicable in the initial state.
;
; 3) Minimal correction / additional notes:
;    - No corrections needed for agent_1's sequence: it is consistent with the
;      Tower of Hanoi constraints given the initial state.
;    - Agent_2 has no applicable moves in the provided initial state; to enable
;      agent_2 to move any of I..O, the smaller disks above them would first
;      need to be moved away by some sequence of agent actions (e.g., by agent_1
;      if permitted). That is the minimal change required to make any agent_2
;      action applicable.
;
; 4) Plan encoding:
;    - PDDL problems do not embed explicit sequential plans in the problem file;
;      the initial state and the goal are provided here. The agent_1 primitive
;      move list above is a valid prefix — a planner running on this domain/problem
;      may generate a plan that extends this prefix to reach the goal (all disks
;      moved to the right peg). For clarity, the valid prefix (as given) is:
;
;      1) (move-agent1-disk-to-peg A B middle)
;         -- corresponds to "move disk A from left to middle" under the
;         representation where A was on B and B was on C, etc.; implementation
;         detail: this first step removes (on-disk A B) and adds (on-peg A middle).
;
;      2) (move-agent1-peg-to-peg B left right)
;      3) (move-agent1-peg-to-peg A middle right)
;      4) (move-agent1-peg-to-disk C left middle)
;      5) (move-agent1-peg-to-disk A right middle)
;      6) (move-agent1-peg-to-peg B right left)
;
;    - The exact action parameterization above maps to the named actions in the
;      domain; a planner will produce the concrete action sequence in its output.
;
; End of comments.