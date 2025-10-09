(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)

  (:objects
    marie janice elijah theresa - participant
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - slot
  )

  (:init
    ; slot objects (representing 30-minute increments from 09:00 to 17:00)
    (slot t0)   ; 09:00-09:30
    (slot t1)   ; 09:30-10:00
    (slot t2)   ; 10:00-10:30
    (slot t3)   ; 10:30-11:00
    (slot t4)   ; 11:00-11:30
    (slot t5)   ; 11:30-12:00
    (slot t6)   ; 12:00-12:30
    (slot t7)   ; 12:30-13:00
    (slot t8)   ; 13:00-13:30
    (slot t9)   ; 13:30-14:00
    (slot t10)  ; 14:00-14:30
    (slot t11)  ; 14:30-15:00
    (slot t12)  ; 15:00-15:30
    (slot t13)  ; 15:30-16:00
    (slot t14)  ; 16:00-16:30
    (slot t15)  ; 16:30-17:00

    (participant marie)
    (participant janice)
    (participant elijah)
    (participant theresa)

    ; ----------------------------
    ; Busy intervals encoded as busy facts (interpreted as unavailable)
    ; ----------------------------
    ; Marie: Busy 11:00-11:30 (t4), and 15:00-16:30 (t12,t13,t14)
    (busy marie t4)
    (busy marie t12)
    (busy marie t13)
    (busy marie t14)

    ; Janice: Busy 12:30-13:00 (t7), and 13:30-15:00 (t9,t10,t11)
    (busy janice t7)
    (busy janice t9)
    (busy janice t10)
    (busy janice t11)

    ; Elijah: Busy 10:00-13:00 (t2,t3,t4,t5,t6,t7), 14:30-15:00 (t11), 16:00-16:30 (t14)
    (busy elijah t2)
    (busy elijah t3)
    (busy elijah t4)
    (busy elijah t5)
    (busy elijah t6)
    (busy elijah t7)
    (busy elijah t11)
    (busy elijah t14)

    ; Theresa: Busy 09:30-10:30 (t1,t2), 12:00-13:00 (t6,t7), 13:30-14:00 (t9),
    ; 14:30-15:00 (t11), 15:30-16:00 (t13), 16:30-17:00 (t15)
    ; Plus preference -> hard constraint: do not meet after 12:00 (enforced by only marking available slots before 12:00)
    (busy theresa t1)
    (busy theresa t2)
    (busy theresa t6)
    (busy theresa t7)
    (busy theresa t9)
    (busy theresa t11)
    (busy theresa t13)
    (busy theresa t15)

    ; ----------------------------
    ; Precomputed slot-available facts:
    ; A slot-available fact is present only if all participants are free in that slot
    ; AND the slot respects Theresa's hard preference (meeting must start at or before 11:30 -> t0..t5 allowed).
    ; Based on the busy facts above, only t0 (09:00-09:30) is free for everyone.
    ; ----------------------------
    (slot-available t0)

    ; No meeting scheduled yet: absence of (scheduled) means (not (scheduled)) holds.
  )

  (:goal (scheduled))

  ; No metric specified; the encoding enforces earliest available slot with negative preconditions
  ; on schedule actions so the planner will select the earliest slot-available (t0) when producing a plan.
)