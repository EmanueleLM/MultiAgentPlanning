(define (problem hanoi-two-agent-10)
  (:domain hanoi-two-agent)
  (:objects
    agent_1 agent_2 - agent
    left middle right - peg
    A B C D E F G H I J - disk
  )
  (:init
    ; initial stack on left: A on left, B on A, C on B, D on C, E on D, F on E, G on F, H on G, I on H, J on I
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

    ; initial clear predicates
    (clear A)
    (clear middle)
    (clear right)

    ; agent movement permissions
    (can-move agent_1 A)
    (can-move agent_1 B)
    (can-move agent_1 C)
    (can-move agent_1 D)
    (can-move agent_1 E)
    (can-move agent_2 F)
    (can-move agent_2 G)
    (can-move agent_2 H)
    (can-move agent_2 I)
    (can-move agent_2 J)

    ; smaller relations (first is smaller than second)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)
  )
  (:goal
    (and
      ; right has A on B on C on D on right
      (on D right)
      (on C D)
      (on B C)
      (on A B)

      ; left has E on F on G on H on I on J on left
      (on J left)
      (on I J)
      (on H I)
      (on G H)
      (on F G)
      (on E F)

      ; middle is empty
      (clear middle)
    )
  )
)