(define (domain calendar-scheduling-monday)
  (:requirements :strips :typing)
  (:types timeslot person)
  (:predicates
    (working-slot ?s - timeslot)
    (allowed-slot ?s - timeslot)
    (preferred-slot ?s - timeslot)

    (free-roy ?s - timeslot)
    (free-kathryn ?s - timeslot)
    (free-amy ?s - timeslot)

    (busy-roy ?s - timeslot)
    (busy-kathryn ?s - timeslot)
    (busy-amy ?s - timeslot)

    (open)
    (scheduled-at ?s - timeslot)
  )

  (:action schedule-meeting
    :parameters (?s - timeslot)
    :precondition (and
      (open)
      (working-slot ?s)
      (allowed-slot ?s)
      (free-roy ?s)
      (free-kathryn ?s)
      (free-amy ?s)
    )
    :effect (and
      (scheduled-at ?s)
      (not (open))
    )
  )
)