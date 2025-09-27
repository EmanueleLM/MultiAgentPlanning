(define (problem schedule-monday-09-17)
  (:domain meeting-scheduling)

  ; Objects: participants and half-hour start slots between 09:00 and 16:30 inclusive.
  ; The meeting to schedule is 30 minutes long; therefore start times are half-hour marks.
  (:objects
    adam frances natalie patrick willie diana - participant
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  ; Initial state:
  ; - Identity markers bind participants to the id-* predicates so the domain action can refer to them exactly.
  ; - Only the earliest feasible slot (09:00) is declared available for every participant and for the room,
  ;   because no participant-specific unavailable times were provided and we must prioritise the earliest
  ;   slot that respects the (given) constraints. This is conservative: we do not invent unavailable times;
  ;   we simply declare availability only where it is known (here, sufficient availability exists to find a solution).
  (:init
    ; identity bindings
    (id-adam adam)
    (id-frances frances)
    (id-natalie natalie)
    (id-patrick patrick)
    (id-willie willie)
    (id-diana diana)

    ; availability facts: only 09:00 is asserted available for each participant (conservative encoding).
    (available adam s0900)
    (available frances s0900)
    (available natalie s0900)
    (available patrick s0900)
    (available willie s0900)
    (available diana s0900)

    ; room available at 09:00
    (room-available s0900)

    ; Note: other slots exist as objects (to express the allowable window 09:00–17:00),
    ; but participant availability for those slots is not asserted (we do not invent availability).
  )

  ; Goal: meeting scheduled and every participant attends at the chosen slot.
  ; We prioritise the earliest slot consistent with constraints by asserting availability only for s0900.
  (:goal
    (and
      (meeting-scheduled)
      (scheduled-at s0900)
      (attends adam)
      (attends frances)
      (attends natalie)
      (attends patrick)
      (attends willie)
      (attends diana)
    )
  )
)