(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    denise joseph henry christian - participant
    ; half-hour slots from 09:00 to 16:30 on Monday
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )

  (:init
    ; there is no meeting scheduled yet
    (unscheduled)

    ; next relations (consecutive half-hour slots)
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
    (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
    (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)

    ; ---------------------------
    ; Participant availability (free half-slots)
    ; Denise: available entire workday (09:00-17:00) -> all half-slots free
    (free denise t0900) (free denise t0930) (free denise t1000) (free denise t1030)
    (free denise t1100) (free denise t1130) (free denise t1200) (free denise t1230)
    (free denise t1300) (free denise t1330) (free denise t1400) (free denise t1430)
    (free denise t1500) (free denise t1530) (free denise t1600) (free denise t1630)

    ; Joseph: available entire workday
    (free joseph t0900) (free joseph t0930) (free joseph t1000) (free joseph t1030)
    (free joseph t1100) (free joseph t1130) (free joseph t1200) (free joseph t1230)
    (free joseph t1300) (free joseph t1330) (free joseph t1400) (free joseph t1430)
    (free joseph t1500) (free joseph t1530) (free joseph t1600) (free joseph t1630)

    ; Henry: busy on 09:00-09:30 (t0900), 10:00-10:30 (t1000),
    ; 12:00-14:30 (t1200,t1230,t1300,t1330,t1400), 15:00-16:00 (t1500,t1530), 16:30-17:00 (t1630)
    ; So mark all other half-slots as free:
    (free henry t0930) (free henry t1030) (free henry t1100) (free henry t1130)
    ; t1200 t1230 t1300 t1330 t1400 are busy -> not listed as free
    (free henry t1430)
    ; t1500 t1530 busy -> not listed
    (free henry t1600)
    ; t1630 busy -> not listed

    ; Christian: busy on 09:00-11:00 (t0900,t0930,t1000,t1030),
    ; 14:30-15:30 (t1430,t1500), 16:00-17:00 (t1600,t1630)
    ; So mark free half-slots accordingly:
    (free christian t1100) (free christian t1130) (free christian t1200) (free christian t1230)
    (free christian t1300) (free christian t1330) (free christian t1400)
    ; t1430 and t1500 busy -> not listed
    (free christian t1530)
    ; t1600 and t1630 busy -> not listed
  )

  ; Goal: schedule a single contiguous one-hour meeting on Monday (two consecutive half-slots).
  ; Preference interpreted and encoded as a hard constraint: choose the earliest feasible slot.
  ; Earliest feasible slot given all hard constraints is 11:00-12:00 (start at t1100).
  (:goal (and
    (meeting-start t1100)
  ))
)