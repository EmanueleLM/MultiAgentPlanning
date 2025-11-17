(define (problem Hanoi2Agents10DisksInstance11)
  (:domain hanoi2agents)
  (:objects
    left middle right - peg
    A B C D E F G H I J - disk
    agent_1 agent_2 - agent
  )
  (:init
    ; Agent permissions
    (allowed-a1 A) (allowed-a1 B) (allowed-a1 C) (allowed-a1 D) (allowed-a1 E)
    (allowed-a2 F) (allowed-a2 G) (allowed-a2 H) (allowed-a2 I) (allowed-a2 J)

    ; Size ordering: larger X Y => X strictly larger than Y
    (larger J I) (larger J H) (larger J G) (larger J F) (larger J E) (larger J D) (larger J C) (larger J B) (larger J A)
    (larger I H) (larger I G) (larger I F) (larger I E) (larger I D) (larger I C) (larger I B) (larger I A)
    (larger H G) (larger H F) (larger H E) (larger H D) (larger H C) (larger H B) (larger H A)
    (larger G F) (larger G E) (larger G D) (larger G C) (larger G B) (larger G A)
    (larger F E) (larger F D) (larger F C) (larger F B) (larger F A)
    (larger E D) (larger E C) (larger E B) (larger E A)
    (larger D C) (larger D B) (larger D A)
    (larger C B) (larger C A)
    (larger B A)

    ; Initial stacking on left (top -> bottom)
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

    ; Clear statuses and empty pegs
    (clear A)
    (clear middle)
    (clear right)
  )

  (:goal (and
    ; Final configuration:
    ; Left: A on C on F on G on H on I on J on left
    (on J left)
    (on I J)
    (on H I)
    (on G H)
    (on F G)
    (on C F)
    (on A C)

    ; Middle: B on D on middle
    (on D middle)
    (on B D)

    ; Right: E on right
    (on E right)

    ; Top disks are clear
    (clear A)
    (clear B)
    (clear E)
  ))
)