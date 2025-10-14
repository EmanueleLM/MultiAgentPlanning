(define (problem multiagent_blocks_problem)
  (:domain multiagent_blocks)

  (:objects
    A E I C D L K H F G J B - block
    table - place
    ;; type annotations for vowel/consonant blocks
    A E I - vowel
    C D L K H F G J B - cons
  )

  (:init
    ;; block positions (initial stacks)
    (on A table)
    (on I A)
    (on L I)
    (on K L)
    (on E K)
    (on F E)

    (on C table)
    (on D C)
    (on H D)
    (on G H)
    (on J G)
    (on B J)

    ;; top blocks of each initial stack are clear
    (clear F)
    (clear B)

    ;; agents are initially free-handed
    (handfree-vowel)
    (handfree-cons)
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
    (on L table)
  ))
)