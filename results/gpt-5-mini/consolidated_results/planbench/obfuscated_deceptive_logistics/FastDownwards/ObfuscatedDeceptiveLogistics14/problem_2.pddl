(define (problem obfuscated-deceptive-logistics14-fragment1)
  (:domain obfuscated-deceptive-logistics14)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - object

    ;; explicit discrete steps to be used by actions (unit-duration model)
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 step12 step13 step14 step15 - step
  )
  (:init
    ;; domain facts as given in the fragment initial state
    (cats object_0)
    (cats object_1)

    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    (hand object_10)
    (hand object_11)
    (hand object_12)

    (next object_0 object_8)
    (next object_1 object_6)
    (next object_10 object_8)
    (next object_11 object_9)
    (next object_12 object_6)
    (next object_4 object_6)
    (next object_5 object_9)

    (sneeze object_4)
    (sneeze object_5)

    (spring object_6)
    (spring object_8)

    (stupendous object_2)
    (stupendous object_3)

    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; steps and successor chain (explicit stage progression)
    (step step0) (step step1) (step step2) (step step3) (step step4) (step step5)
    (step step6) (step step7) (step step8) (step step9) (step step10) (step step11)
    (step step12) (step step13) (step step14) (step step15)

    (next-step step0 step1) (next-step step1 step2) (next-step step2 step3) (next-step step3 step4)
    (next-step step4 step5) (next-step step5 step6) (next-step step6 step7) (next-step step7 step8)
    (next-step step8 step9) (next-step step9 step10) (next-step step10 step11) (next-step step11 step12)
    (next-step step12 step13) (next-step step13 step14) (next-step step14 step15)

    ;; availability: all objects available at initial step0 (ensures actions can begin)
    (avail object_0 step0) (avail object_1 step0) (avail object_2 step0) (avail object_3 step0)
    (avail object_4 step0) (avail object_5 step0) (avail object_6 step0) (avail object_7 step0)
    (avail object_8 step0) (avail object_9 step0) (avail object_10 step0) (avail object_11 step0)
    (avail object_12 step0)
  )

  (:goal (and
    (next object_10 object_7)
    (next object_11 object_7)
    (next object_12 object_7)
  ))
)