(define (problem Hanoi2Agents10DisksInstance9)
  (:domain hanoi-two-agents-10)

  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
  )

  (:init
    ;; initial stacked configuration (directly-on relations)
    ;; top-to-bottom on left: A,B,C,D,E,F,G,H,I,J
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

    ;; clear facts: topmost disk A is clear; middle and right pegs empty
    (clear A)
    (clear middle)
    (clear right)

    ;; agent permissions
    (agent1 A) (agent1 B) (agent1 C) (agent1 D) (agent1 E)
    (agent2 F) (agent2 G) (agent2 H) (agent2 I) (agent2 J)

    ;; size ordering (larger ?big ?small), with A smallest .. J largest
    ;; J larger than all smaller disks
    (larger J I) (larger J H) (larger J G) (larger J F) (larger J E) (larger J D) (larger J C) (larger J B) (larger J A)
    ;; I larger than smaller
    (larger I H) (larger I G) (larger I F) (larger I E) (larger I D) (larger I C) (larger I B) (larger I A)
    ;; H
    (larger H G) (larger H F) (larger H E) (larger H D) (larger H C) (larger H B) (larger H A)
    ;; G
    (larger G F) (larger G E) (larger G D) (larger G C) (larger G B) (larger G A)
    ;; F
    (larger F E) (larger F D) (larger F C) (larger F B) (larger F A)
    ;; E
    (larger E D) (larger E C) (larger E B) (larger E A)
    ;; D
    (larger D C) (larger D B) (larger D A)
    ;; C
    (larger C B) (larger C A)
    ;; B
    (larger B A)
  )

  (:goal (and
    ;; left peg top-to-bottom: C, F, G, H, I, J
    (on C F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    ;; middle peg: E on middle
    (on E middle)

    ;; right peg top-to-bottom: A, B, D
    (on A B)
    (on B D)
    (on D right)
  ))
)