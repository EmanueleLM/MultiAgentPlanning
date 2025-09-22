(define (domain meeting-scheduling-integrated)
  (:requirements :strips :typing :equality)
  (:types participant slot meeting)
  (:constants nicholas emma catherine steven adam lori - participant)
  (:predicates
    (free ?p - participant ?s - slot)
    (scheduled ?m - meeting ?s - slot)
    (included ?m - meeting ?p - participant)
  )

  (:action schedule_meeting_for_all
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (free nicholas ?s)
      (free emma ?s)
      (free catherine ?s)
      (free steven ?s)
      (free adam ?s)
      (free lori ?s)
    )
    :effect (and
      (scheduled ?m ?s)
      (included ?m nicholas) (included ?m emma) (included ?m catherine)
      (included ?m steven) (included ?m adam) (included ?m lori)
    )
  )
)