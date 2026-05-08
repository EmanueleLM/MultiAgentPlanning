(define (problem Hanoi2Agents15DisksInstance4)
  (:domain hanoi-cooperative-2agents)

  (:objects
    ; disks smallest->largest
    A B C D E F G H I J K L M N O - disk
    ; pegs
    left middle right - peg
    ; steps (15 moves => 16 step markers)
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - step
    ; agents
    agent_1 agent_2 - agent

    ; unify places: disks and pegs are subtypes of place
    ; (PDDL typing already provides that via :types in domain)
  )

  (:init
    ; Direct-support representation: initial top->bottom on left is A,B,C,...,O
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

    ; Initially only top disk A has nothing on top; empty pegs middle and right are clear.
    (clear A)
    (clear middle)
    (clear right)

    ; Static size ordering: A < B < C < D < E < F < G < H < I < J < K < L < M < N < O
    ;; A smaller than all larger disks
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller A G) (smaller A H) (smaller A I) (smaller A J) (smaller A K)
    (smaller A L) (smaller A M) (smaller A N) (smaller A O)
    ;; B smaller than all larger disks
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller B H) (smaller B I) (smaller B J) (smaller B K) (smaller B L)
    (smaller B M) (smaller B N) (smaller B O)
    ;; C
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller C I) (smaller C J) (smaller C K) (smaller C L) (smaller C M)
    (smaller C N) (smaller C O)
    ;; D
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I)
    (smaller D J) (smaller D K) (smaller D L) (smaller D M) (smaller D N)
    (smaller D O)
    ;; E
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller E K) (smaller E L) (smaller E M) (smaller E N) (smaller E O)
    ;; F
    (smaller F G) (smaller F H) (smaller F I) (smaller F J) (smaller F K)
    (smaller F L) (smaller F M) (smaller F N) (smaller F O)
    ;; G
    (smaller G H) (smaller G I) (smaller G J) (smaller G K) (smaller G L)
    (smaller G M) (smaller G N) (smaller G O)
    ;; H
    (smaller H I) (smaller H J) (smaller H K) (smaller H L) (smaller H M)
    (smaller H N) (smaller H O)
    ;; I
    (smaller I J) (smaller I K) (smaller I L) (smaller I M) (smaller I N)
    (smaller I O)
    ;; J
    (smaller J K) (smaller J L) (smaller J M) (smaller J N) (smaller J O)
    ;; K
    (smaller K L) (smaller K M) (smaller K N) (smaller K O)
    ;; L
    (smaller L M) (smaller L N) (smaller L O)
    ;; M
    (smaller M N) (smaller M O)
    ;; N
    (smaller N O)

    ; Permissions: agent_1 may move A..H; agent_2 may move I..O
    (permits agent_1 A) (permits agent_1 B) (permits agent_1 C) (permits agent_1 D)
    (permits agent_1 E) (permits agent_1 F) (permits agent_1 G) (permits agent_1 H)
    (permits agent_2 I) (permits agent_2 J) (permits agent_2 K) (permits agent_2 L)
    (permits agent_2 M) (permits agent_2 N) (permits agent_2 O)

    ; can-stack facts: any disk can be placed on any peg; disk->disk allowed only when smaller relation holds.
    ;; disk onto pegs
    (can-stack A left) (can-stack A middle) (can-stack A right)
    (can-stack B left) (can-stack B middle) (can-stack B right)
    (can-stack C left) (can-stack C middle) (can-stack C right)
    (can-stack D left) (can-stack D middle) (can-stack D right)
    (can-stack E left) (can-stack E middle) (can-stack E right)
    (can-stack F left) (can-stack F middle) (can-stack F right)
    (can-stack G left) (can-stack G middle) (can-stack G right)
    (can-stack H left) (can-stack H middle) (can-stack H right)
    (can-stack I left) (can-stack I middle) (can-stack I right)
    (can-stack J left) (can-stack J middle) (can-stack J right)
    (can-stack K left) (can-stack K middle) (can-stack K right)
    (can-stack L left) (can-stack L middle) (can-stack L right)
    (can-stack M left) (can-stack M middle) (can-stack M right)
    (can-stack N left) (can-stack N middle) (can-stack N right)
    (can-stack O left) (can-stack O middle) (can-stack O right)

    ;; disk onto disk allowed only when smaller relation holds (sample subset reflected exhaustively)
    ;; A can stack on any larger disk
    (can-stack A B) (can-stack A C) (can-stack A D) (can-stack A E) (can-stack A F)
    (can-stack A G) (can-stack A H) (can-stack A I) (can-stack A J) (can-stack A K)
    (can-stack A L) (can-stack A M) (can-stack A N) (can-stack A O)
    ;; B
    (can-stack B C) (can-stack B D) (can-stack B E) (can-stack B F) (can-stack B G)
    (can-stack B H) (can-stack B I) (can-stack B J) (can-stack B K) (can-stack B L)
    (can-stack B M) (can-stack B N) (can-stack B O)
    ;; C
    (can-stack C D) (can-stack C E) (can-stack C F) (can-stack C G) (can-stack C H)
    (can-stack C I) (can-stack C J) (can-stack C K) (can-stack C L) (can-stack C M)
    (can-stack C N) (can-stack C O)
    ;; D
    (can-stack D E) (can-stack D F) (can-stack D G) (can-stack D H) (can-stack D I)
    (can-stack D J) (can-stack D K) (can-stack D L) (can-stack D M) (can-stack D N)
    (can-stack D O)
    ;; E
    (can-stack E F) (can-stack E G) (can-stack E H) (can-stack E I) (can-stack E J)
    (can-stack E K) (can-stack E L) (can-stack E M) (can-stack E N) (can-stack E O)
    ;; F
    (can-stack F G) (can-stack F H) (can-stack F I) (can-stack F J) (can-stack F K)
    (can-stack F L) (can-stack F M) (can-stack F N) (can-stack F O)
    ;; G
    (can-stack G H) (can-stack G I) (can-stack G J) (can-stack G K) (can-stack G L)
    (can-stack G M) (can-stack G N) (can-stack G O)
    ;; H
    (can-stack H I) (can-stack H J) (can-stack H K) (can-stack H L) (can-stack H M)
    (can-stack H N) (can-stack H O)
    ;; I
    (can-stack I J) (can-stack I K) (can-stack I L) (can-stack I M) (can-stack I N)
    (can-stack I O)
    ;; J
    (can-stack J K) (can-stack J L) (can-stack J M) (can-stack J N) (can-stack J O)
    ;; K
    (can-stack K L) (can-stack K M) (can-stack K N) (can-stack K O)
    ;; L
    (can-stack L M) (can-stack L N) (can-stack L O)
    ;; M
    (can-stack M N) (can-stack M O)
    ;; N
    (can-stack N O)

    ; Phase control: start at s1
    (phase s1)

    ; Next step chain
    (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6)
    (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10) (next s10 s11)
    (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15) (next s15 s16)

    ; The allowed-move mapping encodes the exact direct-support move for each step so the planner
    ; can only execute the concrete sequence that corresponds to the proposed solution.
    ; Note: places in allowed-move are direct-support places (disk or peg), matching the (on ...) facts.

    ; 1) Move A from support B to support middle (A is top of left stack; support is disk B)
    (allowed-move s1 A B middle)
    ; 2) Move B from support C to support right
    (allowed-move s2 B C right)
    ; 3) Move A from support middle to support B
    (allowed-move s3 A middle B)
    ; 4) Move C from support D to support middle
    (allowed-move s4 C D middle)
    ; 5) Move A from support B to support D
    (allowed-move s5 A B D)
    ; 6) Move B from support right to support C
    (allowed-move s6 B right C)
    ; 7) Move A from support D to support B
    (allowed-move s7 A D B)
    ; 8) Move D from support E to support right
    (allowed-move s8 D E right)
    ; 9) Move A from support B to support E
    (allowed-move s9 A B E)
    ; 10) Move B from support C to support D
    (allowed-move s10 B C D)
    ; 11) Move A from support E to support B
    (allowed-move s11 A E B)
    ; 12) Move C from support middle to support E
    (allowed-move s12 C middle E)
    ; 13) Move A from support B to support C
    (allowed-move s13 A B C)
    ; 14) Move B from support D to support middle
    (allowed-move s14 B D middle)
    ; 15) Move A from support C to support D
    (allowed-move s15 A C D)
  )

  (:goal
    (and
      ;; Final configuration required by the human specification:
      ;; left peg (top->bottom): C, E, F, G, H, I, J, K, L, M, N, O
      (on C E)
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

      ;; middle peg has B (directly on middle)
      (on B middle)

      ;; right peg has (top->bottom) A, D
      (on A D)
      (on D right)
    )
  )
)