(define (problem rearrange-vowel-consonant)
  (:domain vowel-consonant-blocks)

  (:objects
    vowel_agent consonant_agent - agent
    table - loc
    ; vowel blocks
    A E I - vowel-block
    ; consonant blocks
    M H G B L D F C K J - cons-block
  )

  (:init
    ; initial stack configuration (as provided)
    (on M table)
    (on I M)
    (on K I)
    (on A K)

    (on E table)
    (on L E)
    (on D L)
    (on F D)
    (on J F)

    (on G table)
    (on B G)
    (on C B)

    (on H table)

    ; top-of-stack (clear) facts: only top blocks are clear initially
    (clear A)
    (clear J)
    (clear C)
    (clear H)

    ; Note: table is modeled as a location named "table". Moving to table uses
    ; the dedicated move-to-table actions (no clear requirement on table).
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
    (on M table)
  ))
)