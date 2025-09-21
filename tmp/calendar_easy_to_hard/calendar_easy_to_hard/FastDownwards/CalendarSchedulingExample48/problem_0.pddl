(define (problem schedule-meeting-monday-unified)
  (:domain meeting-scheduling-unified)

  ;; 30-minute start slots from 09:00 to 16:30 (s0 = 09:00-09:30, s1 = 09:30-10:00, ..., s15 = 16:30-17:00)
  (:objects
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )

  (:init
    ;; Known busy facts integrated from participant fragments (union of provided constraints).
    ;; Noah: no known busy facts (no (busy-noah ...) facts).

    ;; Teresa: known busy on 11:00-12:00 (blocks starts 11:00 & 11:30),
    ;;           14:00-15:00 (blocks 14:00 & 14:30),
    ;;           16:00-17:00 (blocks 16:00 & 16:30)
    (busy-teresa s4)  ;; 11:00
    (busy-teresa s5)  ;; 11:30
    (busy-teresa s10) ;; 14:00
    (busy-teresa s11) ;; 14:30
    (busy-teresa s14) ;; 16:00
    (busy-teresa s15) ;; 16:30

    ;; Bradley: known busy at 09:00, 10:00, 15:00, 16:00 (per fragments)
    (busy-bradley s0)  ;; 09:00
    (busy-bradley s2)  ;; 10:00
    (busy-bradley s12) ;; 15:00
    (busy-bradley s14) ;; 16:00

    ;; Philip: known busy at 09:00-09:30, 11:30-12:00, 12:30-13:00, 16:30-17:00
    (busy-philip s0)  ;; 09:00
    (busy-philip s5)  ;; 11:30
    (busy-philip s7)  ;; 12:30
    (busy-philip s15) ;; 16:30

    ;; Joyce: known busy slots based on fragments
    ;; 09:30-10:00 -> s1
    ;; 11:30-12:30 -> s5,s6
    ;; 13:30-14:30 -> s9,s10
    ;; 15:30-17:00 -> s13,s14,s15
    (busy-joyce s1)
    (busy-joyce s5)
    (busy-joyce s6)
    (busy-joyce s9)
    (busy-joyce s10)
    (busy-joyce s13)
    (busy-joyce s14)
    (busy-joyce s15)

    ;; Ryan: known busy from fragments:
    ;; 09:00-10:30 -> s0,s1,s2
    ;; 11:00-11:30 -> s4
    ;; 14:00-17:00 -> s10,s11,s12,s13,s14,s15
    (busy-ryan s0)
    (busy-ryan s1)
    (busy-ryan s2)
    (busy-ryan s4)
    (busy-ryan s10)
    (busy-ryan s11)
    (busy-ryan s12)
    (busy-ryan s13)
    (busy-ryan s14)
    (busy-ryan s15)

    ;; Aaron: known busy from fragments:
    ;; 10:00-12:00 -> s2,s3,s4,s5
    ;; 14:00-14:30 -> s10
    ;; 15:00-16:30 -> s12,s13,s14
    (busy-aaron s2)
    (busy-aaron s3)
    (busy-aaron s4)
    (busy-aaron s5)
    (busy-aaron s10)
    (busy-aaron s12)
    (busy-aaron s13)
    (busy-aaron s14)

    ;; No additional busy facts are asserted beyond those provided in participant fragments.
    ;; (Agents not having busy facts for a slot are treated as available for that slot.)
  )

  ;; Goal: find any single 30-minute slot between 09:00 and 17:00 (start 09:00..16:30) that is free
  ;; for all participants and schedule the meeting there.
  (:goal
    (meeting-scheduled)
  )
)