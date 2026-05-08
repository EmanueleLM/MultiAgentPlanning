(define (problem hanoi-multiagent-problem)
  (:domain hanoi-multiagent)

  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
  )

  (:init
    ; initial positions: left peg top-to-bottom A B C D E F G H I J
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

    ; clear places: A is top of stack on left; middle and right pegs are empty
    (clear A)
    (clear middle)
    (clear right)

    ; agent disk capabilities
    (agent1-disk A)
    (agent1-disk B)
    (agent1-disk C)
    (agent1-disk D)
    (agent1-disk E)

    (agent2-disk F)
    (agent2-disk G)
    (agent2-disk H)
    (agent2-disk I)
    (agent2-disk J)

    ; size ordering (smaller X Y means X is strictly smaller than Y)
    ; A < B C D E F G H I J
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    ; B < C D E F G H I J
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    ; C < D E F G H I J
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    ; D < E F G H I J
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    ; E < F G H I J
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    ; F < G H I J
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    ; G < H I J
    (smaller G H) (smaller G I) (smaller G J)
    ; H < I J
    (smaller H I) (smaller H J)
    ; I < J
    (smaller I J)
  )

  (:goal (and
    ; left peg top-to-bottom: A E F G H I J
    (on A left)
    (on E A)
    (on F E)
    (on G F)
    (on H G)
    (on I H)
    (on J I)

    ; right peg top-to-bottom: B C D
    (on B right)
    (on C B)
    (on D C)

    ; middle peg empty
    (clear middle)
  ))
)