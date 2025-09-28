(define (problem schedule-monday)
  (:domain meeting-scheduling)

  ;; Objects: start slots represent possible 30-minute meeting start times from 09:00 to 16:30
  ;; start0 = 09:00, start1 = 09:30, start2 = 10:00, start3 = 10:30
  ;; start4 = 11:00, start5 = 11:30, start6 = 12:00, start7 = 12:30
  ;; start8 = 13:00, start9 = 13:30, start10 = 14:00, start11 = 14:30
  ;; start12 = 15:00, start13 = 15:30, start14 = 16:00, start15 = 16:30
  (:objects
    start0 start1 start2 start3 start4 start5 start6 start7 start8 start9 start10 start11 start12 start13 start14 start15 - start
    william - person
  )

  (:init
    ; Public constraint: meeting must be 30 minutes long between Monday 09:00 and 17:00
    ; Participants: only William's schedule was provided. Per instructions, natural-language preference
    ; "avoid meetings after 13:30" is treated as a hard temporal constraint: meeting must not occur after 13:30.
    ; Interpreted for a 30-minute meeting as: meeting must END no later than 13:30 -> latest start is 13:00 (start8).
    ;
    ; William's availability (derived from his preference): available to start at 09:00 up to and including 13:00.
    (available william start0)  ; 09:00
    (available william start1)  ; 09:30
    (available william start2)  ; 10:00
    (available william start3)  ; 10:30
    (available william start4)  ; 11:00
    (available william start5)  ; 11:30
    (available william start6)  ; 12:00
    (available william start7)  ; 12:30
    (available william start8)  ; 13:00

    ; all-available is the intersection of every participant's availability.
    ; Only William provided, so all-available = William's available slots.
    (all-available start0)
    (all-available start1)
    (all-available start2)
    (all-available start3)
    (all-available start4)
    (all-available start5)
    (all-available start6)
    (all-available start7)
    (all-available start8)

    ; Note: slots start9..start15 are not marked available (William is assumed unavailable per his constraint).
  )

  ;; Goal:
  ;; Per the instruction "Prioritise the earliest time that respects every constraint" and treating preferences as hard,
  ;; we force scheduling at the earliest feasible slot. The earliest slot available to all participants is start0 (09:00).
  (:goal (and
    (scheduled start0)
  ))
)