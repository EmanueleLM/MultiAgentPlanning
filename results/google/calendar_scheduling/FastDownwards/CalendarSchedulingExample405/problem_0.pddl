(define (problem schedule-monday)
  (:domain schedule-meeting)

  (:objects
    ; Time slot objects (Monday 09:00–17:00, 30-minute increments)
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot

    m1 - meeting

    ; --- INSERT PARTICIPANT OBJECTS BELOW ---
    ; Example (do NOT include unless these are actual participants):
    ; alice bob carol - participant
  )

  (:init
    ; declare slots
    (slot s1) (slot s2) (slot s3) (slot s4) (slot s5) (slot s6) (slot s7) (slot s8)
    (slot s9) (slot s10) (slot s11) (slot s12) (slot s13) (slot s14) (slot s15) (slot s16)

    ; declare participants — replace with actual participant objects above.
    ; Example (remove if not applicable):
    ; (participant alice)
    ; (participant bob)
    ; (participant carol)

    ; Availability facts: for every participant p and slot s where p is available,
    ; include (free p s).
    ; You must provide these facts. Example:
    ; (free alice s1) (free alice s2) ... etc

    ; NOTE: Do NOT invent availability. Replace the examples above with the
    ; exact availability facts from each participant. If you provide unavailable
    ; times instead, I will convert them to (free ...) facts accordingly.
  )

  ; Goal: meeting m1 must be scheduled (the domain action respects availability).
  ; To force earliest feasible slot we will set the goal to (scheduled-at m1 sN)
  ; for the earliest sN that is common free. After you supply availabilities,
  ; I will compute the earliest common slot and return a problem with a specific
  ; scheduled-at goal for that earliest slot (or leave general (scheduled m1)
  ; and show the planner result).
  (:goal
    (scheduled m1)
  )
)