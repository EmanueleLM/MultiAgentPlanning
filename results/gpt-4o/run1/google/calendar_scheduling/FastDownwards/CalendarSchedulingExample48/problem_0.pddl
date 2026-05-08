(define (problem schedule_meeting_instance)
  (:domain meeting_scheduling)

  (:objects
    janet rachel cynthia - participant
    time_900 time_930 time_1000 time_1030 time_1100 time_1130 time_1200
    time_1230 time_1300 time_1330 time_1400 time_1430 time_1500 time_1530
    time_1600 time_1630 time_1700 - time
  )

  (:init
    (busy janet time_930) (busy janet time_1000)
    (busy janet time_1230) (busy janet time_1300)
    (busy janet time_1400) (busy janet time_1430)
    (busy cynthia time_930) (busy cynthia time_1000)
    (busy cynthia time_1100) (busy cynthia time_1130)
    (busy cynthia time_1230) (busy cynthia time_1300)
    (busy cynthia time_1330) (busy cynthia time_1400)
    (busy cynthia time_1430) (busy cynthia time_1500)
    (busy cynthia time_1530) (busy cynthia time_1600)
    (busy cynthia time_1630) (busy cynthia time_1700)

    (preference_not_before cynthia time_1330)

    (consecutive time_900 time_930)
    (consecutive time_930 time_1000)
    (consecutive time_1000 time_1030)
    (consecutive time_1030 time_1100)
    (consecutive time_1100 time_1130)
    (consecutive time_1130 time_1200)
    (consecutive time_1200 time_1230)
    (consecutive time_1230 time_1300)
    (consecutive time_1300 time_1330)
    (consecutive time_1330 time_1400)
    (consecutive time_1400 time_1430)
    (consecutive time_1430 time_1500)
    (consecutive time_1500 time_1530)
    (consecutive time_1530 time_1600)
    (consecutive time_1600 time_1630)
    (consecutive time_1630 time_1700)
  )

  (:goal
    (and
      (meeting_scheduled janet)
      (meeting_scheduled rachel)
      (meeting_scheduled cynthia)
    )
  )
)