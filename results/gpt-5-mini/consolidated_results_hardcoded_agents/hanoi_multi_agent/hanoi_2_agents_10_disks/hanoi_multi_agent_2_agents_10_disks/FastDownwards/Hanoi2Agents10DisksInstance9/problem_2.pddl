(define (problem Hanoi2Agents10DisksInstance9)
  (:domain hanoi-two-agents-10)

  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
  )

  (:init
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

    (clear A)
    (clear middle)
    (clear right)

    (agent1 A) (agent1 B) (agent1 C) (agent1 D) (agent1 E)
    (agent2 F) (agent2 G) (agent2 H) (agent2 I) (agent2 J)

    (larger J I) (larger J H) (larger J G) (larger J F) (larger J E) (larger J D) (larger J C) (larger J B) (larger J A)
    (larger I H) (larger I G) (larger I F) (larger I E) (larger I D) (larger I C) (larger I B) (larger I A)
    (larger H G) (larger H F) (larger H E) (larger H D) (larger H C) (larger H B) (larger H A)
    (larger G F) (larger G E) (larger G D) (larger G C) (larger G B) (larger G A)
    (larger F E) (larger F D) (larger F C) (larger F B) (larger F A)
    (larger E D) (larger E C) (larger E B) (larger E A)
    (larger D C) (larger D B) (larger D A)
    (larger C B) (larger C A)
    (larger B A)
  )

  (:goal (and
    (on C F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    (on E middle)

    (on A B)
    (on B D)
    (on D right)
  ))
)