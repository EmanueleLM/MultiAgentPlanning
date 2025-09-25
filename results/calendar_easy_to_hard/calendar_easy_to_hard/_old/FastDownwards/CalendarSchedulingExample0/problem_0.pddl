(define (problem orchestrate-meeting)
  (:domain orchestrated-scheduling)

  (:objects
    michelle steven jerry - person
    m1 - meeting
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )

  (:init
    ;; Meeting requirement
    (duration-60 m1)

    ;; Persons
    (person michelle) (person steven) (person jerry)

    ;; Half-hour slots: s0 = 09:00-09:30, ..., s15 = 16:30-17:00
    (slot s0) (slot s1) (slot s2) (slot s3) (slot s4) (slot s5) (slot s6) (slot s7)
    (slot s8) (slot s9) (slot s10) (slot s11) (slot s12) (slot s13) (slot s14) (slot s15)

    ;; Consecutive half-hour relations
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)

    ;; -----------------------
    ;; Michelle's availability (originally provided as 1-hour slots).
    ;; Mapping hour slots to half-hour slots:
    ;;  9:00-10:00   -> s0,s1
    ;; 10:00-11:00   -> s2,s3
    ;; 11:00-12:00   -> busy (s4,s5)
    ;; 12:00-13:00   -> s6,s7
    ;; 13:00-14:00   -> s8,s9
    ;; 14:00-15:00   -> s10,s11
    ;; 15:00-16:00   -> s12,s13
    ;; 16:00-17:00   -> s14,s15
    ;; We encode free halves accordingly (michelle is free on both halves of the hour slots except 11:00-12:00).
    (free michelle s0) (free michelle s1)
    (free michelle s2) (free michelle s3)
    (free michelle s6) (free michelle s7)
    (free michelle s8) (free michelle s9)
    (free michelle s10) (free michelle s11)
    (free michelle s12) (free michelle s13)
    (free michelle s14) (free michelle s15)

    ;; -----------------------
    ;; Steven's availability (provided as 30-minute slots t0..t15 mapping to s0..s15).
    ;; Known blocked for Steven: t0 (s0), t5 (s5), t9 (s9), t13 (s13)
    ;; Free slots asserted (all other slots he is known free on):
    (free steven s1) (free steven s2) (free steven s3) (free steven s4)
    (free steven s6) (free steven s7) (free steven s8)
    (free steven s10) (free steven s11) (free steven s12)
    (free steven s14) (free steven s15)

    ;; -----------------------
    ;; Jerry's availability (provided as s0..s15). Known blocked intervals produce frees:
    ;; Free halves for Jerry (from provided blocked list):
    (free jerry s1)   ; 09:30-10:00
    (free jerry s4)   ; 11:00-11:30
    (free jerry s7)   ; 12:30-13:00
    (free jerry s11)  ; 14:30-15:00
    (free jerry s12)  ; 15:00-15:30
    (free jerry s14)  ; 16:00-16:30

    ;; Note: We do not assume frees beyond those explicitly provided by each agent.
    ;; -----------------------
    ;; No scheduled facts initially.
  )

  ;; Goal: finalize the meeting once all three agents have scheduled the same consecutive pair.
  (:goal (meeting-finalized m1))
)