(define (problem schedule_meeting_monday)
  (:domain jack_of_all_trades_schedule)
  (:objects
    gregory teresa carol - participant
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    ; participants
    (person gregory)
    (person teresa)
    (person carol)

    ; slots are work slots (09:00-17:00 half-hour starts)
    (slot t0900)  (work_slot t0900)
    (slot t0930)  (work_slot t0930)
    (slot t1000)  (work_slot t1000)
    (slot t1030)  (work_slot t1030)
    (slot t1100)  (work_slot t1100)
    (slot t1130)  (work_slot t1130)
    (slot t1200)  (work_slot t1200)
    (slot t1230)  (work_slot t1230)
    (slot t1300)  (work_slot t1300)
    (slot t1330)  (work_slot t1330)
    (slot t1400)  (work_slot t1400)
    (slot t1430)  (work_slot t1430)
    (slot t1500)  (work_slot t1500)
    (slot t1530)  (work_slot t1530)
    (slot t1600)  (work_slot t1600)
    (slot t1630)  (work_slot t1630)

    ; existing blocked calendar entries (immutable)
    ; gregory blocked: 11:00-11:30, 12:00-12:30, 15:30-16:30 (blocks t1100, t1200, t1530, t1600)
    (blocked gregory t1100)
    (blocked gregory t1200)
    (blocked gregory t1530)
    (blocked gregory t1600)

    ; teresa: no blocked slots (calendar wide open) -- nothing to declare

    ; carol blocked: 09:00-10:30 (t0900,t0930,t1000), 11:00-16:00 (t1100,t1130,t1200,t1230,t1300,t1330,t1400,t1430,t1500,t1530), 16:30-17:00 (t1630)
    (blocked carol t0900)
    (blocked carol t0930)
    (blocked carol t1000)
    (blocked carol t1100)
    (blocked carol t1130)
    (blocked carol t1200)
    (blocked carol t1230)
    (blocked carol t1300)
    (blocked carol t1330)
    (blocked carol t1400)
    (blocked carol t1430)
    (blocked carol t1500)
    (blocked carol t1530)
    (blocked carol t1630)

    ; meeting initial state
    (meeting_unscheduled)
  )
  (:goal (meeting_scheduled))
)