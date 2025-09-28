(define (domain meeting-scheduling)
  (:requirements :typing :strips :action-costs :equality)
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
      (meeting-scheduled slot_09_00)
      (increase (total-cost) 1)
    )
  )
  (:action schedule-09-30
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot_09_30)
      (increase (total-cost) 2)
    )
  )
  (:action schedule-10-00
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot_10_00)
      (increase (total-cost) 3)
    )
  )
  (:action schedule-10-30
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot_10_30)
      (increase (total-cost) 4)
    )
  )
  (:action schedule-11-00
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot_11_00)
      (increase (total-cost) 5)
    )
  )
  (:action schedule-11-30
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot_11_30)
      (increase (total-cost) 6)
    )
  )
  (:action schedule-12-00
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot_12_00)
      (increase (total-cost) 7)
    )
  )
  (:action schedule-12-30
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot_12_30)
      (increase (total-cost) 8)
    )
  )
  (:action schedule-13-00
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot_13_00)
      (increase (total-cost) 9)
    )
  )
  (:action schedule-13-30
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot_13_30)
      (increase (total-cost) 10)
    )
  )
  (:action schedule-14-00
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot_14_00)
      (increase (total-cost) 11)
    )
  )
  (:action schedule-14-30
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot_14_30)
      (increase (total-cost) 12)
    )
  )
  (:action schedule-15-00
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot_15_00)
      (increase (total-cost) 13)
    )
  )
  (:action schedule-15-30
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot_15_30)
      (increase (total-cost) 14)
    )
  )
  (:action schedule-16-00
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot_16_00)
      (increase (total-cost) 15)
    )
  )
  (:action schedule-16-30
    :parameters ()
    :precondition (and)
    :effect (and
      (meeting-scheduled slot_16_30)
      (increase (total-cost) 16)
    )
  )
)