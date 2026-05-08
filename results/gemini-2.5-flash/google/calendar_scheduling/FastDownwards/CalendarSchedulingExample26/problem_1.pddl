(define (problem calendar_scheduling_26_problem)
  (:domain calendar_scheduling_26)
  (:objects
    katherine nicole kevin - person
    time_0900 time_0930 time_1000 time_1030
    time_1100 time_1130 time_1200 time_1230
    time_1300 time_1330 time_1400 time_1430
    time_1500 time_1530 time_1600 - time_point
  )
  (:init
    ; Katherine's availability: free 9:00 to 17:00 for 1-hour slots
    (can_meet_at katherine time_0900)
    (can_meet_at katherine time_0930)
    (can_meet_at katherine time_1000)
    (can_meet_at katherine time_1030)
    (can_meet_at katherine time_1100)
    (can_meet_at katherine time_1130)
    (can_meet_at katherine time_1200)
    (can_meet_at katherine time_1230)
    (can_meet_at katherine time_1300)
    (can_meet_at katherine time_1330)
    (can_meet_at katherine time_1400)
    (can_meet_at katherine time_1430)
    (can_meet_at katherine time_1500)
    (can_meet_at katherine time_1530)
    (can_meet_at katherine time_1600)

    ; Nicole's availability: free 9:00 to 17:00 for 1-hour slots
    (can_meet_at nicole time_0900)
    (can_meet_at nicole time_0930)
    (can_meet_at nicole time_1000)
    (can_meet_at nicole time_1030)
    (can_meet_at nicole time_1100)
    (can_meet_at nicole time_1130)
    (can_meet_at nicole time_1200)
    (can_meet_at nicole time_1230)
    (can_meet_at nicole time_1300)
    (can_meet_at nicole time_1330)
    (can_meet_at nicole time_1400)
    (can_meet_at nicole time_1430)
    (can_meet_at nicole time_1500)
    (can_meet_at nicole time_1530)
    (can_meet_at nicole time_1600)

    ; Kevin's availability for 1-hour slots (derived from blocked times):
    ; Blocked: 9:00-10:00, 10:30-11:30, 12:00-15:30, 16:30-17:00
    ; Only slot where Kevin is entirely free for 1 hour: 15:30 to 16:30
    (can_meet_at kevin time_1530)
  )
  (:goal (exists (?t - time_point) (meeting_scheduled_at ?t)))
)