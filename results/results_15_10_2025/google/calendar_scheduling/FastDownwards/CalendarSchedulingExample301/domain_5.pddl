(define (domain meeting-scheduling)
  (:requirements :typing :strips :action-costs :fluents :equality)
  (:types participant slot)
  (:predicates
    (available ?p - participant ?s - slot)
    (attended ?p - participant ?s - slot)
    (meeting-scheduled ?s - slot)
  )
  (:functions (total-cost))
  (:action attend
    :parameters (?p - participant ?s - slot)
    :precondition (and (available ?p ?s))
    :effect (and (attended ?p ?s))
  )
  (:action schedule-09-00
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot-09-00)
      (increase (total-cost) 1)
    )
  )
  (:action schedule-09-30
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot-09-30)
      (increase (total-cost) 2)
    )
  )
  (:action schedule-10-00
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot-10-00)
      (increase (total-cost) 3)
    )
  )
  (:action schedule-10-30
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot-10-30)
      (increase (total-cost) 4)
    )
  )
  (:action schedule-11-00
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot-11-00)
      (increase (total-cost) 5)
    )
  )
  (:action schedule-11-30
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot-11-30)
      (increase (total-cost) 6)
    )
  )
  (:action schedule-12-00
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot-12-00)
      (increase (total-cost) 7)
    )
  )
  (:action schedule-12-30
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot-12-30)
      (increase (total-cost) 8)
    )
  )
  (:action schedule-13-00
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot-13-00)
      (increase (total-cost) 9)
    )
  )
  (:action schedule-13-30
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot-13-30)
      (increase (total-cost) 10)
    )
  )
  (:action schedule-14-00
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot-14-00)
      (increase (total-cost) 11)
    )
  )
  (:action schedule-14-30
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot-14-30)
      (increase (total-cost) 12)
    )
  )
  (:action schedule-15-00
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot-15-00)
      (increase (total-cost) 13)
    )
  )
  (:action schedule-15-30
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot-15-30)
      (increase (total-cost) 14)
    )
  )
  (:action schedule-16-00
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot-16-00)
      (increase (total-cost) 15)
    )
  )
  (:action schedule-16-30
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot-16-30)
      (increase (total-cost) 16)
    )
  )
)