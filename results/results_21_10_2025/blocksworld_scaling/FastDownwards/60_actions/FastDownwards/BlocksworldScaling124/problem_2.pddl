(define (problem blocksworldscaling124-problem)
  (:domain blocksworld-multiagent)

  (:objects
    a i e o k l f b c g m n j d h - block
    s1 s2 - stack
  )

  (:init
    (vowel a) (vowel e) (vowel i) (vowel o)
    (consonant b) (consonant c) (consonant d) (consonant f) (consonant g)
    (consonant h) (consonant j) (consonant k) (consonant l) (consonant m) (consonant n)

    (on a s1)
    (on i a)
    (on o i)
    (on f o)
    (on b f)
    (on g b)

    (on e s2)
    (on h e)
    (on d h)
    (on k d)
    (on l k)
    (on m l)
    (on c m)
    (on n c)
    (on j n)

    (clear g)
    (clear j)
  )

  (:goal
    (and
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
      (on o s1)
      (clear a)
      (clear s2)
    )
  )
)