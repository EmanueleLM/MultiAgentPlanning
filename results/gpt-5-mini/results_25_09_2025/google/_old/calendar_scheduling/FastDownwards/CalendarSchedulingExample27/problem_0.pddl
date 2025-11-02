(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-schedule)

  (:objects
    jesse kathryn megan - person
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )

  (:init
    ;; Participant availabilities integrated from the three agents' inputs:
    ;; Jesse's calendar (from agent 1): busy s3, s14; other slots free.
    (free jesse s1) (free jesse s2) (free jesse s4) (free jesse s5) (free jesse s6)
    (free jesse s7) (free jesse s8) (free jesse s9) (free jesse s10) (free jesse s11)
    (free jesse s12) (free jesse s13) (free jesse s15) (free jesse s16)

    ;; Kathryn's calendar (agent 2): free all Monday slots
    (free kathryn s1) (free kathryn s2) (free kathryn s3) (free kathryn s4)
    (free kathryn s5) (free kathryn s6) (free kathryn s7) (free kathryn s8)
    (free kathryn s9) (free kathryn s10) (free kathryn s11) (free kathryn s12)
    (free kathryn s13) (free kathryn s14) (free kathryn s15) (free kathryn s16)

    ;; Megan's calendar (agent 3): busy slots 4,6,7,10,11,13,14,15; others free.
    (free megan s1) (free megan s2) (free megan s3) (free megan s5)
    (free megan s8) (free megan s9) (free megan s12) (free megan s16)

    ;; Derived / precomputed helper facts (computed by integrating the calendars):
    ;; free-for-all ?s is true iff all three participants are free at slot ?s
    ;; (computed from the free facts above)
    (free-for-all s1)   ; 09:00-09:30 free for jesse,kathryn,megan
    (free-for-all s2)   ; 09:30-10:00
    (free-for-all s5)   ; 11:00-11:30
    (free-for-all s8)   ; 12:30-13:00
    (free-for-all s9)   ; 13:00-13:30
    (free-for-all s12)  ; 14:30-15:00
    (free-for-all s16)  ; 16:30-17:00

    ;; earliest-precond ?s is precomputed to enforce the "earliest available" preference.
    ;; earliest-precond(s) is true iff no earlier slot is free-for-all.
    ;; Given the free-for-all slots above, the earliest such slot is s1, so earliest-precond
    ;; is true for s1 only (all later slots have an earlier free-for-all slot: s1).
    (earliest-precond s1)
    ;; Note: earliest-precond s2..s16 are absent, so their schedule actions are not applicable
    ;; even if free-for-all holds, enforcing earliest selection.

    ;; Meeting is initially available to schedule
    (meeting-available)
  )

  ;; Goal: a single 30-minute meeting scheduled (the integrated earliest feasible slot).
  ;; Given the integrated calendars and earliest encoding, the planner should pick s1 (09:00-09:30).
  (:goal (and (meeting-scheduled) (meeting-at s1)))
)