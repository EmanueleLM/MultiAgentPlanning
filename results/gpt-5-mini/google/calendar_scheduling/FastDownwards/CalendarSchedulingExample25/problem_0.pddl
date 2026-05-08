(define (problem schedule-1h-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    anthony pamela zachary - person

    ; 30-minute timeslots from 09:00 to 17:00 (t0 = 09:00-09:30, t1 = 09:30-10:00, ... t15 = 16:30-17:00)
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - timeslot
  )

  (:init
    ; declare persons and timeslots explicitly
    (person anthony)
    (person pamela)
    (person zachary)

    (timeslot t0) (timeslot t1) (timeslot t2) (timeslot t3)
    (timeslot t4) (timeslot t5) (timeslot t6) (timeslot t7)
    (timeslot t8) (timeslot t9) (timeslot t10) (timeslot t11)
    (timeslot t12) (timeslot t13) (timeslot t14) (timeslot t15)

    ; successor links (contiguity of 30-minute slots)
    (succ t0 t1) (succ t1 t2) (succ t2 t3) (succ t3 t4)
    (succ t4 t5) (succ t5 t6) (succ t6 t7) (succ t7 t8)
    (succ t8 t9) (succ t9 t10) (succ t10 t11) (succ t11 t12)
    (succ t12 t13) (succ t13 t14) (succ t14 t15)

    ; initial state: no proposal yet
    (no-proposal-yet)

    ; AVAILABILITIES
    ; Anthony: available for the whole window 09:00-17:00 (all slots)
    (available anthony t0) (available anthony t1) (available anthony t2)
    (available anthony t3) (available anthony t4) (available anthony t5)
    (available anthony t6) (available anthony t7) (available anthony t8)
    (available anthony t9) (available anthony t10) (available anthony t11)
    (available anthony t12) (available anthony t13) (available anthony t14)
    (available anthony t15)

    ; Zachary: available for the whole window 09:00-17:00 (all slots)
    (available zachary t0) (available zachary t1) (available zachary t2)
    (available zachary t3) (available zachary t4) (available zachary t5)
    (available zachary t6) (available zachary t7) (available zachary t8)
    (available zachary t9) (available zachary t10) (available zachary t11)
    (available zachary t12) (available zachary t13) (available zachary t14)
    (available zachary t15)

    ; Pamela: she prefers not to meet after 14:30. Treating that preference as a hard constraint:
    ; meeting must finish by 14:30 (that is, any occupied slot must end at or before 14:30).
    ; With 30-min slots, the slot that ends at 14:30 is t10 (14:00-14:30). To allow a 60-minute meeting
    ; finishing at or before 14:30, Pamela must be available for slots up through t10.
    (available pamela t0) (available pamela t1) (available pamela t2)
    (available pamela t3) (available pamela t4) (available pamela t5)
    (available pamela t6) (available pamela t7) (available pamela t8)
    (available pamela t9) (available pamela t10)

    ; Note: Pamela is not declared available t11..t15, which enforces her hard preference.

    ; Environment public info and auditor correctness are integrated by the availability facts above:
    ; - the scheduling window is represented by timeslots t0..t15 (09:00-17:00).
    ; - Pamela's "not after 14:30" preference is enforced by not declaring availability after t10.
    ; - The problem supplies a consistent availability set that guarantees at least one feasible solution exists.
  )

  (:goal
    (and
      (meeting-scheduled)
      (attending anthony)
      (attending pamela)
      (attending zachary)
    )
  )
)