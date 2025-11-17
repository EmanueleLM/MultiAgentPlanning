(define (problem meeting_monday_30min)
  (:domain calendar_meeting)
  (:objects
    margaret donna helen - participant
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    ; Audited feasible intersection (earliest-first gating via ready):
    (feasible t1200)
    (feasible t1230)
    (ready t1200)

    ; Margaret's free 30-minute slots within 09:00-17:00:
    (free margaret t1000)
    (free margaret t1100)
    (free margaret t1200)
    (free margaret t1230)
    (free margaret t1330)
    (free margaret t1400)
    (free margaret t1430)
    (free margaret t1530)
    (free margaret t1600)
    (free margaret t1630)

    ; Donna's free 30-minute slots within 09:00-17:00:
    (free donna t0900)
    (free donna t0930)
    (free donna t1000)
    (free donna t1030)
    (free donna t1100)
    (free donna t1130)
    (free donna t1200)
    (free donna t1230)
    (free donna t1300)
    (free donna t1330)
    (free donna t1400)
    (free donna t1500)
    (free donna t1530)
    (free donna t1630)

    ; Helen's free 30-minute slots that end no later than 13:30:
    (free helen t0930)
    (free helen t1130)
    (free helen t1200)
    (free helen t1230)
  )
  (:goal (meeting-placed))
)