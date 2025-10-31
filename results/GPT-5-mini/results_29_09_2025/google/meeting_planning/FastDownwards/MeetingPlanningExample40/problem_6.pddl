(define (problem meet-deborah-classical)
  (:domain friends-meeting-classical)
  (:objects
    you deborah - person
    castro sunset - location
    t540 t838 t855 t930 t1200 - time
  )
  (:init
    (at you castro t540)
    (at deborah sunset t855)
    (next t540 t838)
    (next t838 t855)
    (next t855 t930)
    (next t930 t1200)
    (travel-slot you castro sunset t838 t855)
    (meeting-slot t855 t930)
    (deborah-available t855 t930)
  )
  (:goal (met deborah))
)