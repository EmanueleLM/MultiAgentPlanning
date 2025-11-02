(define (problem schedule-monday-meeting)
  (:domain meeting-scheduling)

  (:objects
    margaret donna helen
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630
  )

  (:init
    ;; All slots within the Monday 09:00-17:00 window
    (within-window s0900) (within-window s0930) (within-window s1000) (within-window s1030)
    (within-window s1100) (within-window s1130) (within-window s1200) (within-window s1230)
    (within-window s1300) (within-window s1330) (within-window s1400) (within-window s1430)
    (within-window s1500) (within-window s1530) (within-window s1600) (within-window s1630)

    ;; Helen's preference: do not meet after 13:30.
    ;; We interpret this as: Helen will only confirm slots starting at or before 13:00 (so meeting won't start at/after 13:30).
    ;; Mark allowed-by-helen true for slots starting 09:00..13:00 inclusive (s0900..s1300).
    (allowed-by-helen s0900) (allowed-by-helen s0930) (allowed-by-helen s1000) (allowed-by-helen s1030)
    (allowed-by-helen s1100) (allowed-by-helen s1130) (allowed-by-helen s1200) (allowed-by-helen s1230)
    (allowed-by-helen s1300)
    ;; Note: s1330 and later are not marked allowed-by-helen (Helen will not confirm them per preference).

    ;; Busy slots per agent (private calendars)
    ;; Margaret busy:
    ;; - Monday 09:00-10:00 => s0900, s0930
    ;; - Monday 10:30-11:00 => s1030
    ;; - Monday 11:30-12:00 => s1130
    ;; - Monday 13:00-13:30 => s1300
    ;; - Monday 15:00-15:30 => s1500
    (busy margaret s0900) (busy margaret s0930) (busy margaret s1030) (busy margaret s1130) (busy margaret s1300) (busy margaret s1500)

    ;; Donna busy:
    ;; - Monday 14:30-15:00 => s1430
    ;; - Monday 16:00-16:30 => s1600
    (busy donna s1430) (busy donna s1600)

    ;; Helen busy:
    ;; - Monday 09:00-09:30 => s0900
    ;; - Monday 10:00-11:30 => s1000, s1030, s1100
    ;; - Monday 13:00-14:00 => s1300, s1330
    ;; - Monday 14:30-15:00 => s1430
    ;; - Monday 15:30-17:00 => s1530, s1600, s1630
    (busy helen s0900) (busy helen s1000) (busy helen s1030) (busy helen s1100)
    (busy helen s1300) (busy helen s1330) (busy helen s1430)
    (busy helen s1530) (busy helen s1600) (busy helen s1630)
  )

  ;; Goal: schedule a 30-minute meeting (one slot) that satisfies all agents' constraints and Helen's preference.
  (:goal (meeting-scheduled))
)