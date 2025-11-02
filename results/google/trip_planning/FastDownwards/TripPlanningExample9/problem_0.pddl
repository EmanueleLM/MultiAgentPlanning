(define (problem cityplan-prob-10days)
  (:domain cityplan)

  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    f1 f2 f3 - fra-token
    b1 b2 b3 - buh-token
  )

  (:init
    ; day succession
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    (last d10)

    ; starting point and day pointer
    (now d1)
    (loc buh)

    ; workshop window: days 5..10
    (in-window d5)
    (in-window d6)
    (in-window d7)
    (in-window d8)
    (in-window d9)
    (in-window d10)

    ; direct flights (bidirectional where available)
    (edge buh fra)
    (edge fra buh)
    (edge fra str)
    (edge str fra)

    ; quota tokens for exact city-day counts
    (available-fra f1)
    (available-fra f2)
    (available-fra f3)
    (available-buh b1)
    (available-buh b2)
    (available-buh b3)

    (= (total-cost) 0)
  )

  (:goal
    (and
      ; all 10 days assigned
      (assigned d1)
      (assigned d2)
      (assigned d3)
      (assigned d4)
      (assigned d5)
      (assigned d6)
      (assigned d7)
      (assigned d8)
      (assigned d9)
      (assigned d10)

      ; quotas exactly met: 3 FRA days and 3 BUH days
      (used-fra f1)
      (used-fra f2)
      (used-fra f3)
      (used-buh b1)
      (used-buh b2)
      (used-buh b3)

      ; workshop constraint satisfied: at least one STR day within 5..10
      (workshop-done)
    )
  )

  (:metric minimize (total-cost))
)