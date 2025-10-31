(define (problem build-A-on-O)
  (:domain multiagent-blocks)
  (:objects
    a b c d e f g h i j k l m n o - block
  )

  (:init
    ;; Initial on-table bottoms
    (ontable l)
    (ontable f)
    (ontable j)
    (ontable h)

    ;; Initial stacked relations
    (on b l)
    (on i b)
    (on g i)

    (on c f)
    (on e c)
    (on m e)
    (on a m)

    (on o h)
    (on d o)
    (on n d)
    (on k n)

    ;; Initially clear (top blocks)
    (clear g)
    (clear a)
    (clear j)
    (clear k)

    ;; Label predicates
    (vowel a)
    (vowel e)
    (vowel i)
    (vowel o)

    (consonant b)
    (consonant c)
    (consonant d)
    (consonant f)
    (consonant g)
    (consonant h)
    (consonant j)
    (consonant k)
    (consonant l)
    (consonant m)
    (consonant n)
  )

  ;; Goal: single target stack with o on table and the sequence up to a on top
  (:goal (and
           (ontable o)
           (on n o)
           (on m n)
           (on l m)
           (on k l)
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