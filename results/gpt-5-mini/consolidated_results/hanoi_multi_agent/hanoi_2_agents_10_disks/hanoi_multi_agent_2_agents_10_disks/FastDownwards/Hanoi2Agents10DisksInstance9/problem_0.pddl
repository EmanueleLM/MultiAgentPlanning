(define (problem hanoi-two-agents-instance)
  (:domain hanoi-two-agents)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
  )

  (:init
    ;; initial stacked configuration (top-to-bottom): A,B,C,D,E,F,G,H,I,J on left
    ;; Representing 'on X Y' as X is directly on Y; bottom-most J is on peg left
    (on J left)
    (on I J)
    (on H I)
    (on G H)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; clear facts: true for any disk/peg that currently has nothing directly on it
    ;; initially only A is topmost of the whole stack; middle and right pegs are empty
    (clear A)
    (clear middle)
    (clear right)

    ;; agent move permissions (strict)
    (agent1 A)
    (agent1 B)
    (agent1 C)
    (agent1 D)
    (agent1 E)

    (agent2 F)
    (agent2 G)
    (agent2 H)
    (agent2 I)
    (agent2 J)

    ;; size ordering: larger ?big ?small is true when ?big is strictly larger than ?small
    ;; sizes: A < B < C < D < E < F < G < H < I < J
    ;; J larger than all smaller disks
    (larger J I) (larger J H) (larger J G) (larger J F) (larger J E) (larger J D) (larger J C) (larger J B) (larger J A)
    ;; I larger than all smaller disks
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
    ;; Goal configuration specified as:
    ;; left peg top-to-bottom: C,F,G,H,I,J
    ;; middle peg top-to-bottom: E
    ;; right peg top-to-bottom: A,B,D
    ;; Expressed with 'on' relations (top disk is on the disk below, bottom-most disks are on pegs)
    ;; left stack:
    (on C F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    ;; middle:
    (on E middle)

    ;; right:
    (on A B)
    (on B D)
    (on D right)
  ))
)