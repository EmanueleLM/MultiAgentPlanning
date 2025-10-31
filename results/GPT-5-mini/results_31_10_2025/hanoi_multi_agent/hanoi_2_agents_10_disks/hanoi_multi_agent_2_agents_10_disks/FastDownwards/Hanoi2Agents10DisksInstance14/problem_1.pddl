(define (problem Hanoi2Agents10DisksInstance14)
  (:domain hanoi-multiagent)

  (:objects
    left middle right - peg
    A B C D E F G H I J - disk
  )

  (:init
    ;; initial stack (top -> bottom) on left: A, B, C, D, E, F, G, H, I, J
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

    ;; clear facts: top disk A is clear; middle and right pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; agent permissions
    (agent_1_can_move A)
    (agent_1_can_move B)
    (agent_1_can_move C)
    (agent_1_can_move D)
    (agent_1_can_move E)

    (agent_2_can_move F)
    (agent_2_can_move G)
    (agent_2_can_move H)
    (agent_2_can_move I)
    (agent_2_can_move J)

    ;; pegs are larger than any disk (allows placing a disk on an empty peg)
    (larger left A) (larger left B) (larger left C) (larger left D) (larger left E)
    (larger left F) (larger left G) (larger left H) (larger left I) (larger left J)

    (larger middle A) (larger middle B) (larger middle C) (larger middle D) (larger middle E)
    (larger middle F) (larger middle G) (larger middle H) (larger middle I) (larger middle J)

    (larger right A) (larger right B) (larger right C) (larger right D) (larger right E)
    (larger right F) (larger right G) (larger right H) (larger right I) (larger right J)

    ;; disk-to-disk larger relationships according to size order A < B < C < D < E < F < G < H < I < J
    ;; B larger than A
    (larger B A)
    ;; C larger than A,B
    (larger C A) (larger C B)
    ;; D larger than A,B,C
    (larger D A) (larger D B) (larger D C)
    ;; E larger than A,B,C,D
    (larger E A) (larger E B) (larger E C) (larger E D)
    ;; F larger than A,B,C,D,E
    (larger F A) (larger F B) (larger F C) (larger F D) (larger F E)
    ;; G larger than A..F
    (larger G A) (larger G B) (larger G C) (larger G D) (larger G E) (larger G F)
    ;; H larger than A..G
    (larger H A) (larger H B) (larger H C) (larger H D) (larger H E) (larger H F) (larger H G)
    ;; I larger than A..H
    (larger I A) (larger I B) (larger I C) (larger I D) (larger I E) (larger I F) (larger I G) (larger I H)
    ;; J larger than A..I
    (larger J A) (larger J B) (larger J C) (larger J D) (larger J E) (larger J F) (larger J G) (larger J H) (larger J I)
  )

  (:goal (and
    ;; left peg should have (top->bottom) F, G, H, I, J
    (on F left)
    (on G F)
    (on H G)
    (on I H)
    (on J I)

    ;; middle peg should have (top->bottom) A, E  => A on middle, E under A
    (on A middle)
    (on E A)

    ;; right peg should have (top->bottom) B, C, D  => B on right, C under B, D under C
    (on B right)
    (on C B)
    (on D C)
  ))

  ;; Validated merged plan (only agent_1 moves are required; agent_2 need not move)
  ;; PLAN (validated, each line corresponds to a single action in sequence):
  ; 1  (agent_1_move A left middle)
  ; 2  (agent_1_move B left right)
  ; 3  (agent_1_move A middle right)
  ; 4  (agent_1_move C left middle)
  ; 5  (agent_1_move A right left)
  ; 6  (agent_1_move B right middle)
  ; 7  (agent_1_move A left middle)
  ; 8  (agent_1_move D left right)
  ; 9  (agent_1_move A middle right)
  ; 10 (agent_1_move B middle left)
  ; 11 (agent_1_move A right left)
  ; 12 (agent_1_move C middle right)
  ; 13 (agent_1_move A left middle)
  ; 14 (agent_1_move B left right)
  ; 15 (agent_1_move A middle right)
  ; 16 (agent_1_move E left middle)
  ; 17 (agent_1_move A right middle)

)