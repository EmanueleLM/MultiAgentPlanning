(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    thomas dylan jerry - participant
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )

  (:init
    ;; meeting not yet scheduled
    (unscheduled)

    ;; half-hour slot adjacency (09:00-09:30 is s0, ..., 16:30-17:00 is s15)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)

    ;; Derived earliest feasible start slot (computed from participants' busy intervals
    ;; and the requirement to prefer the earliest feasible slot). This encoding enforces
    ;; that the planner selects this earliest feasible start.
    ;; Earliest feasible start is s11 (14:30-15:30) given the busy intervals below.
    (earliest-available s11)

    ;; Participant availability (explicit free facts only for half-hour slots that are available).
    ;; Thomas: free entire work day 09:00-17:00 -> all half-hour slots free
    (free thomas s0) (free thomas s1) (free thomas s2) (free thomas s3)
    (free thomas s4) (free thomas s5) (free thomas s6) (free thomas s7)
    (free thomas s8) (free thomas s9) (free thomas s10) (free thomas s11)
    (free thomas s12) (free thomas s13) (free thomas s14) (free thomas s15)

    ;; Dylan: busy 10:30-11:00 (s3) and 13:30-14:00 (s9); all other half-hour slots within work hours free
    (free dylan s0) (free dylan s1) (free dylan s2)
    ;; s3 is busy -> no (free dylan s3)
    (free dylan s4) (free dylan s5) (free dylan s6) (free dylan s7)
    (free dylan s8)
    ;; s9 is busy -> no (free dylan s9)
    (free dylan s10) (free dylan s11) (free dylan s12) (free dylan s13)
    (free dylan s14) (free dylan s15)

    ;; Jerry: busy 09:00-11:00 (s0,s1,s2,s3), 11:30-14:30 (s5,s6,s7,s8,s9,s10), and 16:00-17:00 (s14,s15)
    ;; Therefore Jerry's free half-hour slots are: s4 (11:00-11:30), s11 (14:30-15:00), s12 (15:00-15:30), s13 (15:30-16:00)
    (free jerry s4) (free jerry s11) (free jerry s12) (free jerry s13)
  )

  ;; Goal: meeting scheduled (the encoding enforces the earliest feasible choice s11)
  (:goal (scheduled s11))
)