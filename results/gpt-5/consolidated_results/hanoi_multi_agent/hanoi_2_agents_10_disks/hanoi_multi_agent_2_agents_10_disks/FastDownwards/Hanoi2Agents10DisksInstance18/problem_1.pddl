(define (problem hanoi2agents10disksinstance18-prob)
  (:domain two-agent-hanoi-permissions)
  (:objects
    left middle right - peg
    A B C D E F G H I J - disk
    agent_1 agent_2 - agent
  )
  (:init
    ; strict size ordering A < B < C < D < E < F < G < H < I < J
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ; initial stacking: A on B on C on D on E on F on G on H on I on J on left
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

    ; initially clear supports
    (clear A)
    (clear middle)
    (clear right)

    ; agent-disk permissions
    (assigned agent_1 A) (assigned agent_1 B) (assigned agent_1 C) (assigned agent_1 D) (assigned agent_1 E)
    (assigned agent_2 F) (assigned agent_2 G) (assigned agent_2 H) (assigned agent_2 I) (assigned agent_2 J)
  )
  (:goal
    (and
      ; right has A on C on D on right
      (on D right)
      (on C D)
      (on A C)

      ; left has B on E on F on G on H on I on J on left
      (on J left)
      (on I J)
      (on H I)
      (on G H)
      (on F G)
      (on E F)
      (on B E)

      ; middle empty
      (clear middle)
    )
  )
)