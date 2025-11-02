(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)
  (:objects
    a b c d e f g h i j k - block
    table - support
  )
  (:init
    ;; type membership (vowel / consonant)
    (vowel a) (vowel e) (vowel i)
    (consonant b) (consonant c) (consonant d) (consonant f)
    (consonant g) (consonant h) (consonant j) (consonant k)

    ;; initial stack 1 (bottom -> top): E on table, I on E, A on I, K on A, B on K, C on B, G on C
    (on e table)
    (on i e)
    (on a i)
    (on k a)
    (on b k)
    (on c b)
    (on g c)

    ;; initial stack 2 (bottom -> top): D on table, F on D, J on F, H on J
    (on d table)
    (on f d)
    (on j f)
    (on h j)

    ;; only the explicit top blocks are clear (top-of-stack)
    (clear g)
    (clear h)
  )

  ;; Goal: single tower with K on the table and, bottom-to-top: K J I H G F E D C B A
  (:goal (and
    (on k table)
    (on j k)
    (on i j)
    (on h i)
    (on g h)
    (on f g)
    (on e f)
    (on d e)
    (on c d)
    (on b c)
    (on a b)
  ))
)