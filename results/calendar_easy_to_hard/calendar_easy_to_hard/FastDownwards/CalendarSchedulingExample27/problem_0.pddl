(define (problem schedule-meeting-problem)
  (:domain meeting-scheduling)

  (:objects
    jesse kathryn megan - agent
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )

  (:init
    ; Agents and slots
    (agent jesse) (agent kathryn) (agent megan)
    (slot s1) (slot s2) (slot s3) (slot s4) (slot s5) (slot s6) (slot s7) (slot s8)
    (slot s9) (slot s10) (slot s11) (slot s12) (slot s13) (slot s14) (slot s15) (slot s16)

    ; Free/busy encoded as free facts for each agent and slot.
    ; Time slots are 30-minute increments from 09:00 (s1) to 16:30-17:00 (s16).
    ; Jesse is busy on Monday 10:00-10:30 (s3) and 15:30-16:00 (s14).
    ; Kathryn is free all day.
    ; Megan is busy on 10:30-11:00 (s4), 11:30-12:30 (s6,s7), 13:30-14:30 (s10,s11),
    ; and 15:00-16:30 (s13,s14,s15).

    ; Kathryn free all slots
    (free kathryn s1) (free kathryn s2) (free kathryn s3) (free kathryn s4)
    (free kathryn s5) (free kathryn s6) (free kathryn s7) (free kathryn s8)
    (free kathryn s9) (free kathryn s10) (free kathryn s11) (free kathryn s12)
    (free kathryn s13) (free kathryn s14) (free kathryn s15) (free kathryn s16)

    ; Jesse free except s3 and s14
    (free jesse s1) (free jesse s2) (free jesse s4) (free jesse s5)
    (free jesse s6) (free jesse s7) (free jesse s8) (free jesse s9)
    (free jesse s10) (free jesse s11) (free jesse s12) (free jesse s13)
    (free jesse s15) (free jesse s16)

    ; Megan free except s4, s6, s7, s10, s11, s13, s14, s15
    (free megan s1) (free megan s2) (free megan s3) (free megan s5)
    (free megan s8) (free megan s9) (free megan s12) (free megan s16)

    ; all-free denotes slots where all agents are free simultaneously.
    ; Computed from the above private availability:
    ; all-free slots: s1 (09:00), s2 (09:30), s5 (11:00), s8 (12:30), s9 (13:00), s12 (14:30), s16 (16:30)
    (all-free s1) (all-free s2) (all-free s5) (all-free s8) (all-free s9) (all-free s12) (all-free s16)

    ; candidate marks the earliest slot that is all-free (to enforce "earliest available").
    ; Based on the combined calendars the earliest common free slot is s1 (09:00-09:30).
    (candidate s1)
  )

  (:goal (meeting-scheduled))
)