(define (domain meeting-scheduling-integrated)
  (:requirements :strips :typing)
  (:types participant slot meeting)

  (:predicates
    (free ?p - participant ?s - slot)
    (scheduled ?m - meeting ?s - slot)
    (included ?m - meeting ?p - participant)
    (proposed ?m - meeting ?s - slot)
  )

  (:action schedule_all_participants
    :parameters (?m - meeting ?s - slot
                 ?p1 - participant ?p2 - participant ?p3 - participant
                 ?p4 - participant ?p5 - participant ?p6 - participant)
    :precondition (and
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
      (free ?p4 ?s)
      (free ?p5 ?s)
      (free ?p6 ?s)
    )
    :effect (and
      (scheduled ?m ?s)
      (included ?m ?p1) (included ?m ?p2) (included ?m ?p3)
      (included ?m ?p4) (included ?m ?p5) (included ?m ?p6)
    )
  )
)