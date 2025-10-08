(define (problem schedule-monday-09-17)
  (:domain multi-agent-meeting)
  (:objects
    peter judith keith evelyn - person
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )

  ;; Slot mapping (30-minute granularity):
  ;; s0 = 09:00-09:30
  ;; s1 = 09:30-10:00
  ;; s2 = 10:00-10:30
  ;; s3 = 10:30-11:00
  ;; s4 = 11:00-11:30
  ;; s5 = 11:30-12:00
  ;; s6 = 12:00-12:30
  ;; s7 = 12:30-13:00
  ;; s8 = 13:00-13:30
  ;; s9 = 13:30-14:00
  ;; s10 = 14:00-14:30
  ;; s11 = 14:30-15:00
  ;; s12 = 15:00-15:30
  ;; s13 = 15:30-16:00
  ;; s14 = 16:00-16:30
  ;; s15 = 16:30-17:00

  (:init
    ;; Peter unavailable:
    (busy peter s0)   ;; 09:00-09:30
    (busy peter s3)   ;; 10:30-11:00
    (busy peter s5)   ;; 11:30-12:00
    (busy peter s7)   ;; 12:30-13:00

    ;; Judith: no busy slots (calendar wide open)

    ;; Keith unavailable:
    (busy keith s5)   ;; 11:30-12:00
    (busy keith s7)   ;; 12:30-13:00
    (busy keith s8)   ;; 13:00-13:30
    (busy keith s9)   ;; 13:30-14:00
    (busy keith s10)  ;; 14:00-14:30
    (busy keith s11)  ;; 14:30-15:00
    (busy keith s13)  ;; 15:30-16:00
    (busy keith s15)  ;; 16:30-17:00

    ;; Evelyn unavailable:
    (busy evelyn s0)  ;; 09:00-09:30
    (busy evelyn s1)  ;; 09:30-10:00
    (busy evelyn s2)  ;; 10:00-10:30
    (busy evelyn s3)  ;; 10:30-11:00
    (busy evelyn s4)  ;; 11:00-11:30
    (busy evelyn s5)  ;; 11:30-12:00
    (busy evelyn s6)  ;; 12:00-12:30
    (busy evelyn s9)  ;; 13:30-14:00
    (busy evelyn s10) ;; 14:00-14:30
    (busy evelyn s11) ;; 14:30-15:00
    (busy evelyn s12) ;; 15:00-15:30
    (busy evelyn s15) ;; 16:30-17:00
  )

  (:goal (meeting_scheduled))
)