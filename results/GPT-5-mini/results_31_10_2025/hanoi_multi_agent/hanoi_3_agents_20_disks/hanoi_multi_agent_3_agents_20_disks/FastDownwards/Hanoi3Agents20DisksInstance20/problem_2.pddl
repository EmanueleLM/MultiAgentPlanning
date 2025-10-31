(define (problem hanoi3agents20-instance)
  (:domain hanoi-3agents-20)

  (:objects
    A B C D E F G H I J K L M N O P Q R S T - disk
    left middle right - peg
  )

  (:init
    ;; Type markers as unary predicates (kept for runtime tests)
    (is-peg left) (is-peg middle) (is-peg right)
    (is-disk A) (is-disk B) (is-disk C) (is-disk D) (is-disk E) (is-disk F) (is-disk G)
    (is-disk H) (is-disk I) (is-disk J) (is-disk K) (is-disk L) (is-disk M) (is-disk N)
    (is-disk O) (is-disk P) (is-disk Q) (is-disk R) (is-disk S) (is-disk T)

    ;; Agent permissions
    (can_move_agent1 A) (can_move_agent1 B) (can_move_agent1 C) (can_move_agent1 D)
    (can_move_agent1 E) (can_move_agent1 F) (can_move_agent1 G)

    (can_move_agent2 H) (can_move_agent2 I) (can_move_agent2 J) (can_move_agent2 K)
    (can_move_agent2 L) (can_move_agent2 M) (can_move_agent2 N)

    (can_move_agent3 O) (can_move_agent3 P) (can_move_agent3 Q) (can_move_agent3 R)
    (can_move_agent3 S) (can_move_agent3 T)

    ;; Initial configuration top -> bottom on left: A,B,C,...,T
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
    (on O P)
    (on P Q)
    (on Q R)
    (on R S)
    (on S T)
    (on T left)

    ;; Empty pegs initially
    (clear middle)
    (clear right)
    ;; Top disk A is clear
    (clear A)

    ;; Size ordering facts
    (larger B A)
    (larger C A) (larger C B)
    (larger D A) (larger D B) (larger D C)
    (larger E A) (larger E B) (larger E C) (larger E D)
    (larger F A) (larger F B) (larger F C) (larger F D) (larger F E)
    (larger G A) (larger G B) (larger G C) (larger G D) (larger G E) (larger G F)
    (larger H A) (larger H B) (larger H C) (larger H D) (larger H E) (larger H F) (larger H G)
    (larger I A) (larger I B) (larger I C) (larger I D) (larger I E) (larger I F) (larger I G) (larger I H)
    (larger J A) (larger J B) (larger J C) (larger J D) (larger J E) (larger J F) (larger J G) (larger J H) (larger J I)
    (larger K A) (larger K B) (larger K C) (larger K D) (larger K E) (larger K F) (larger K G) (larger K H) (larger K I) (larger K J)
    (larger L A) (larger L B) (larger L C) (larger L D) (larger L E) (larger L F) (larger L G) (larger L H) (larger L I) (larger L J) (larger L K)
    (larger M A) (larger M B) (larger M C) (larger M D) (larger M E) (larger M F) (larger M G) (larger M H) (larger M I) (larger M J) (larger M K) (larger M L)
    (larger N A) (larger N B) (larger N C) (larger N D) (larger N E) (larger N F) (larger N G) (larger N H) (larger N I) (larger N J) (larger N K) (larger N L) (larger N M)
    (larger O A) (larger O B) (larger O C) (larger O D) (larger O E) (larger O F) (larger O G) (larger O H) (larger O I) (larger O J) (larger O K) (larger O L) (larger O M) (larger O N)
    (larger P A) (larger P B) (larger P C) (larger P D) (larger P E) (larger P F) (larger P G) (larger P H) (larger P I) (larger P J) (larger P K) (larger P L) (larger P M) (larger P N) (larger P O)
    (larger Q A) (larger Q B) (larger Q C) (larger Q D) (larger Q E) (larger Q F) (larger Q G) (larger Q H) (larger Q I) (larger Q J) (larger Q K) (larger Q L) (larger Q M) (larger Q N) (larger Q O) (larger Q P)
    (larger R A) (larger R B) (larger R C) (larger R D) (larger R E) (larger R F) (larger R G) (larger R H) (larger R I) (larger R J) (larger R K) (larger R L) (larger R M) (larger R N) (larger R O) (larger R P) (larger R Q)
    (larger S A) (larger S B) (larger S C) (larger S D) (larger S E) (larger S F) (larger S G) (larger S H) (larger S I) (larger S J) (larger S K) (larger S L) (larger S M) (larger S N) (larger S O) (larger S P) (larger S Q) (larger S R)
    (larger T A) (larger T B) (larger T C) (larger T D) (larger T E) (larger T F) (larger T G) (larger T H) (larger T I) (larger T J) (larger T K) (larger T L) (larger T M) (larger T N) (larger T O) (larger T P) (larger T Q) (larger T R) (larger T S)
  )

  (:goal
    (and
      ;; Desired final stacks:
      ;; left peg: top->bottom A, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T
      ;; middle peg: B
      ;; right peg: C
      (on A D)
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
      (on O P)
      (on P Q)
      (on Q R)
      (on R S)
      (on S T)
      (on T left)

      (on B middle)
      (on C right)
    )
  )
)