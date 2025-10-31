(define (problem Hanoi3Agents20DisksInstance19)
  (:domain hanoi_3agents_20disks)
  (:objects
    A B C D E F G H I J K L M N O P Q R S T - disk
    left middle right - peg
  )

  (:init
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

    (clear-disk A)

    (clear-peg middle)
    (clear-peg right)

    (allowed_agent1 A) (allowed_agent1 B) (allowed_agent1 C) (allowed_agent1 D)
    (allowed_agent1 E) (allowed_agent1 F) (allowed_agent1 G)

    (allowed_agent2 H) (allowed_agent2 I) (allowed_agent2 J) (allowed_agent2 K)
    (allowed_agent2 L) (allowed_agent2 M) (allowed_agent2 N)

    (allowed_agent3 O) (allowed_agent3 P) (allowed_agent3 Q) (allowed_agent3 R)
    (allowed_agent3 S) (allowed_agent3 T)

    (smaller A B)
  )

  (:goal (and
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

    (clear-peg middle)

    (on-disk A B)
    (on-peg B right)
  ))
)