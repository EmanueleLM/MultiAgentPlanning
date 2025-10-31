(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  ;; Objects: three agents and 16 half-hour slots from 09:00 to 17:00
  ;; Mapping: s0=09:00-09:30, s1=09:30-10:00, s2=10:00-10:30, ..., s15=16:30-17:00
  (:objects
    donna john billy - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )

  (:init
    ;; declare available slots (working hours 9:00-17:00)
    (slot s0) (slot s1) (slot s2) (slot s3)
    (slot s4) (slot s5) (slot s6) (slot s7)
    (slot s8) (slot s9) (slot s10) (slot s11)
    (slot s12) (slot s13) (slot s14) (slot s15)

    ;; Donna's busy times: 14:00-14:30 (s10), 15:30-16:00 (s13)
    (busy donna s10)
    (busy donna s13)

    ;; John's busy times: 11:00-11:30 (s4), 16:30-17:00 (s15)
    (busy john s4)
    (busy john s15)

    ;; Billy's busy times: 09:00-10:00 (s0,s1),
    ;; 10:30-14:00 (s3,s4,s5,s6,s7,s8,s9),
    ;; 14:30-17:00 (s11,s12,s13,s14,s15)
    (busy billy s0) (busy billy s1)
    (busy billy s3) (busy billy s4) (busy billy s5)
    (busy billy s6) (busy billy s7) (busy billy s8) (busy billy s9)
    (busy billy s11) (busy billy s12) (busy billy s13) (busy billy s14) (busy billy s15)
  )

  ;; Goal: schedule the meeting in any single half-hour slot within working hours.
  ;; Planner should pick a slot where no agent is busy.
  (:goal
    (or
      (meeting-scheduled s0) (meeting-scheduled s1) (meeting-scheduled s2) (meeting-scheduled s3)
      (meeting-scheduled s4) (meeting-scheduled s5) (meeting-scheduled s6) (meeting-scheduled s7)
      (meeting-scheduled s8) (meeting-scheduled s9) (meeting-scheduled s10) (meeting-scheduled s11)
      (meeting-scheduled s12) (meeting-scheduled s13) (meeting-scheduled s14) (meeting-scheduled s15)
    )
  )
)