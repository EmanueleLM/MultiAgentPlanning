(define (problem multiagent_blocks_problem)
  (:domain multiagent_blocks_domain)

  (:objects
    a b c d e f g h i j - block
  )

  (:init
    ;; Labels: vowels and consonants as provided by the two agents
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

    ;; Initial stacks (unified from both agents' inputs)
    ;; Stack1: a on table
    (ontable a)
    (clear a)

    ;; Stack2: b on table
    (ontable b)
    (clear b)

    ;; Stack3: c on d on e on f on g on h on i on j, with j on table
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (ontable j)

    ;; Top blocks are clear
    (clear c)
    ;; d,e,f,g,h,i,j are not clear initially (no clear facts for them)
  )

  ;; Global goal: build the full tower
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
    (ontable j)
  ))
)