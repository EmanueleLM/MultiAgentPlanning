(define (problem blocks-multiagent-twoagents-prob)
  (:domain blocks-multiagent-twoagents)
  (:objects
    h d j a e f i g c b - block
    vowel_agent consonant_agent - agent
  )
  (:init
    (canmove consonant_agent b)
    (canmove consonant_agent c)
    (canmove consonant_agent d)
    (canmove consonant_agent f)
    (canmove consonant_agent g)
    (canmove consonant_agent h)
    (canmove consonant_agent j)

    (canmove vowel_agent a)
    (canmove vowel_agent e)
    (canmove vowel_agent i)

    (vowel a)
    (vowel e)
    (vowel i)

    (consonant h)
    (consonant d)
    (consonant j)
    (consonant f)
    (consonant g)
    (consonant c)
    (consonant b)

    (on h table)
    (on d h)
    (on a d)
    (on c a)

    (on j table)
    (on e j)
    (on f e)
    (on i f)
    (on g i)
    (on b g)

    (clear c)
    (clear b)

    (handempty vowel_agent)
    (handempty consonant_agent)
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
    (on j table)
  ))
)