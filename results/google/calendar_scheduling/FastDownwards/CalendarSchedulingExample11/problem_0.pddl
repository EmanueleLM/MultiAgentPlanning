(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling-multiagent)

  ;; Objects: agents and 30-minute slots from 09:00 to 16:30 (work hours 09:00-17:00).
  (:objects
    alexander elizabeth walter - agent
    slot-0900 slot-0930 slot-1000 slot-1030 slot-1100 slot-1130 slot-1200 slot-1230
    slot-1300 slot-1330 slot-1400 slot-1430 slot-1500 slot-1530 slot-1600 slot-1630 - slot
  )

  (:init
    ;; Declare slots and agents
    (slot slot-0900) (slot slot-0930) (slot slot-1000) (slot slot-1030)
    (slot slot-1100) (slot slot-1130) (slot slot-1200) (slot slot-1230)
    (slot slot-1300) (slot slot-1330) (slot slot-1400) (slot slot-1430)
    (slot slot-1500) (slot slot-1530) (slot slot-1600) (slot slot-1630)

    (agent alexander) (agent elizabeth) (agent walter)

    ;; Availability (free) facts derived from agents' private busy intervals.
    ;; Alexander: busy 09:30, 10:30, 12:30, 14:30, 16:00-17:00 (i.e. slots 09:30, 10:30, 12:30, 14:30, 16:00, 16:30)
    ;; => free at all other slots:
    (free alexander slot-0900)
    (free alexander slot-1000)
    (free alexander slot-1100)
    (free alexander slot-1130)
    (free alexander slot-1200)
    (free alexander slot-1300)
    (free alexander slot-1330)
    (free alexander slot-1400)
    (free alexander slot-1500)
    (free alexander slot-1530)

    ;; Elizabeth: busy 09:00, 11:30-12:30 (11:30,12:00), 13:00-14:30 (13:00,13:30,14:00)
    ;; => free at remaining slots:
    (free elizabeth slot-0930)
    (free elizabeth slot-1000)
    (free elizabeth slot-1030)
    (free elizabeth slot-1100)
    (free elizabeth slot-1230)
    (free elizabeth slot-1430)
    (free elizabeth slot-1500)
    (free elizabeth slot-1530)
    (free elizabeth slot-1600)
    (free elizabeth slot-1630)

    ;; Walter: busy 09:00-14:30 (slots 09:00..14:00) and 15:30-17:00 (15:30,16:00,16:30)
    ;; => free only at 14:30 and 15:00
    (free walter slot-1430)
    (free walter slot-1500)
  )

  ;; Goal: schedule a 30-minute meeting (one slot) for Alexander, Elizabeth and Walter within work hours.
  ;; Expressed as a disjunction: meeting-scheduled at any valid slot.
  (:goal
    (or
      (meeting-scheduled slot-0900) (meeting-scheduled slot-0930)
      (meeting-scheduled slot-1000) (meeting-scheduled slot-1030)
      (meeting-scheduled slot-1100) (meeting-scheduled slot-1130)
      (meeting-scheduled slot-1200) (meeting-scheduled slot-1230)
      (meeting-scheduled slot-1300) (meeting-scheduled slot-1330)
      (meeting-scheduled slot-1400) (meeting-scheduled slot-1430)
      (meeting-scheduled slot-1500) (meeting-scheduled slot-1530)
      (meeting-scheduled slot-1600) (meeting-scheduled slot-1630)
    )
  )
)