(define (problem schedule-meeting-monday-09-17-30min)
  (:domain meeting-scheduling)
  (:objects
    diane jack eugene patricia - agent
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ; Diane availability (blocked 09:30-10:00 and 14:30-15:00)
    (available diane s0900)
    (available diane s1000)
    (available diane s1030)
    (available diane s1100)
    (available diane s1130)
    (available diane s1200)
    (available diane s1230)
    (available diane s1300)
    (available diane s1330)
    (available diane s1400)
    (available diane s1500)
    (available diane s1530)
    (available diane s1600)
    (available diane s1630)

    ; Jack availability (blocked 13:30-14:00 and 14:30-15:00)
    (available jack s0900)
    (available jack s0930)
    (available jack s1000)
    (available jack s1030)
    (available jack s1100)
    (available jack s1130)
    (available jack s1200)
    (available jack s1230)
    (available jack s1300)
    (available jack s1400)
    (available jack s1500)
    (available jack s1530)
    (available jack s1600)
    (available jack s1630)

    ; Eugene availability (blocked 09:00-10:00, 10:30-11:30, 12:00-14:30, 15:00-16:30)
    (available eugene s1000)
    (available eugene s1130)
    (available eugene s1430)
    (available eugene s1630)

    ; Patricia availability (blocked 09:30-10:30, 11:00-12:00, 12:30-14:00, 15:00-16:30)
    (available patricia s0900)
    (available patricia s1030)
    (available patricia s1200)
    (available patricia s1430)
    (available patricia s1630)

    ; Derived predicate: slot where all participants are available.
    ; Only s1630 (16:30-17:00) is free for all four participants.
    (available-all s1630)
  )

  (:goal (meeting-scheduled))
)