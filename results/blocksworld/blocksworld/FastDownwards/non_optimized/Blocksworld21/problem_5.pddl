(define (problem multiagent-blocks-problem)
  (:domain multi-agent-blocks)
  (:objects
    vowel_agent consonant_agent orchestrator - agent
    a b c d e f g h i j k l m - block
  )
  (:init
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)

    (can-move vowel_agent a)
    (can-move vowel_agent e)
    (can-move vowel_agent i)

    (can-move consonant_agent m)
    (can-move consonant_agent h)
    (can-move consonant_agent g)
    (can-move consonant_agent b)
    (can-move consonant_agent l)
    (can-move consonant_agent d)
    (can-move consonant_agent f)
    (can-move consonant_agent c)
    (can-move consonant_agent k)
    (can-move consonant_agent j)

    (vowel a)
    (vowel e)
    (vowel i)

    (consonant m)
    (consonant h)
    (consonant g)
    (consonant b)
    (consonant l)
    (consonant d)
    (consonant f)
    (consonant c)
    (consonant k)
    (consonant j)

    (ontable m)
    (on i m)
    (on k i)
    (on a k)

    (ontable e)
    (on l e)
    (on d l)
    (on f d)
    (on j f)

    (ontable g)
    (on b g)
    (on c b)

    (ontable h)

    (clear a)
    (clear j)
    (clear c)
    (clear h)

    (handempty consonant_agent)
    (handempty vowel_agent)
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
    (ontable m)
  ))
)