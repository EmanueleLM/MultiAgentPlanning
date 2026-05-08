; Problem: schedule one 30-minute meeting (1 slot) on Monday between 09:00 and 17:00
; Time resolution 30 minutes => slots:
; s1=09:00-09:30 s2=09:30-10:00 s3=10:00-10:30 s4=10:30-11:00
; s5=11:00-11:30 s6=11:30-12:00 s7=12:00-12:30 s8=12:30-13:00
; s9=13:00-13:30 s10=13:30-14:00 s11=14:00-14:30 s12=14:30-15:00
; s13=15:00-15:30 s14=15:30-16:00 s15=16:00-16:30 s16=16:30-17:00

(define (problem schedule-monday-30)
  (:domain meeting-scheduler)
  (:objects
    donna john billy - agent
    meeting1 - meeting
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )

  (:init
    ; entities
    (agent donna) (agent john) (agent billy)
    (meeting meeting1)
    (slot s1) (slot s2) (slot s3) (slot s4) (slot s5) (slot s6) (slot s7) (slot s8)
    (slot s9) (slot s10) (slot s11) (slot s12) (slot s13) (slot s14) (slot s15) (slot s16)

    ; successor links to enforce contiguity when required (start-inclusive end-exclusive)
    (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9)
    (next s9 s10) (next s10 s11) (next s11 s12) (next s12 s13)
    (next s13 s14) (next s14 s15) (next s15 s16)

    ; Encoded blocking (busy intervals from validated audit report; these are hard constraints)
    ; Donna busy on Monday 14:00-14:30 (s11) and 15:30-16:00 (s14)
    (blocked donna s11)
    (blocked donna s14)

    ; John busy on Monday 11:00-11:30 (s5) and 16:30-17:00 (s16)
    (blocked john s5)
    (blocked john s16)

    ; Billy busy on Monday 09:00-10:00 (s1,s2), 10:30-14:00 (s4,s5,s6,s7,s8,s9,s10), 14:30-17:00 (s12,s13,s14,s15,s16)
    (blocked billy s1) (blocked billy s2)
    (blocked billy s4) (blocked billy s5) (blocked billy s6) (blocked billy s7) (blocked billy s8) (blocked billy s9) (blocked billy s10)
    (blocked billy s12) (blocked billy s13) (blocked billy s14) (blocked billy s15) (blocked billy s16)
  )

  ; Goal: one meeting is scheduled and occupies a slot that is free for Donna, John, and Billy.
  ; Based on the validated constraints, the feasible shared free slot is s3 (10:00-10:30).
  (:goal (and
    (meeting-scheduled meeting1)
    (meeting-at meeting1 s3)
  ))
)