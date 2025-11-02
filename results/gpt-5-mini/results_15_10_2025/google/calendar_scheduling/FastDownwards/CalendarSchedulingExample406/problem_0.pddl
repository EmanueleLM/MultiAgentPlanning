; PROBLEM TEMPLATE: Fill in participants and (free ...) facts with the actual availability.
; Slots represent Monday half-hour slots between 09:00 and 17:00:
; s0 = 09:00-09:30
; s1 = 09:30-10:00
; ...
; s15 = 16:30-17:00
(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
    ; Replace the following placeholder participants with real names, e.g.:
    ; alice bob carol - person
  )

  (:init
    ; declare slots (Monday 09:00–17:00, 16 half-hour slots)
    (slot s0) (slot s1) (slot s2) (slot s3)
    (slot s4) (slot s5) (slot s6) (slot s7)
    (slot s8) (slot s9) (slot s10) (slot s11)
    (slot s12) (slot s13) (slot s14) (slot s15)

    ; Mark required participants (replace with actual participant names)
    ; Example:
    ; (required alice)
    ; (required bob)
    ;
    ; Mark availability using (free <person> <slot>).
    ; Example:
    ; (free alice s0) (free alice s1) ; alice available 09:00-10:00
    ; (free bob s1) (free bob s2)     ; bob available 09:30-10:30
    ;
    ; IMPORTANT: Do NOT include free facts for slots that are unavailable.
    ; Treat any "avoid / would rather / earliest" expressed in natural language as hard constraints
    ; by only including allowed (free ...) facts below.

    ; --- Insert participant and availability facts here ---
  )

  ; Goal: some slot becomes scheduled where all required participants attend.
  (:goal (exists (?s - slot) (scheduled ?s)))
)