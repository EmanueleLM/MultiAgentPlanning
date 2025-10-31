(define (problem BlocksworldScaling142-problem)
  (:domain BlocksworldScaling142)
  (:objects
    table - table
    ; vowel blocks
    a e i - vowel
    ; consonant blocks
    b c d f g h j k l m n - consonant
  )
  (:init
    ;; initial "on" relations (three stacks on the table)
    ;; Stack1: F (bottom), E, D, C (top)
    (on f table)
    (on e f)
    (on d e)
    (on c d)

    ;; Stack2: K (bottom), A, G, N, M, B (top)
    (on k table)
    (on a k)
    (on g a)
    (on n g)
    (on m n)
    (on b m)

    ;; Stack3: H (bottom), L, I, J (top)
    (on h table)
    (on l h)
    (on i l)
    (on j i)

    ;; clear = blocks with nothing on top (tops of stacks)
    (clear c)
    (clear b)
    (clear j)
  )

  (:goal (and
    ;; final required tower (A on B on C on ... on N on table)
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j k)
    (on k l)
    (on l m)
    (on m n)
    (on n table)
  ))
)