(define (problem calendar_scheduling)
  (:domain calendar)
  (:objects
    Raymond Billy Donald - person
    t900 t930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 t1700 - time-slot
  )

  (:init
    ;; Raymond's availability
    (available Raymond t930 t1000) (available Raymond t1000 t1030) (available Raymond t1030 t1100)
    (available Raymond t1200 t1230) (available Raymond t1230 t1300) (available Raymond t1330 t1400)
    (available Raymond t1400 t1430) (available Raymond t1500 t1530) (available Raymond t1530 t1600)
    (available Raymond t1600 t1630)

    ;; Billy's availability
    (available Billy t930 t1000) (available Billy t1030 t1100) (available Billy t1100 t1130)
    (available Billy t1330 t1400) (available Billy t1400 t1430) (available Billy t1430 t1500)
    (available Billy t1500 t1530)

    ;; Donald's availability
    (available Donald t1300 t1330) (available Donald t1330 t1400) (available Donald t1400 t1430)
    (available Donald t1430 t1500) (available Donald t1500 t1530)

    ;; Preference consideration: Billy prefers avoiding meetings after 15:00
    ;; Therefore, avoid scheduling during t1530, t1600, t1630, t1700

  )

  (:goal
    (and
      (meeting_scheduled Raymond)
      (meeting_scheduled Billy)
      (meeting_scheduled Donald)
    )
  )
)