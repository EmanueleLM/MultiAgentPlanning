(define (problem schedule-meeting-mon)
  (:domain meeting-scheduling)
  (:objects
    p1 p2 p3 p4 p5 p6 p7 - participant
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )

  (:init
    ;; declare participants and slots
    (participant p1) (participant p2) (participant p3) (participant p4) (participant p5) (participant p6) (participant p7)
    (slot s0) (slot s1) (slot s2) (slot s3) (slot s4) (slot s5) (slot s6) (slot s7) (slot s8) (slot s9)
    (slot s10) (slot s11) (slot s12) (slot s13) (slot s14) (slot s15)

    ;; ========== IMPORTANT ==========
    ;; Replace the example availability facts below with the aggregated availabilities
    ;; extracted from each participant's PDDL. Each avail fact must be of the form:
    ;;   (avail pX sY)
    ;; where pX is p1..p7 and sY is s0..s15 corresponding to 30-min slots between 09:00 and 17:00 on Monday.
    ;; Example: (avail p1 s0) means participant p1 is available 09:00-09:30 on Monday.
    ;; ===============================

    ;; ---- Example aggregated availabilities (hypothetical) ----
    ;; This example was chosen so that s4 is the single common 30-min slot for all participants.
    ;; Replace these with real aggregated facts you provide.
    (avail p1 s1) (avail p1 s4) (avail p1 s6)
    (avail p2 s0) (avail p2 s4) (avail p2 s7)
    (avail p3 s2) (avail p3 s4)
    (avail p4 s4) (avail p4 s5)
    (avail p5 s3) (avail p5 s4) (avail p5 s8)
    (avail p6 s4) (avail p6 s9)
    (avail p7 s4) (avail p7 s10)
    ;; ---------------------------------------------------------
  )

  ;; Goal: get a meeting scheduled (some slot)
  (:goal (meeting-scheduled))
)