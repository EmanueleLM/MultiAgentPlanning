(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)
  (:objects
    A E I - vowel-block
    B C D F G H J - consonant-block
    ;; All blocks are also of type block by typing hierarchy
  )
  (:init
    ;; Initial stack: B on C on D on E on F on G on H on I on J, with J on the table.
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (ontable J)

    ;; A is on the table separately
    (ontable A)

    ;; Clear (top of stacks): A and B are clear initially
    (clear A)
    (clear B)

    ;; Note: other blocks that have something on them are not marked clear.
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
    (ontable J)
  ))
)