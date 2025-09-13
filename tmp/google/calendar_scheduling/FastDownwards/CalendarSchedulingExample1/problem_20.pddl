(define (problem ScheduleMeeting)
  (:domain CalendarScheduling)
  (:objects
    Raymond Billy Donald - person
    time9_30 time10_30 time11_00 time11_30 time12_30 time13_30 time14_30 time15_00 time15_30 time16_00 - time)
  (:init
    (available Raymond time10_30)
    (available Raymond time14_30)
    (available Billy time11_00)
    (available Billy time15_00)
    (available Donald time11_00)
    (available Donald time15_00))
  (:goal
    (and
      (meeting_scheduled Raymond)
      (meeting_scheduled Billy)
      (meeting_scheduled Donald))))