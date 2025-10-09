(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    jesse nancy isabella harold linda - agent
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; attendees
    (attendee jesse) (attendee nancy) (attendee isabella) (attendee harold) (attendee linda)

    ;; slots available within 09:00-17:00 (half-hour start times)
    (slot s0900) (slot s0930) (slot s1000) (slot s1030) (slot s1100) (slot s1130)
    (slot s1200) (slot s1230) (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; Free(t) facts derived from each participant's private busy times (busy intervals are NOT listed here).
    ;; Jesse: busy 10:00-10:30 (s1000) and 15:00-15:30 (s1500)
    (free jesse s0900) (free jesse s0930) (free jesse s1030) (free jesse s1100) (free jesse s1130)
    (free jesse s1200) (free jesse s1230) (free jesse s1300) (free jesse s1330) (free jesse s1400)
    (free jesse s1430) (free jesse s1530) (free jesse s1600) (free jesse s1630)

    ;; Nancy: busy 09:00-09:30 (s0900), 10:30-11:00 (s1030), 13:30-14:00 (s1330), 14:30-15:00 (s1430)
    (free nancy s0930) (free nancy s1000) (free nancy s1100) (free nancy s1130)
    (free nancy s1200) (free nancy s1230) (free nancy s1300) (free nancy s1400)
    (free nancy s1500) (free nancy s1530) (free nancy s1600) (free nancy s1630)

    ;; Isabella: busy 09:00-10:00 (s0900,s0930), 11:30-12:00 (s1130), 15:30-16:00 (s1530)
    (free isabella s1000) (free isabella s1030) (free isabella s1100)
    (free isabella s1200) (free isabella s1230) (free isabella s1300) (free isabella s1330)
    (free isabella s1400) (free isabella s1430) (free isabella s1500) (free isabella s1600) (free isabella s1630)

    ;; Harold: busy 09:00-10:00 (s0900,s0930) and 10:30-16:30 (s1030..s1600).
    ;; Interpreting busy intervals as [start,end) (end exclusive) leaves s1000 and s1630 free.
    (free harold s1000) (free harold s1630)

    ;; Linda: busy 09:00-10:00 (s0900,s0930), 12:00-12:30 (s1200), 13:30-16:00 (s1330,s1400,s1430,s1500,s1530)
    (free linda s1000) (free linda s1030) (free linda s1100) (free linda s1130)
    (free linda s1230) (free linda s1300) (free linda s1600) (free linda s1630)
  )

  ;; Goal: schedule the meeting at the earliest slot that satisfies every hard constraint.
  ;; Based on the provided availabilities, the only common feasible slot is 16:30-17:00 (s1630).
  (:goal (and (scheduled s1630) (meeting-scheduled)))

)