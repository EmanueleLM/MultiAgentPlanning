(define (problem hanoi-10-multiagent-problem)
  (:domain hanoi-multiagent)

  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
  )

  (:init
    ;; Initial stacking: top-to-bottom on left: A B C D E F G H I J
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

    ;; Clear places initially: top-most disk A is clear; middle and right pegs are empty (clear)
    (clear A)
    (clear middle)
    (clear right)

    ;; Agent movement permissions
    (agent1disk A)
    (agent1disk B)
    (agent1disk C)
    (agent1disk D)
    (agent1disk E)

    (agent2disk F)
    (agent2disk G)
    (agent2disk H)
    (agent2disk I)
    (agent2disk J)

    ;; Size ordering: smaller X Y means X is smaller than Y (only asserted for disks)
    ;; A is smallest, J is largest
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

  (:goal (and
    ;; Goal stacks:
    ;; Left peg: top-to-bottom E F G H I J  -> on E F, F G, G H, H I, I J, J left
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    ;; Right peg: top-to-bottom A B C D -> on A B, B C, C D, D right
    (on A B)
    (on B C)
    (on C D)
    (on D right)

    ;; Middle peg must be empty (no disk on it)
    (clear middle)

    ;; Ensure the top disks are clear
    (clear E)
    (clear A)
  ))
)