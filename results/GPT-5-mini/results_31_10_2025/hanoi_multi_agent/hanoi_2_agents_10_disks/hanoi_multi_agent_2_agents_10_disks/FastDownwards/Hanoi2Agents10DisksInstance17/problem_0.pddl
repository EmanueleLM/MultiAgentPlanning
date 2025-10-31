(define (problem multiagent-hanoi-instance)
  (:domain multiagent-hanoi)
  (:objects
    agent_1 agent_2 - agent
    A B C D E F G H I J - disk
    left middle right - peg
  )

  (:init
    ;; Initial stack on left: top-to-bottom A B C D E F G H I J
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

    ;; Pegs middle and right are empty initially
    (clear A)
    (clear middle)
    (clear right)

    ;; Agent permissions
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

    ;; Size relations (smaller x y means x is smaller than y)
    ;; A smallest, J largest -- enumerate all ordered pairs where first is smaller than second
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
    ;; left peg top-to-bottom B D E F G H I J  => on B left, on D B, on E D, ..., on J I
    (on B left)
    (on D B)
    (on E D)
    (on F E)
    (on G F)
    (on H G)
    (on I H)
    (on J I)

    ;; right peg top-to-bottom A C => on A right, on C A
    (on A right)
    (on C A)

    ;; middle peg empty (expressed by being clear)
    (clear middle)

    ;; top disks should be clear
    (clear B)
    (clear A)
  ))
)