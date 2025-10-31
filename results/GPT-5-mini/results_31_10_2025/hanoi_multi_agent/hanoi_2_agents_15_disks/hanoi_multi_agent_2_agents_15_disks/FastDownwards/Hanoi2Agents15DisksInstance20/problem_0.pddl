(define (problem hanoi-multiagent-instance)
  (:domain tower-hanoi-multiagent)

  (:objects
    agent1 agent2 - agent
    left middle right - peg
    A B C D E F G H I J K L M N O - disk
  )

  ; Initial configuration: stack on left (top->bottom) A, B, C, D, E, F, G, H, I, J, K, L, M, N, O.
  ; Represented as direct-on relations: A on B, B on C, ..., N on O, O on left.
  (:init
    ; agent identity markers
    (is-agent1 agent1)
    (is-agent2 agent2)

    ; ownership: only specified owners from agent inputs (do not invent owners)
    (owner A agent1)
    (owner B agent1)
    (owner C agent1)
    (owner I agent2)
    (owner J agent2)
    (owner K agent2)
    (owner L agent2)
    (owner M agent2)
    (owner N agent2)
    (owner O agent2)

    ; stack relations (direct-on)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J K)
    (on K L)
    (on L M)
    (on M N)
    (on N O)
    (on O left)

    ; clear markers: top disk A is clear (no disk on top).
    ; Pegs middle and right are empty (clear). Left is not clear initially because O is on left.
    (clear A)
    (clear middle)
    (clear right)

    ; size ordering: smaller relations for all pairs where first is smaller than second
    ; A < B..O
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K) (smaller A L) (smaller A M) (smaller A N) (smaller A O)
    ; B < C..O
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L) (smaller B M) (smaller B N) (smaller B O)
    ; C < D..O
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M) (smaller C N) (smaller C O)
    ; D < E..O
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N) (smaller D O)
    ; E < F..O
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J) (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O)
    ; F < G..O
    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K) (smaller F L) (smaller F M) (smaller F N) (smaller F O)
    ; G < H..O
    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L) (smaller G M) (smaller G N) (smaller G O)
    ; H < I..O
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M) (smaller H N) (smaller H O)
    ; I < J..O
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N) (smaller I O)
    ; J < K..O
    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O)
    ; K < L..O
    (smaller K L) (smaller K M) (smaller K N) (smaller K O)
    ; L < M..O
    (smaller L M) (smaller L N) (smaller L O)
    ; M < N,O
    (smaller M N) (smaller M O)
    ; N < O
    (smaller N O)
  )

  ; Goal configuration consistent with both agents' moves (and Tower of Hanoi rules).
  ; Goal: left (top->bottom) D, E, F, G, H, I, J, K, L, M, N, O
  ;       middle (top->bottom) A, B
  ;       right (top->bottom) C
  (:goal (and
    ; middle top->bottom A,B
    (on A B)
    (on B middle)
    ; right top->bottom C
    (on C right)
    ; left top->bottom D..O (D on E, E on F, ..., N on O, O on left)
    (on D E) (on E F) (on F G) (on G H) (on H I) (on I J) (on J K) (on K L) (on L M) (on M N) (on N O) (on O left)
    ; ensure top-of-pegs are clear for expected tops: A (middle), C (right), D (left)
    (clear A)
    (clear C)
    (clear D)
  ))
)