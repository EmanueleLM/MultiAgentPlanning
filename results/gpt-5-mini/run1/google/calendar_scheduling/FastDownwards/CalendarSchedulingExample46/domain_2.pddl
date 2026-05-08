(define (domain jack_of_all_trades_schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)
  (:predicates
    (free_at ?p - person ?t - timeslot)
    (meeting_at ?t - timeslot)
  )

  ;; Instance-specific action: schedule the meeting for the given three persons
  ;; (arthur, theresa, carl). The action requires all three to be free at the
  ;; chosen timeslot and that no meeting is already scheduled at that slot.
  ;; Effects mark the timeslot as a meeting and revoke availability for each person.
  (:action schedule_meeting_at
    :parameters (?t - timeslot)
    :precondition (and
                    (free_at arthur ?t)
                    (free_at theresa ?t)
                    (free_at carl ?t)
                    (not (meeting_at ?t))
                  )
    :effect (and
              (meeting_at ?t)
              (not (free_at arthur ?t))
              (not (free_at theresa ?t))
              (not (free_at carl ?t))
            )
  )
)