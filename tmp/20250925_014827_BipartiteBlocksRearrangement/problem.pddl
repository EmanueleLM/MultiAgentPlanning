(define (problem blocks-multiagent-problem)
  (:domain blocks-multiagent)

  (:objects
    A B C D E F G I - block
    stack1 stack2 stack3 - table
    v_agent c_agent - agent
  )

  (:init
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F) (consonant G)

    (vagent v_agent)
    (cagent c_agent)

    (on D stack1)
    (on C D)
    (on B C)
    (on A B)

    (on E stack2)
    (on G E)
    (on I G)
    (on F I)

    (clear A)
    (clear F)
    (clear stack3)

    (handempty v_agent)
    (handempty c_agent)
  )

  (:goal (and
    (on A stack1)
    (on B A)
    (on D B)
    (on E D)

    (on F stack2)
    (on C F)
    (on I C)
    (on G I)

    (clear stack3)
  ))
)