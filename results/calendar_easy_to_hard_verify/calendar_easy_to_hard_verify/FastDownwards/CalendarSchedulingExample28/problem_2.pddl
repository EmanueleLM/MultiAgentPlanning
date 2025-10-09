(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    jesse nancy isabella harold linda - agent
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - timeslot
  )
  (:init
    (attendee jesse) (attendee nancy) (attendee isabella) (attendee harold) (attendee linda)
    (free jesse s0900) (free jesse s0930) (free jesse s1030) (free jesse s1100) (free jesse s1130)
    (free jesse s1200) (free jesse s1230) (free jesse s1300) (free jesse s1330) (free jesse s1400)
    (free jesse s1430) (free jesse s1530) (free jesse s1600) (free jesse s1630)
    (free nancy s0930) (free nancy s1000) (free nancy s1100) (free nancy s1130)
    (free nancy s1200) (free nancy s1230) (free nancy s1300) (free nancy s1400)
    (free nancy s1500) (free nancy s1530) (free nancy s1600) (free nancy s1630)
    (free isabella s1000) (free isabella s1030) (free isabella s1100)
    (free isabella s1200) (free isabella s1230) (free isabella s1300) (free isabella s1330)
    (free isabella s1400) (free isabella s1430) (free isabella s1500) (free isabella s1600) (free isabella s1630)
    (free harold s1000) (free harold s1630)
    (free linda s1000) (free linda s1030) (free linda s1100) (free linda s1130)
    (free linda s1230) (free linda s1300) (free linda s1600) (free linda s1630)
  )
  (:goal (and (scheduled s1630) (meeting-scheduled)))
)