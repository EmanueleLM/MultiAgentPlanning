(define (problem schedule-monday)
  (:domain meeting-scheduling)

  (:objects
    margaret donna helen - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ; Margaret's availability derived from her busy slots:
    ; Busy: 09:00-10:00, 10:30-11:00, 11:30-12:00, 13:00-13:30, 15:00-15:30
    (available margaret s1000) ; 10:00-10:30
    (available margaret s1100) ; 11:00-11:30
    (available margaret s1200) ; 12:00-12:30
    (available margaret s1230) ; 12:30-13:00
    (available margaret s1330) ; 13:30-14:00
    (available margaret s1400) ; 14:00-14:30
    (available margaret s1430) ; 14:30-15:00
    (available margaret s1530) ; 15:30-16:00
    (available margaret s1600) ; 16:00-16:30
    (available margaret s1630) ; 16:30-17:00

    ; Donna's availability derived from her busy slots:
    ; Busy: 14:30-15:00, 16:00-16:30
    (available donna s0900)
    (available donna s0930)
    (available donna s1000)
    (available donna s1030)
    (available donna s1100)
    (available donna s1130)
    (available donna s1200)
    (available donna s1230)
    (available donna s1300)
    (available donna s1330)
    (available donna s1400)
    (available donna s1500)
    (available donna s1530)
    (available donna s1630)

    ; Helen's availability derived from her busy slots and preference:
    ; Busy: 09:00-09:30, 10:00-11:30, 13:00-14:00, 14:30-15:00, 15:30-17:00
    ; Preference: Do not meet on Monday after 13:30 -> only slots finishing by 13:30 are allowed.
    (available helen s0930) ; 09:30-10:00
    (available helen s1130) ; 11:30-12:00
    (available helen s1200) ; 12:00-12:30
    (available helen s1230) ; 12:30-13:00
  )

  ; Chosen meeting time (human-readable): Monday 12:00-12:30
  (:goal
    (meeting-scheduled)
  )
)