(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    slot-0 slot-1 slot-2 slot-3 slot-4 slot-5 slot-6 slot-7
    slot-8 slot-9 slot-10 slot-11 slot-12 slot-13 slot-14 slot-15 - slot

    Alan Michael Michelle Roy Judy Natalie Brian - participant
  )

  (:init
    (slot slot-0)  (slot slot-1)  (slot slot-2)  (slot slot-3)
    (slot slot-4)  (slot slot-5)  (slot slot-6)  (slot slot-7)
    (slot slot-8)  (slot slot-9)  (slot slot-10) (slot slot-11)
    (slot slot-12) (slot slot-13) (slot slot-14) (slot slot-15)

    (participant Alan) (participant Michael) (participant Michelle)
    (participant Roy) (participant Judy) (participant Natalie) (participant Brian)

    (free Alan slot-1)
    (free Alan slot-3)
    (free Alan slot-7)
    (free Alan slot-8)
    (free Alan slot-9)
    (free Alan slot-11)
    (free Alan slot-12)
    (free Alan slot-13)
    (free Alan slot-14)
    (free Alan slot-15)

    (free Michael slot-0) (free Michael slot-1) (free Michael slot-2) (free Michael slot-3)
    (free Michael slot-4) (free Michael slot-5) (free Michael slot-6) (free Michael slot-7)
    (free Michael slot-8) (free Michael slot-9) (free Michael slot-10) (free Michael slot-11)
    (free Michael slot-12) (free Michael slot-13) (free Michael slot-14) (free Michael slot-15)

    (free Michelle slot-0) (free Michelle slot-1) (free Michelle slot-2) (free Michelle slot-3)
    (free Michelle slot-4) (free Michelle slot-5) (free Michelle slot-6) (free Michelle slot-7)
    (free Michelle slot-8) (free Michelle slot-9) (free Michelle slot-10) (free Michelle slot-11)
    (free Michelle slot-12) (free Michelle slot-13) (free Michelle slot-14) (free Michelle slot-15)

    (free Roy slot-0)
    (free Roy slot-2)
    (free Roy slot-3)
    (free Roy slot-4)
    (free Roy slot-5)
    (free Roy slot-6)
    (free Roy slot-8)
    (free Roy slot-11)
    (free Roy slot-12)
    (free Roy slot-13)
    (free Roy slot-14)
    (free Roy slot-15)

    (free Judy slot-3)
    (free Judy slot-13)

    (free Natalie slot-1)
    (free Natalie slot-2)
    (free Natalie slot-3)
    (free Natalie slot-7)

    (free Brian slot-0)
    (free Brian slot-3)
    (free Brian slot-6)
    (free Brian slot-7)
    (free Brian slot-8)
    (free Brian slot-10)
    (free Brian slot-12)
    (free Brian slot-14)
  )

  (:goal (scheduled))

  (:action-costs
    ((schedule slot-0) 0)
    ((schedule slot-1) 1)
    ((schedule slot-2) 2)
    ((schedule slot-3) 3)
    ((schedule slot-4) 4)
    ((schedule slot-5) 5)
    ((schedule slot-6) 6)
    ((schedule slot-7) 7)
    ((schedule slot-8) 8)
    ((schedule slot-9) 9)
    ((schedule slot-10) 10)
    ((schedule slot-11) 11)
    ((schedule slot-12) 12)
    ((schedule slot-13) 13)
    ((schedule slot-14) 14)
    ((schedule slot-15) 15)
  )
)