(define (problem multiagent-blocks-problem-explicit)
  (:domain multiagent-blocks-explicit-sequence)

  (:objects
    j g e d i b f h k a c - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 - step
  )

  (:init
    (ontable j)
    (on g j)
    (on d g)
    (on f d)
    (on h f)
    (on a h)
    (on c a)

    (ontable e)
    (on i e)
    (on b i)
    (on k b)

    (clear c)
    (clear k)

    (vowel a)
    (vowel e)
    (vowel i)

    (consonant b)
    (consonant c)
    (consonant d)
    (consonant f)
    (consonant g)
    (consonant h)
    (consonant j)
    (consonant k)

    (at-step s0)
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
      (ontable k)
    )
  )
)