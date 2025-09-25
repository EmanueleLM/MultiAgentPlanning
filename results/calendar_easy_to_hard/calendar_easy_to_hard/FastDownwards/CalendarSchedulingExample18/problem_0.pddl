(define (problem schedule-meeting-monday)
  (:domain meeting-schedule-multiagent)

  ; Objects: 30-minute slots from 09:00-09:30 (t0) through 16:30-17:00 (t15)
  (:objects
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15
  )

  (:init
    ; Declare slots
    (slot t0)  ; 09:00-09:30
    (slot t1)  ; 09:30-10:00
    (slot t2)  ; 10:00-10:30
    (slot t3)  ; 10:30-11:00
    (slot t4)  ; 11:00-11:30
    (slot t5)  ; 11:30-12:00
    (slot t6)  ; 12:00-12:30
    (slot t7)  ; 12:30-13:00
    (slot t8)  ; 13:00-13:30
    (slot t9)  ; 13:30-14:00
    (slot t10) ; 14:00-14:30
    (slot t11) ; 14:30-15:00
    (slot t12) ; 15:00-15:30
    (slot t13) ; 15:30-16:00
    (slot t14) ; 16:00-16:30
    (slot t15) ; 16:30-17:00

    ; Public information: meeting must be on Monday between 09:00 and 17:00,
    ; duration 30 minutes, slots are 30-minute quanta. (Encoded via slots above.)

    ; Participants unassigned initially
    (brian-unassigned)
    (billy-unassigned)
    (patricia-unassigned)

    ; There is no meeting scheduled yet
    (no-meeting)

    ; Availability facts derived from each agent's private info:
    ; Brian: available all day 09:00-17:00 (t0..t15)
    (available-brian t0) (available-brian t1) (available-brian t2) (available-brian t3)
    (available-brian t4) (available-brian t5) (available-brian t6) (available-brian t7)
    (available-brian t8) (available-brian t9) (available-brian t10) (available-brian t11)
    (available-brian t12) (available-brian t13) (available-brian t14) (available-brian t15)

    ; Billy: busy at 10:00-10:30 (t2), 11:30-12:00 (t5), 14:00-14:30 (t10), 16:30-17:00 (t15)
    ; therefore available on the other slots:
    (available-billy t0) (available-billy t1) (available-billy t3) (available-billy t4)
    (available-billy t6) (available-billy t7) (available-billy t8) (available-billy t9)
    (available-billy t11) (available-billy t12) (available-billy t13) (available-billy t14)
    ; Preference: Billy would like to avoid meetings after 15:30 if possible (i.e., avoid t13,t14,t15).
    ; This is a soft preference noted here for human/orchestrator consideration; classical PDDL used below does not enforce soft constraints.

    ; Patricia: busy 09:00-12:30 (t0..t6), 13:30-14:00 (t9), 14:30-16:00 (t11,t12,t13), 16:30-17:00 (t15)
    ; therefore available slots are t7 (12:30-13:00), t8 (13:00-13:30), t10 (14:00-14:30), t14 (16:00-16:30)
    (available-patricia t7) (available-patricia t8) (available-patricia t10) (available-patricia t14)
  )

  ; Goal: schedule a single 30-minute meeting (one slot) acceptable to all three participants.
  ; Only include meeting slots that are known to be possible based on the availability information above.
  ; Intersection of availabilities yields t7, t8, and t14. Billy prefers t7 or t8 over t14.
  (:goal
    (or (meeting-scheduled t7) (meeting-scheduled t8) (meeting-scheduled t14))
  )
)