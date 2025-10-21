(define (problem rearrange-blocks)
  (:domain blocksworld-agents)
  (:objects
    a e i - vowel
    h k d l g f b c j - consonant
    ;; vowels and consonants are also blocks by typing
  )

  (:init
    ;; Types are by object declarations above; initial predicates below.

    ;; Stack 1 (top -> bottom): c on b on i on g on k on h (h on table)
    (on c b)
    (on b i)
    (on i g)
    (on g k)
    (on k h)
    (ontable h)

    ;; Stack 2 (top -> bottom): j on a on f on e on l on d (d on table)
    (on j a)
    (on a f)
    (on f e)
    (on e l)
    (on l d)
    (ontable d)

    ;; Clear predicates: only tops are clear initially (c and j)
    (clear c)
    (clear j)

    ;; No block is being held at start; the hand is empty
    (handempty)
  )

  (:goal (and
    ;; Final single tower top->bottom: a on b on c on d on e on f on g on h on i on j on k on l, with l on table
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
    (ontable l)
  ))
)