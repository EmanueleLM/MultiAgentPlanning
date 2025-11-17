(define (problem schedule-monday-09-17)
  (:domain meeting-scheduling)
  (:objects
    alex elizabeth walter - person
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
    meeting1 - meeting
  )

  (:init
    ; individuals and meeting
    (person alex) (person elizabeth) (person walter)
    (meeting meeting1)

    ; slots (30-minute slots from 09:00 to 17:00 on Monday)
    (slot s1)  ; 09:00-09:30
    (slot s2)  ; 09:30-10:00
    (slot s3)  ; 10:00-10:30
    (slot s4)  ; 10:30-11:00
    (slot s5)  ; 11:00-11:30
    (slot s6)  ; 11:30-12:00
    (slot s7)  ; 12:00-12:30
    (slot s8)  ; 12:30-13:00
    (slot s9)  ; 13:00-13:30
    (slot s10) ; 13:30-14:00
    (slot s11) ; 14:00-14:30
    (slot s12) ; 14:30-15:00
    (slot s13) ; 15:00-15:30
    (slot s14) ; 15:30-16:00
    (slot s15) ; 16:00-16:30
    (slot s16) ; 16:30-17:00

    ; successor (next) relation for the ordered sequence of slots (enforces contiguity)
    (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9)
    (next s9 s10) (next s10 s11) (next s11 s12) (next s12 s13)
    (next s13 s14) (next s14 s15) (next s15 s16)

    ; Individual availability derived from audited busy intervals.
    ; Alexander busy: s2, s4, s8, s12, s15, s16 -> Alexander free at all other slots
    (free alex s1) (free alex s3) (free alex s5) (free alex s6)
    (free alex s7) (free alex s9) (free alex s10) (free alex s11)
    (free alex s13) (free alex s14)

    ; Elizabeth busy: s1, s6, s7, s9, s10, s11 -> Elizabeth free at other slots
    (free elizabeth s2) (free elizabeth s3) (free elizabeth s4)
    (free elizabeth s5) (free elizabeth s8) (free elizabeth s12)
    (free elizabeth s13) (free elizabeth s14) (free elizabeth s15) (free elizabeth s16)

    ; Walter busy: s1..s11 and s14..s16 -> Walter free only at s12 and s13
    (free walter s12) (free walter s13)

    ; free-all facts: only slots where all required participants are free.
    ; Based on the above availability, only s13 (15:00-15:30) is mutually free.
    (free-all s13)
  )

  ; Goal: the meeting must be scheduled and fixed at the permissible earliest feasible slot.
  (:goal (and
    (scheduled meeting1)
    (scheduled-at meeting1 s13)
  ))