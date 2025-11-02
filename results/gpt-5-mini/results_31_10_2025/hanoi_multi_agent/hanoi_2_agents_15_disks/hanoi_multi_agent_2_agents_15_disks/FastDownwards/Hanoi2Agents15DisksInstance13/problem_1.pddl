(define (problem Hanoi2Agents15DisksInstance13)
  (:domain hanoi-2agents-15)

  (:objects
    left middle right - peg
    A B C D E F G H I J K L M N O - disk
    agent_1 agent_2 - agent
    ;; pegs and disks are supports; when :typing requires subtyping it is expressed by using these objects when a predicate expects a support
    left_support middle_support right_support A_support B_support C_support D_support E_support F_support G_support H_support I_support J_support K_support L_support M_support N_support O_support - support
  )

  (:init
    ;; initial stacking on left (top -> bottom): A B C D E F G H I J K L M N O
    ;; Represent direct-on relations: each disk is directly on the support immediately below it.
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
    (on O left_support)

    ;; associate support names for pegs: note left, middle, right are pegs; we created separate support objects left_support etc.
    ;; We must make the pegs' supports clear initially if empty
    (clear A)
    (clear middle_support)
    (clear right_support)

    ;; link each peg support object to the corresponding peg via no explicit predicate (we rely on support objects being used consistently)
    ;; Permissions: agents may move only their designated disks
    (can-move agent_1 A)
    (can-move agent_1 B)
    (can-move agent_1 C)
    (can-move agent_1 D)
    (can-move agent_1 E)
    (can-move agent_1 F)
    (can-move agent_1 G)
    (can-move agent_1 H)

    (can-move agent_2 I)
    (can-move agent_2 J)
    (can-move agent_2 K)
    (can-move agent_2 L)
    (can-move agent_2 M)
    (can-move agent_2 N)
    (can-move agent_2 O)

    ;; size relations (smaller) A < B < C < ... < O
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

  (:goal
    (and
      ;; Goal configuration (as given in the specification):
      ;; left peg top-to-bottom: A C D F G H I J K L M N O
      (on A C)
      (on C D)
      (on D F)
      (on F G)
      (on G H)
      (on H I)
      (on I J)
      (on J K)
      (on K L)
      (on L M)
      (on M N)
      (on N O)
      (on O left_support)

      ;; middle peg top-to-bottom: E
      (on E middle_support)

      ;; right peg top-to-bottom: B
      (on B right_support)
    )
  )
)