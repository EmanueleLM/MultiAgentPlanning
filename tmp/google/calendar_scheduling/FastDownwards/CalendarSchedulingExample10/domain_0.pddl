(define (domain composite-meeting-scheduling)
    (:requirements :typing)
    (:types person slot meeting)

    (:predicates
      (available ?p - person ?s - slot)
      (occupied ?s - slot)
      (scheduled ?s - slot)
      (janet-free ?s - slot)
      (janet-scheduled)
    )

    ;; Agent 1: Diana's constraint (schedule a slot for Diana)
    (:action schedule-diana
      :parameters (?p - person ?s - slot)
      :precondition (and (available diana ?s)
                         (not (occupied ?s))
                         (not (scheduled ?s)))
      :effect (and (occupied ?s)
                   (not (available ?p ?s))
                   (scheduled ?s))
    )

    ;; Agent 2: Four-person meeting requiring all three participants
    ;; and marking the chosen slot as scheduled, while freeing their availabilities
    (:action schedule-meeting-2
      :parameters (?m - meeting ?t - slot ?p1 - person ?p2 - person ?p3 - person)
      :precondition (and (available ?p1 ?t)
                         (available ?p2 ?t)
                         (available ?p3 ?t)
                         (not (scheduled ?t)))
      :effect (and (scheduled ?t)
                   (not (available ?p1 ?t))
                   (not (available ?p2 ?t))
                   (not (available ?p3 ?t)))
    )

    ;; Agent 3: Janet's constraint (must pick a Janet-free slot)
    (:action schedule-janet
      :parameters (?s - slot)
      :precondition (janet-free ?s)
      :effect (and (not (janet-free ?s))
                   (janet-scheduled))
    )
  )