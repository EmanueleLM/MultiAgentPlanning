(define (problem blocksworld-multiagent-problem)
  (:domain blocksworld-multiagent)

  (:objects
    a b c d e f g h i j k l m n - block
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 - place
  )

  (:init
    ;; Stack1 (bottom->top): h, m, n, g, k
    (on h s1)
    (on m h)
    (on n m)
    (on g n)
    (on k g)

    ;; Stack2 (bottom->top): i, d, e, c, a
    (on i s2)
    (on d i)
    (on e d)
    (on c e)
    (on a c)

    ;; Stack3 (bottom->top): l, j, b, f
    (on l s3)
    (on j l)
    (on b j)
    (on f b)

    ;; clear tops
    (clear k)
    (clear a)
    (clear f)

    ;; extra table spots initially clear
    (clear s4) (clear s5) (clear s6) (clear s7) (clear s8) (clear s9)
    (clear s10) (clear s11) (clear s12) (clear s13) (clear s14) (clear s15)
    (clear s16) (clear s17) (clear s18)

    ;; classify vowels and consonants
    (vowel a) (vowel e) (vowel i)

    (consonant b) (consonant c) (consonant d) (consonant f) (consonant g)
    (consonant h) (consonant j) (consonant k) (consonant l) (consonant m)
    (consonant n)
  )

  (:goal (and
    (on n s18)
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