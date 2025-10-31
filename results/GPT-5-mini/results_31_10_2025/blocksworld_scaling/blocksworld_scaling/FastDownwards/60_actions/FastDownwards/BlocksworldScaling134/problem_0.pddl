(define (problem build-tower)
  (:domain blocksworld-multiagent)
  (:objects
    m l h k c a i d n f b j e g - block
  )

  (:init
    ;; Initial stacks (public information): two stacks only initially.
    ;; stack1 (bottom -> top): m l k f b n g
    (ontable m)
    (on l m)
    (on k l)
    (on f k)
    (on b f)
    (on n b)
    (on g n)
    ;; stack2 (bottom -> top): h c a i d j e
    (ontable h)
    (on c h)
    (on a c)
    (on i a)
    (on d i)
    (on j d)
    (on e j)

    ;; clear / top-of-stack facts
    (clear g)
    (clear e)

    ;; All other blocks are not clear initially (not listed as clear)

    ;; Labels: vowels and consonants (strict constraints: vowel-agent may only move vowels,
    ;; consonant-agent may only move consonants)
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
    (consonant ???) ; placeholder removed in final encoding - ensure no extra tokens
  )

  (:goal (and
    ;; Goal tower top -> bottom: a on b on c on d on e on f on g on h on i on j on k on l on m on n ontable
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