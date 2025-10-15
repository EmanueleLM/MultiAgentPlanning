(define (domain meeting-scheduling)
  (:requirements :strips :typing :existential-preconditions :action-costs)
  (:types agent slot)
  (:constants marie janice elijah theresa - agent)

  (:predicates
    (available ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
    (unscheduled)
    (slot-cost-0 ?s - slot)
    (slot-cost-1 ?s - slot)
    (slot-cost-2 ?s - slot)
    (slot-cost-3 ?s - slot)
    (slot-cost-4 ?s - slot)
    (slot-cost-5 ?s - slot)
    (slot-cost-6 ?s - slot)
    (slot-cost-7 ?s - slot)
    (slot-cost-8 ?s - slot)
    (slot-cost-9 ?s - slot)
    (slot-cost-10 ?s - slot)
    (slot-cost-11 ?s - slot)
    (slot-cost-12 ?s - slot)
    (slot-cost-13 ?s - slot)
    (slot-cost-14 ?s - slot)
    (slot-cost-15 ?s - slot)
  )

  (:functions (total-cost))

  (:action schedule-meeting-cost-0
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (available marie ?s)
      (available janice ?s)
      (available elijah ?s)
      (available theresa ?s)
      (slot-cost-0 ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (not (unscheduled))
      (increase (total-cost) 0)
    )
  )

  (:action schedule-meeting-cost-1
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (available marie ?s)
      (available janice ?s)
      (available elijah ?s)
      (available theresa ?s)
      (slot-cost-1 ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (not (unscheduled))
      (increase (total-cost) 1)
    )
  )

  (:action schedule-meeting-cost-2
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (available marie ?s)
      (available janice ?s)
      (available elijah ?s)
      (available theresa ?s)
      (slot-cost-2 ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (not (unscheduled))
      (increase (total-cost) 2)
    )
  )

  (:action schedule-meeting-cost-3
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (available marie ?s)
      (available janice ?s)
      (available elijah ?s)
      (available theresa ?s)
      (slot-cost-3 ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (not (unscheduled))
      (increase (total-cost) 3)
    )
  )

  (:action schedule-meeting-cost-4
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (available marie ?s)
      (available janice ?s)
      (available elijah ?s)
      (available theresa ?s)
      (slot-cost-4 ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (not (unscheduled))
      (increase (total-cost) 4)
    )
  )

  (:action schedule-meeting-cost-5
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (available marie ?s)
      (available janice ?s)
      (available elijah ?s)
      (available theresa ?s)
      (slot-cost-5 ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (not (unscheduled))
      (increase (total-cost) 5)
    )
  )

  (:action schedule-meeting-cost-6
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (available marie ?s)
      (available janice ?s)
      (available elijah ?s)
      (available theresa ?s)
      (slot-cost-6 ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (not (unscheduled))
      (increase (total-cost) 6)
    )
  )

  (:action schedule-meeting-cost-7
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (available marie ?s)
      (available janice ?s)
      (available elijah ?s)
      (available theresa ?s)
      (slot-cost-7 ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (not (unscheduled))
      (increase (total-cost) 7)
    )
  )

  (:action schedule-meeting-cost-8
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (available marie ?s)
      (available janice ?s)
      (available elijah ?s)
      (available theresa ?s)
      (slot-cost-8 ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (not (unscheduled))
      (increase (total-cost) 8)
    )
  )

  (:action schedule-meeting-cost-9
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (available marie ?s)
      (available janice ?s)
      (available elijah ?s)
      (available theresa ?s)
      (slot-cost-9 ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (not (unscheduled))
      (increase (total-cost) 9)
    )
  )

  (:action schedule-meeting-cost-10
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (available marie ?s)
      (available janice ?s)
      (available elijah ?s)
      (available theresa ?s)
      (slot-cost-10 ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (not (unscheduled))
      (increase (total-cost) 10)
    )
  )

  (:action schedule-meeting-cost-11
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (available marie ?s)
      (available janice ?s)
      (available elijah ?s)
      (available theresa ?s)
      (slot-cost-11 ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (not (unscheduled))
      (increase (total-cost) 11)
    )
  )

  (:action schedule-meeting-cost-12
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (available marie ?s)
      (available janice ?s)
      (available elijah ?s)
      (available theresa ?s)
      (slot-cost-12 ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (not (unscheduled))
      (increase (total-cost) 12)
    )
  )

  (:action schedule-meeting-cost-13
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (available marie ?s)
      (available janice ?s)
      (available elijah ?s)
      (available theresa ?s)
      (slot-cost-13 ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (not (unscheduled))
      (increase (total-cost) 13)
    )
  )

  (:action schedule-meeting-cost-14
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (available marie ?s)
      (available janice ?s)
      (available elijah ?s)
      (available theresa ?s)
      (slot-cost-14 ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (not (unscheduled))
      (increase (total-cost) 14)
    )
  )

  (:action schedule-meeting-cost-15
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (available marie ?s)
      (available janice ?s)
      (available elijah ?s)
      (available theresa ?s)
      (slot-cost-15 ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (not (unscheduled))
      (increase (total-cost) 15)
    )
  )

)