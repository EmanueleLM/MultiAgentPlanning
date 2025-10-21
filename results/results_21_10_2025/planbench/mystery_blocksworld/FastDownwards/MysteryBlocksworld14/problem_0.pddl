(define (problem orchestrated-problem)
  (:domain orchestrated-domain)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6
    object_7 object_8 object_9 object_10 object_11 object_12 - obj
  )

  (:init
    ;; cats
    (cats object_0)
    (cats object_1)

    ;; collect relations (as provided by agent1)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    ;; hand facts: combining agent1 and agent2 assertions (hand object_9 added)
    (hand object_9)
    (hand object_10)
    (hand object_11)
    (hand object_12)

    ;; next relations (taken from agent1's initial facts)
    (next object_0 object_8)
    (next object_1 object_6)
    (next object_10 object_8)
    (next object_11 object_9)
    (next object_12 object_6)
    (next object_4 object_6)
    (next object_5 object_9)

    ;; sneeze facts (agent1)
    (sneeze object_4)
    (sneeze object_5)

    ;; spring facts (using agent1's assertions to remain consistent with agent1's plan)
    (spring object_6)
    (spring object_8)

    ;; stupendous facts (agent1)
    (stupendous object_2)
    (stupendous object_3)

    ;; texture facts (agent1)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; No initial vase facts (as assumed by agent1)
  )

  ;; Chosen goal set: use agent1's validated local goal.
  ;; Note: this choice is made despite agent2 requesting a different mapping for object_10
  (:goal (and
    (next object_10 object_7)
    (next object_11 object_7)
    (next object_12 object_7)
  ))

)