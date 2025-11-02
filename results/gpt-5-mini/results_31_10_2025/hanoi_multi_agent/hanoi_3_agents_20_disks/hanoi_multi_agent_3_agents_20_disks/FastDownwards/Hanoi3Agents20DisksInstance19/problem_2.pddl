(define (problem Hanoi3Agents20DisksInstance19)
  (:domain hanoi_3agents_20disks)
  (:objects
    A B C D E F G H I J K L M N O P Q R S T - disk
    left middle right - peg
  )

  (:init
    ;; initial stack top->bottom on left: A,B,C,...,T
    ;; representation: on-disk X Y means X is directly on Y (X is above Y).
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-disk H I)
    (on-disk I J)
    (on-disk J K)
    (on-disk K L)
    (on-disk L M)
    (on-disk M N)
    (on-disk N O)
    (on-disk O P)
    (on-disk P Q)
    (on-disk Q R)
    (on-disk R S)
    (on-disk S T)
    (on-peg T left)

    ;; top-of-stack markings: only A is top on the left initially
    (clear-disk A)

    ;; pegs initially: middle and right empty
    (clear-peg middle)
    (clear-peg right)
    ;; left is not clear because T is on it

    ;; agent movement permissions (private information encoded publicly for PDDL verification)
    (allowed_agent1 A) (allowed_agent1 B) (allowed_agent1 C) (allowed_agent1 D)
    (allowed_agent1 E) (allowed_agent1 F) (allowed_agent1 G)

    (allowed_agent2 H) (allowed_agent2 I) (allowed_agent2 J) (allowed_agent2 K)
    (allowed_agent2 L) (allowed_agent2 M) (allowed_agent2 N)

    (allowed_agent3 O) (allowed_agent3 P) (allowed_agent3 Q) (allowed_agent3 R)
    (allowed_agent3 S) (allowed_agent3 T)

    ;; size relation needed for placing a disk onto another disk
    (smaller A B)
    ;; (No other smaller relations are required by the crafted actions; only A<B is checked.)
  )

  (:goal (and
    ;; Left peg must have top-to-bottom: C D E F G H I J K L M N O P Q R S T
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-disk H I)
    (on-disk I J)
    (on-disk J K)
    (on-disk K L)
    (on-disk L M)
    (on-disk M N)
    (on-disk N O)
    (on-disk O P)
    (on-disk P Q)
    (on-disk Q R)
    (on-disk R S)
    (on-disk S T)
    (on-peg T left)

    ;; Middle peg must be empty
    (clear-peg middle)

    ;; Right peg must have top-to-bottom: A B
    (on-disk A B)
    (on-peg B right)
  ))
)