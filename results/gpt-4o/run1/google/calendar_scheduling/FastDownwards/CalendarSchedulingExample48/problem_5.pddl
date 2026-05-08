(define (problem schedule_meeting_instance)
  (:domain meeting_scheduling)

  (:objects
    janet rachel cynthia - participant
    time_900 time_930 time_1000 time_1030 time_1100 time_1130 time_1200
    time_1230 time_1300 time_1330 time_1400 time_1430 time_1500 time_1530
    time_1600 time_1630 time_1700 - time_slot
  )

  (:init
    ; Janet's schedule
    (busy janet time_930) (busy janet time_1000)
    (busy janet time_1230) (busy janet time_1300)
    (busy janet time_1400) (busy janet time_1430)

    ; Cynthia's schedule
    (busy cynthia time_930) (busy cynthia time_1000)
    (busy cynthia time_1100) (busy cynthia time_1130)
    (busy cynthia time_1230) (busy cynthia time_1300)
    (busy cynthia time_1330) (busy cynthia time_1400)
    (busy cynthia time_1430) (busy cynthia time_1500)
    (busy cynthia time_1530) (busy cynthia time_1600)
    (busy cynthia time_1630) (busy cynthia time_1700)

    (can_start_after cynthia time_1330)

    ; Define feasible start and end times respecting consecutiveness for 1-hour meeting slots
    (available time_1300 time_1400)
    (available time_1400 time_1500)
    (available time_1500 time_1600)
  )

  (:goal
    (exists (?t1 - time_slot ?t2 - time_slot)
      (and
        (meeting_time ?t1 ?t2)
      )
    )
  )
)