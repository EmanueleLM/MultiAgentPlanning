(define (problem meet-deborah-classical)
  (:domain friends-meeting-classical)

  (:objects
    you deborah - agent
    castro sunset - location
    t540 t557 t855 t930 t1125 t1200 - time
  )

  (:init
    (at you castro t540)
    (at deborah sunset t855)

    (next t540 t557)
    (next t557 t855)
    (next t855 t930)
    (next t930 t1125)
    (next t1125 t1200)

    (travel-slot castro sunset t540 t557)
    (travel-slot sunset castro t557 t574)

    (meeting-slot t855 t930)
    (deborah-available t855 t930)

    (= (total-cost) 0)
  )

  (:goal (and
    (met deborah)
  ))

  (:metric minimize (total-cost))
)