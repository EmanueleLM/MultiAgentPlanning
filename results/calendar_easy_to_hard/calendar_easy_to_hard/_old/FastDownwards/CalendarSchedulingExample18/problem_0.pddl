(define (problem combined-schedule-monday)
  (:domain combined-schedule)

  (:objects
    ;; sixteen 30-minute slots from 09:00 to 16:30
    slot-09-00 slot-09-30 slot-10-00 slot-10-30
    slot-11-00 slot-11-30 slot-12-00 slot-12-30
    slot-13-00 slot-13-30 slot-14-00 slot-14-30
    slot-15-00 slot-15-30 slot-16-00 slot-16-30 - slot

    brian billy patricia - person
  )

  (:init
    ;; mark slots and that they are within Monday work hours 09:00-17:00
    (slot slot-09-00)   (within-work-hours slot-09-00)
    (slot slot-09-30)   (within-work-hours slot-09-30)
    (slot slot-10-00)   (within-work-hours slot-10-00)
    (slot slot-10-30)   (within-work-hours slot-10-30)
    (slot slot-11-00)   (within-work-hours slot-11-00)
    (slot slot-11-30)   (within-work-hours slot-11-30)
    (slot slot-12-00)   (within-work-hours slot-12-00)
    (slot slot-12-30)   (within-work-hours slot-12-30)
    (slot slot-13-00)   (within-work-hours slot-13-00)
    (slot slot-13-30)   (within-work-hours slot-13-30)
    (slot slot-14-00)   (within-work-hours slot-14-00)
    (slot slot-14-30)   (within-work-hours slot-14-30)
    (slot slot-15-00)   (within-work-hours slot-15-00)
    (slot slot-15-30)   (within-work-hours slot-15-30)
    (slot slot-16-00)   (within-work-hours slot-16-00)
    (slot slot-16-30)   (within-work-hours slot-16-30)

    ;; initially all slots are free
    (slot-free slot-09-00) (slot-free slot-09-30) (slot-free slot-10-00) (slot-free slot-10-30)
    (slot-free slot-11-00) (slot-free slot-11-30) (slot-free slot-12-00) (slot-free slot-12-30)
    (slot-free slot-13-00) (slot-free slot-13-30) (slot-free slot-14-00) (slot-free slot-14-30)
    (slot-free slot-15-00) (slot-free slot-15-30) (slot-free slot-16-00) (slot-free slot-16-30)

    ;; Brian's known availability (Brian reported he is free all day)
    (available-brian slot-09-00)
    (available-brian slot-09-30)
    (available-brian slot-10-00)
    (available-brian slot-10-30)
    (available-brian slot-11-00)
    (available-brian slot-11-30)
    (available-brian slot-12-00)
    (available-brian slot-12-30)
    (available-brian slot-13-00)
    (available-brian slot-13-30)
    (available-brian slot-14-00)
    (available-brian slot-14-30)
    (available-brian slot-15-00)
    (available-brian slot-15-30)
    (available-brian slot-16-00)
    (available-brian slot-16-30)

    ;; Billy's known busy times (from agent 2):
    ;; busy at 10:00-10:30, 11:30-12:00, 14:00-14:30, 16:30-17:00
    (busy-billy slot-10-00)
    (busy-billy slot-11-30)
    (busy-billy slot-14-00)
    (busy-billy slot-16-30)

    ;; Patricia's known busy slots (from agent 3).
    ;; s1..s7 => 09:00..12:00 inclusive; s10=13:30, s12=14:30, s13=15:00, s14=15:30, s16=16:30
    (busy-patricia slot-09-00)  ; s1
    (busy-patricia slot-09-30)  ; s2
    (busy-patricia slot-10-00)  ; s3
    (busy-patricia slot-10-30)  ; s4
    (busy-patricia slot-11-00)  ; s5
    (busy-patricia slot-11-30)  ; s6
    (busy-patricia slot-12-00)  ; s7
    (busy-patricia slot-13-30)  ; s10
    (busy-patricia slot-14-30)  ; s12
    (busy-patricia slot-15-00)  ; s13
    (busy-patricia slot-15-30)  ; s14
    (busy-patricia slot-16-30)  ; s16

    ;; mark late slots (after 15:30) for the soft preference:
    ;; treat start times 16:00 and 16:30 as "late"
    (late slot-16-00)
    (late slot-16-30)
  )

  ;; Soft preference: avoid scheduling after 15:30 if possible (from agent 2).
  ;; This is a preference, not a hard constraint. Some planners may ignore it.
  (:preferences
    (avoid-after-1530
      (forall (?s - slot)
        (imply (meeting-at ?s) (not (late ?s)))
      )
    )
  )

  ;; Goal: a single booked meeting that records attendance for Brian, Billy and Patricia.
  (:goal (meeting-booked))
)