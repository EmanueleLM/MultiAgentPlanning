(define (problem Hanoi2Agents15DisksInstance20)
  (:domain tower-hanoi-multiagent)

  (:objects
    agent_1 agent_2 - agent
    left middle right A B C D E F G H I J K L M N O - place
  )

  (:init
    ; agent identity markers
    (is-agent1 agent_1)
    (is-agent2 agent_2)

    ; mark which places are pegs and which are disks
    (is-peg left) (is-peg middle) (is-peg right)
    (is-disk A) (is-disk B) (is-disk C) (is-disk D) (is-disk E) (is-disk F) (is-disk G) (is-disk H)
    (is-disk I) (is-disk J) (is-disk K) (is-disk L) (is-disk M) (is-disk N) (is-disk O)

    ; ownership: agent_1 owns A..H; agent_2 owns I..O
    (owner A agent_1) (owner B agent_1) (owner C agent_1) (owner D agent_1)
    (owner E agent_1) (owner F agent_1) (owner G agent_1) (owner H agent_1)
    (owner I agent_2) (owner J agent_2) (owner K agent_2) (owner L agent_2)
    (owner M agent_2) (owner N agent_2) (owner O agent_2)

    ; Initial stack on left (direct-on relations): top->bottom A on B, B on C, ..., N on O, O on left.
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

    ; Clear markers: top disk A is clear. Pegs middle and right are empty (clear).
    (clear A)
    (clear middle)
    (clear right)

    ; Size ordering (smaller relations): A < B < C < ... < O
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

  ; Global goal: left peg (top->bottom) D,E,F,G,H,I,J,K,L,M,N,O;
  ; middle peg (top->bottom) A,B; right peg (top->bottom) C.
  (:goal (and
    ; middle: A on B, B on middle
    (on A B)
    (on B middle)
    ; right: C on right
    (on C right)
    ; left: D on E, E on F, ..., N on O, O on left
    (on D E) (on E F) (on F G) (on G H) (on H I) (on I J) (on J K) (on K L) (on L M) (on M N) (on N O) (on O left)
    ; ensure top-of-pegs are clear for A (middle), C (right), and D (left)
    (clear A)
    (clear C)
    (clear D)
  ))
)