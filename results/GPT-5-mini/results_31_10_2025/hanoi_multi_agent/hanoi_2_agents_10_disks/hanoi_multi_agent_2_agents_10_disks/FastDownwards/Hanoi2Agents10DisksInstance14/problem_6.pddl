(define (problem Hanoi2Agents10DisksInstance14)
  (:domain hanoi-multiagent)

  (:objects
    left middle right - peg
    A B C D E F G H I J - disk
  )

  (:init
    ;; Initial stack (top -> bottom) on left: A, B, C, D, E, F, G, H, I, J
    ;; Represented as "on top_disk below_object"
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

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
    ;; top F on G, G on H, H on I, I on J, J on left
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    ;; middle peg should have (top->bottom) A, E  => A on E, E on middle
    (on A E)
    (on E middle)

    ;; right peg should have (top->bottom) B, C, D  => B on C, C on D, D on right
    (on B C)
    (on C D)
    (on D right)
  ))
)