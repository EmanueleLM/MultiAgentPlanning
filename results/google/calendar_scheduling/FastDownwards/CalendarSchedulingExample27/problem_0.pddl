(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  ;; objects: three agents and 30-minute slots from 09:00 to 16:30 (inclusive)
  (:objects
    jesse kathryn megan - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )

  (:init
    ;; declare agents and slots
    (agent jesse) (agent kathryn) (agent megan)
    (slot s0) (slot s1) (slot s2) (slot s3) (slot s4) (slot s5) (slot s6) (slot s7)
    (slot s8) (slot s9) (slot s10) (slot s11) (slot s12) (slot s13) (slot s14) (slot s15)

    ;; Working model: slots correspond to 30-min increments:
    ;; s0 = 09:00-09:30, s1 = 09:30-10:00, s2 = 10:00-10:30, s3 = 10:30-11:00,
    ;; s4 = 11:00-11:30, s5 = 11:30-12:00, s6 = 12:00-12:30, s7 = 12:30-13:00,
    ;; s8 = 13:00-13:30, s9 = 13:30-14:00, s10 = 14:00-14:30, s11 = 14:30-15:00,
    ;; s12 = 15:00-15:30, s13 = 15:30-16:00, s14 = 16:00-16:30, s15 = 16:30-17:00

    ;; Kathryn: free all day (all slots)
    (free kathryn s0) (free kathryn s1) (free kathryn s2) (free kathryn s3)
    (free kathryn s4) (free kathryn s5) (free kathryn s6) (free kathryn s7)
    (free kathryn s8) (free kathryn s9) (free kathryn s10) (free kathryn s11)
    (free kathryn s12) (free kathryn s13) (free kathryn s14) (free kathryn s15)

    ;; Jesse: busy 10:00-10:30 (s2) and 15:30-16:00 (s13) -> free everywhere else
    (free jesse s0) (free jesse s1)               (free jesse s3) (free jesse s4)
    (free jesse s5) (free jesse s6) (free jesse s7) (free jesse s8)
    (free jesse s9) (free jesse s10) (free jesse s11) (free jesse s12)
    (free jesse s14) (free jesse s15)

    ;; Megan: busy at:
    ;; 10:30-11:00 (s3),
    ;; 11:30-12:30 (s5,s6),
    ;; 13:30-14:30 (s9,s10),
    ;; 15:00-16:30 (s12,s13,s14)
    ;; free at all other slots:
    (free megan s0) (free megan s1) (free megan s2)               (free megan s4)
    (free megan s7) (free megan s8) (free megan s11)              (free megan s15)
  )

  ;; Goal: orchestrator chooses the earliest slot that fits all participants.
  ;; Based on the integrated availabilities above, the earliest common free slot is s0 (09:00-09:30).
  (:goal (and
    (scheduled)
    (meeting-at s0)
  ))
)