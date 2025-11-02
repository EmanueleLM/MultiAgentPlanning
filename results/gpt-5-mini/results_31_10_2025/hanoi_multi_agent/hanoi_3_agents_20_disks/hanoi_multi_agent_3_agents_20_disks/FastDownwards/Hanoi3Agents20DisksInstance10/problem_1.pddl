(define (problem Hanoi3Agents20DisksInstance10) 
  (:domain hanoi-3agents-20disks)

  (:objects
    A B C D E F G H I J K L M N O P Q R S T - disk
    left middle right - peg
    agent_1 agent_2 agent_3 orchestrator - agent
    ;; pegs and disks are all objs by their types in domain
  )

  (:init
    ;; Initial stacking on left: top->bottom A,B,C,...,T
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

    ;; Top-of-stack / emptiness
    (clear A)
    (clear middle)
    (clear right)
    ;; left is not clear because T is on left and has S above it, so left omitted as clear

    ;; Movement permissions (agent -> disks)
    ;; agent_1: A-G
    (can-move agent_1 A) (can-move agent_1 B) (can-move agent_1 C)
    (can-move agent_1 D) (can-move agent_1 E) (can-move agent_1 F) (can-move agent_1 G)
    ;; agent_2: H-N
    (can-move agent_2 H) (can-move agent_2 I) (can-move agent_2 J)
    (can-move agent_2 K) (can-move agent_2 L) (can-move agent_2 M) (can-move agent_2 N)
    ;; agent_3: O-T
    (can-move agent_3 O) (can-move agent_3 P) (can-move agent_3 Q)
    (can-move agent_3 R) (can-move agent_3 S) (can-move agent_3 T)
    ;; orchestrator has no can-move facts (does not move disks)

    ;; Size ordering: bigger X Y means X is strictly larger than disk Y.
    ;; For pegs: every peg is treated as larger than every disk (pegs can receive any disk when empty).
    ;; Pegs bigger than disks:
    (bigger left A) (bigger left B) (bigger left C) (bigger left D) (bigger left E) (bigger left F)
    (bigger left G) (bigger left H) (bigger left I) (bigger left J) (bigger left K) (bigger left L)
    (bigger left M) (bigger left N) (bigger left O) (bigger left P) (bigger left Q) (bigger left R)
    (bigger left S) (bigger left T)
    (bigger middle A) (bigger middle B) (bigger middle C) (bigger middle D) (bigger middle E) (bigger middle F)
    (bigger middle G) (bigger middle H) (bigger middle I) (bigger middle J) (bigger middle K) (bigger middle L)
    (bigger middle M) (bigger middle N) (bigger middle O) (bigger middle P) (bigger middle Q) (bigger middle R)
    (bigger middle S) (bigger middle T)
    (bigger right A) (bigger right B) (bigger right C) (bigger right D) (bigger right E) (bigger right F)
    (bigger right G) (bigger right H) (bigger right I) (bigger right J) (bigger right K) (bigger right L)
    (bigger right M) (bigger right N) (bigger right O) (bigger right P) (bigger right Q) (bigger right R)
    (bigger right S) (bigger right T)

    ;; Disk-to-disk bigger relations (disk X is bigger than disk Y if X is lower in the initial stack)
    ;; T is largest, then S, ..., A smallest.
    ;; For clarity we enumerate all pairs X > Y.
    ;; T bigger than all others:
    (bigger T A) (bigger T B) (bigger T C) (bigger T D) (bigger T E) (bigger T F)
    (bigger T G) (bigger T H) (bigger T I) (bigger T J) (bigger T K) (bigger T L)
    (bigger T M) (bigger T N) (bigger T O) (bigger T P) (bigger T Q) (bigger T R)
    (bigger T S)
    ;; S bigger than A..R
    (bigger S A) (bigger S B) (bigger S C) (bigger S D) (bigger S E) (bigger S F)
    (bigger S G) (bigger S H) (bigger S I) (bigger S J) (bigger S K) (bigger S L)
    (bigger S M) (bigger S N) (bigger S O) (bigger S P) (bigger S Q) (bigger S R)
    ;; R bigger than A..Q
    (bigger R A) (bigger R B) (bigger R C) (bigger R D) (bigger R E) (bigger R F)
    (bigger R G) (bigger R H) (bigger R I) (bigger R J) (bigger R K) (bigger R L)
    (bigger R M) (bigger R N) (bigger R O) (bigger R P) (bigger R Q)
    ;; Q bigger than A..P
    (bigger Q A) (bigger Q B) (bigger Q C) (bigger Q D) (bigger Q E) (bigger Q F)
    (bigger Q G) (bigger Q H) (bigger Q I) (bigger Q J) (bigger Q K) (bigger Q L)
    (bigger Q M) (bigger Q N) (bigger Q O) (bigger Q P)
    ;; P bigger than A..O
    (bigger P A) (bigger P B) (bigger P C) (bigger P D) (bigger P E) (bigger P F)
    (bigger P G) (bigger P H) (bigger P I) (bigger P J) (bigger P K) (bigger P L)
    (bigger P M) (bigger P N) (bigger P O)
    ;; O bigger than A..N
    (bigger O A) (bigger O B) (bigger O C) (bigger O D) (bigger O E) (bigger O F)
    (bigger O G) (bigger O H) (bigger O I) (bigger O J) (bigger O K) (bigger O L)
    (bigger O M) (bigger O N)
    ;; N bigger than A..M
    (bigger N A) (bigger N B) (bigger N C) (bigger N D) (bigger N E) (bigger N F)
    (bigger N G) (bigger N H) (bigger N I) (bigger N J) (bigger N K) (bigger N L)
    (bigger N M)
    ;; M bigger than A..L
    (bigger M A) (bigger M B) (bigger M C) (bigger M D) (bigger M E) (bigger M F)
    (bigger M G) (bigger M H) (bigger M I) (bigger M J) (bigger M K) (bigger M L)
    ;; L bigger than A..K
    (bigger L A) (bigger L B) (bigger L C) (bigger L D) (bigger L E) (bigger L F)
    (bigger L G) (bigger L H) (bigger L I) (bigger L J) (bigger L K)
    ;; K bigger than A..J
    (bigger K A) (bigger K B) (bigger K C) (bigger K D) (bigger K E) (bigger K F)
    (bigger K G) (bigger K H) (bigger K I) (bigger K J)
    ;; J bigger than A..I
    (bigger J A) (bigger J B) (bigger J C) (bigger J D) (bigger J E) (bigger J F)
    (bigger J G) (bigger J H) (bigger J I)
    ;; I bigger than A..H
    (bigger I A) (bigger I B) (bigger I C) (bigger I D) (bigger I E) (bigger I F)
    (bigger I G) (bigger I H)
    ;; H bigger than A..G
    (bigger H A) (bigger H B) (bigger H C) (bigger H D) (bigger H E) (bigger H F) (bigger H G)
    ;; G bigger than A..F
    (bigger G A) (bigger G B) (bigger G C) (bigger G D) (bigger G E) (bigger G F)
    ;; F bigger than A..E
    (bigger F A) (bigger F B) (bigger F C) (bigger F D) (bigger F E)
    ;; E bigger than A..D
    (bigger E A) (bigger E B) (bigger E C) (bigger E D)
    ;; D bigger than A..C
    (bigger D A) (bigger D B) (bigger D C)
    ;; C bigger than A..B
    (bigger C A) (bigger C B)
    ;; B bigger than A
    (bigger B A)
  )

  (:goal
    (and
      ;; Left peg target stack top->bottom: B, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T
      (on B D)
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

      ;; Middle peg target stack top->bottom: A, C
      (on A C)
      (on C middle)

      ;; Right peg should be empty implicitly (no (on ? right) facts are required in the goal)
    )
  )
)