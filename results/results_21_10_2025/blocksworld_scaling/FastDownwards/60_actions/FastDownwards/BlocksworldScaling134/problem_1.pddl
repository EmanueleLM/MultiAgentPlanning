(define (problem build-tower)
  (:domain blocksworld-multiagent)

  (:objects
    m l h k c a i d n f b j e g - block
  )

  (:init
    ;; Initial stacks (bottom -> top)
    ;; stack1: m l c i n b g
    (ontable m)
    (on l m)
    (on c l)
    (on i c)
    (on n i)
    (on b n)
    (on g b)

    ;; stack2: h k a d f j e
    (ontable h)
    (on k h)
    (on a k)
    (on d a)
    (on f d)
    (on j f)
    (on e j)

    ;; clear facts: only the top blocks initially
    (clear g)
    (clear e)

    ;; Labels: vowels and consonants
    (vowel a)
    (vowel e)
    (vowel i)

    (consonant m)
    (consonant l)
    (consonant h)
    (consonant k)
    (consonant c)
    (consonant d)
    (consonant n)
    (consonant f)
    (consonant b)
    (consonant j)
    (consonant g)
  )

  (:goal (and
    ;; Goal stack (top -> bottom): a on b on c on d on e on f on g on h on i on j on k on l on m on n ontable
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
    (ontable n)
  ))
)