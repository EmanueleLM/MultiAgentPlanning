(define (domain meeting-scheduling-structured)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    participant slot tick
  )
  (:predicates
    (is-participant ?p - participant)
    (is-slot ?s - slot)
    (is-tick ?t - tick)

    ; discrete time structure
    (next ?t1 - tick ?t2 - tick)              ; successor relation between contiguous 30-minute ticks
    (within-work ?t - tick)                   ; tick lies within work hours

    ; slot-to-tick coverage and terminal tick
    (covers ?s - slot ?t - tick)              ; slot covers this tick
    (ends-at ?s - slot ?t - tick)             ; final tick of the slot (meeting end is end of this tick)

    ; availability at tick granularity
    (available-in ?p - participant ?t - tick)

    ; participants required for this slot (explicit roles to avoid universal quantification)
    (attendee1 ?s - slot ?p - participant)
    (attendee2 ?s - slot ?p - participant)
    (attendee3 ?s - slot ?p - participant)

    ; audited recommendation and preference boundary
    (audited-recommended ?s - slot)
    (ends-by-1430 ?t - tick)                  ; ticks whose end time is <= 14:30

    ; booking status
    (chosen ?s - slot)
    (scheduled)
  )

  (:action select-and-schedule-recommended
    :parameters (?s - slot ?t1 - tick ?t2 - tick ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (is-slot ?s)
      (is-tick ?t1)
      (is-tick ?t2)

      ; recommended slot and its discrete-time structure
      (audited-recommended ?s)
      (covers ?s ?t1)
      (covers ?s ?t2)
      (next ?t1 ?t2)
      (ends-at ?s ?t2)

      ; work-hour compliance
      (within-work ?t1)
      (within-work ?t2)

      ; bind required attendees to this slot and enforce their availability on both ticks
      (attendee1 ?s ?p1)
      (available-in ?p1 ?t1)
      (available-in ?p1 ?t2)

      (attendee2 ?s ?p2)
      (available-in ?p2 ?t1)
      (available-in ?p2 ?t2)

      (attendee3 ?s ?p3)
      (available-in ?p3 ?t1)
      (available-in ?p3 ?t2)

      ; preference: meeting must end by 14:30 (inclusive)
      (ends-by-1430 ?t2)

      ; terminal conditions
      (not (scheduled))
      (not (chosen ?s))
    )
    :effect (and
      (chosen ?s)
      (scheduled)
    )
  )
)