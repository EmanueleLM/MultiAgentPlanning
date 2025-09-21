(define (domain meeting-scheduling-combined)
  (:requirements :typing :negative-preconditions :adl :fluents)
  (:types timeslot participant)

  (:predicates
    (available ?p - participant ?t - timeslot)
    (meeting-scheduled)
    (meeting-at ?t - timeslot)
    (before14 ?t - timeslot)
  )

  (:functions (total-cost))

  (:action schedule_by_nicole_before
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (before14 ?t)
      (forall (?p - participant) (available ?p ?t))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 10)
    )
  )

  (:action schedule_by_nicole_after
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (not (before14 ?t))
      (forall (?p - participant) (available ?p ?t))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 0)
    )
  )

  (:action schedule_by_christine_before
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (before14 ?t)
      (forall (?p - participant) (available ?p ?t))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 10)
    )
  )

  (:action schedule_by_christine_after
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (not (before14 ?t))
      (forall (?p - participant) (available ?p ?t))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 0)
    )
  )

  (:action schedule_by_anna_before
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (before14 ?t)
      (forall (?p - participant) (available ?p ?t))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 20)
    )
  )

  (:action schedule_by_anna_after
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (not (before14 ?t))
      (forall (?p - participant) (available ?p ?t))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 0)
    )
  )

  (:action schedule_by_terry_before
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (before14 ?t)
      (forall (?p - participant) (available ?p ?t))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 10)
    )
  )

  (:action schedule_by_terry_after
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (not (before14 ?t))
      (forall (?p - participant) (available ?p ?t))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 0)
    )
  )

  (:action schedule_by_julie_before
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (before14 ?t)
      (forall (?p - participant) (available ?p ?t))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 10)
    )
  )

  (:action schedule_by_julie_after
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (not (before14 ?t))
      (forall (?p - participant) (available ?p ?t))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 0)
    )
  )

  (:action schedule_by_abigail_before
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (before14 ?t)
      (forall (?p - participant) (available ?p ?t))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 10)
    )
  )

  (:action schedule_by_abigail_after
    :parameters (?t - timeslot)
    :precondition (and
      (not (meeting-scheduled))
      (not (before14 ?t))
      (forall (?p - participant) (available ?p ?t))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (increase (total-cost) 0)
    )
  )
)