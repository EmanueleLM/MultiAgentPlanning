(define (problem block-tower-multiagent)
  (:domain blocks-multiagent)
  (:objects
    ; places: table (the single table surface)
    table - table

    ; vowel blocks (movable by vowel-agent)
    A E I - vowel

    ; consonant blocks (movable by consonant-agent)
    C G J F L K B D M N H - consonant
  )

  (:init
    ; initial "on" relations (given stacks)
    (on C table)
    (on L C)
    (on B L)
    (on H B)

    (on G table)
    (on A G)

    (on E table)
    (on I E)
    (on J I)
    (on K J)
    (on M K)

    (on F table)
    (on D F)
    (on N D)

    ; top and clear predicates: top blocks are those with nothing on them
    (top H)
    (clear H)

    (top A)
    (clear A)

    (top M)
    (clear M)

    (top N)
    (clear N)

    ; Other blocks are not top/clear initially. (We do not declare those predicates for them.)

    ; hand is initially empty
    (handempty)
  )

  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J K)
    (on K L)
    (on L M)
    (on M N)
    (on N table)
  ))
)