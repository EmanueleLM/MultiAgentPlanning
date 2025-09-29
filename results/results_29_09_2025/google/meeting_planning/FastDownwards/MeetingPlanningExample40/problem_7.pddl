(define (problem meet-deborah-classical)
  (:domain friends-meeting-classical)
  (:objects
    you deborah - person
    castro sunset - location
    t540 t838 t855 t930 t1200 - time
  )
  (:init
    ;; arrival: you at The Castro at 09:00 (540)
    (at you castro t540)
    ;; Deborah will be at Sunset District starting at 14:15 (855)
    (at deborah sunset t855)

    ;; time progression points
    (next t540 t838)
    (next t838 t855)
    (next t855 t930)
    (next t930 t1200)

    ;; travel possibilities (17 minutes travel: depart t838 arrive t855)
    (travel-slot you castro sunset t838 t855)

    ;; meeting slots that satisfy minimum 75 minutes and lie within Deborah's availability [855,1200]
    (meeting-slot t855 t930)
    (meeting-slot t930 t1200)
    (meeting-slot t855 t1200)

    ;; Deborah availability facts for corresponding slots (all within 14:15-20:00)
    (deborah-available t855 t930)
    (deborah-available t930 t1200)
    (deborah-available t855 t1200)
  )
  (:goal (met deborah))
)