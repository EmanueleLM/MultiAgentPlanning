(define (problem schedule-meeting-monday)
  (:domain meeting-scheduler)
  (:objects
    arthur michael samantha - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ; Next (consecutive half-hour) relations
    (next s0900 s0930)
    (next s0930 s1000)
    (next s1000 s1030)
    (next s1030 s1100)
    (next s1100 s1130)
    (next s1130 s1200)
    (next s1200 s1230)
    (next s1230 s1300)
    (next s1300 s1330)
    (next s1330 s1400)
    (next s1400 s1430)
    (next s1430 s1500)
    (next s1500 s1530)
    (next s1530 s1600)
    (next s1600 s1630)

    ; Initial meeting state
    (not (meeting-scheduled)) ; note: many PDDL planners don't accept negated init atoms; leaving this as implicit default. The actions guard against multiple scheduling.

    ; Free slots per participant (every half-hour start that is not in their unavailable/busy intervals)
    ; Arthur: UNAVAILABLE 09:00-09:30, 10:30-12:00 (10:30-11:00,11:00-11:30,11:30-12:00), 16:00-17:00
    ; So Arthur free at: 09:30,10:00,12:00,12:30,13:00,13:30,14:00,14:30,15:00,15:30
    (free arthur s0930) (free arthur s1000)
    (free arthur s1200) (free arthur s1230) (free arthur s1300) (free arthur s1330)
    (free arthur s1400) (free arthur s1430) (free arthur s1500) (free arthur s1530)

    ; Michael: UNAVAILABLE 13:00-13:30, 14:00-14:30
    ; Michael free at all other half-hour starts
    (free michael s0900) (free michael s0930) (free michael s1000) (free michael s1030)
    (free michael s1100) (free michael s1130) (free michael s1200) (free michael s1230)
    (free michael s1330) (free michael s1430) (free michael s1500) (free michael s1530)
    (free michael s1600) (free michael s1630)

    ; Samantha: UNAVAILABLE 10:30-11:00, 12:00-15:00, 15:30-17:00
    ; Blocks: s1030; s1200,s1230,s1300,s1330,s1400,s1430; s1530,s1600,s1630
    ; Samantha free at: 09:00,09:30,10:00,11:00,11:30,15:00
    (free samantha s0900) (free samantha s0930) (free samantha s1000)
    (free samantha s1100) (free samantha s1130) (free samantha s1500)
  )

  ; Global goal: schedule a 1-hour meeting during Monday work hours that satisfies every participant's hard constraints.
  ; Per the instruction to treat "earliest feasible" as a hard constraint, choose the earliest feasible start found (s0930).
  (:goal (and (meeting-scheduled) (scheduled s0930)))
)