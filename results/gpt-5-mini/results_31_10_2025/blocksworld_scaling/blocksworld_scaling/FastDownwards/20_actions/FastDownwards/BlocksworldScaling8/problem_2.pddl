(define (problem blocks-multiagent-instance)
  (:domain blocks-multiagent)

  (:objects
    a e i o - vowel
    n h g j l b d m k c f - consonant
  )

  (:init
    (on o i)
    (on i d)
    (on d l)
    (on l j)
    (on j e)
    (on e g)
    (on g a)
    (on a n)
    (ontable n)

    (on f c)
    (on c k)
    (on k m)
    (on m b)
    (on b h)
    (ontable h)

    (clear o)
    (clear f)
  )

  (:goal (and
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
    (on n o)
    (ontable o)
  ))
)