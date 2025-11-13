(define (problem meeting-planning-example28-problem-strips)
  (:domain meeting-planning-example28-strips)
  (:objects
    Union_Square Chinatown - location
    t540 t1073 t1080 t1155 t1215 t1290 t1440 - time
  )
  (:init
    (at Union_Square)
    (edge Union_Square Chinatown)
    (edge Chinatown Union_Square)
    (joshua-loc Chinatown)
    (time-at t540)

    (succ t540 t1073)
    (succ t1073 t1080)
    (succ t1080 t1215)
    (succ t1215 t1290)
    (succ t1290 t1440)

    (step7 t1073 t1080)

    (step75 t1080 t1155)
    (step75 t1215 t1290)

    (in-window t1080)
    (in-window t1215)
    (start-ok t1080)
    (start-ok t1215)
  )
  (:goal
    (and
      (met-joshua)
    )
  )
)