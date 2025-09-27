(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    denise joseph henry christian - participant
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )
  (:init
    ; start slots: valid meeting start times are s1..s15 (meeting occupies two consecutive half-hour slots)
    (start-slot s1) (start-slot s2) (start-slot s3) (start-slot s4) (start-slot s5)
    (start-slot s6) (start-slot s7) (start-slot s8) (start-slot s9) (start-slot s10)
    (start-slot s11) (start-slot s12) (start-slot s13) (start-slot s14) (start-slot s15)

    ; sequential half-hour slots mapping: s1=09:00-09:30, s2=09:30-10:00, ..., s16=16:30-17:00
    (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6) (next s6 s7)
    (next s7 s8) (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12) (next s12 s13)
    (next s13 s14) (next s14 s15) (next s15 s16)

    ; total-cost starts at 0
    (= (total-cost) 0)

    ; Free facts derived from participants' schedules (every busy interval is excluded).
    ; Denise: no busy intervals -> free all slots
    (free denise s1) (free denise s2) (free denise s3) (free denise s4)
    (free denise s5) (free denise s6) (free denise s7) (free denise s8)
    (free denise s9) (free denise s10) (free denise s11) (free denise s12)
    (free denise s13) (free denise s14) (free denise s15) (free denise s16)

    ; Joseph: no busy intervals -> free all slots
    (free joseph s1) (free joseph s2) (free joseph s3) (free joseph s4)
    (free joseph s5) (free joseph s6) (free joseph s7) (free joseph s8)
    (free joseph s9) (free joseph s10) (free joseph s11) (free joseph s12)
    (free joseph s13) (free joseph s14) (free joseph s15) (free joseph s16)

    ; Henry busy on Monday during 09:00-09:30 (s1), 10:00-10:30 (s3), 12:00-14:30 (s7,s8,s9,s10,s11),
    ; 15:00-16:00 (s13,s14), and 16:30-17:00 (s16).
    ; Therefore Henry is free on the complement:
    (free henry s2) (free henry s4) (free henry s5) (free henry s6)
    (free henry s12) (free henry s15)

    ; Christian busy on Monday during 09:00-11:00 (s1,s2,s3,s4), 14:30-15:30 (s12,s13), and 16:00-17:00 (s15,s16).
    ; Therefore Christian is free on the complement:
    (free christian s5) (free christian s6) (free christian s7) (free christian s8)
    (free christian s9) (free christian s10) (free christian s11) (free christian s14)
  )

  ; Goal: a single contiguous one-hour meeting (two consecutive half-hour slots) is scheduled for all participants on Monday.
  (:goal (meeting-scheduled))

  ; Prefer the earliest feasible start: minimize total-cost (action costs are set proportional to start slot index).
  (:metric minimize (total-cost))
)