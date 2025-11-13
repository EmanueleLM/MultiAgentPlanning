(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot meeting)

  (:constants
    michelle steven jerry - person
  )

  (:predicates
    (free ?p - person ?t - timeslot)
    (consecutive ?t1 - timeslot ?t2 - timeslot)
    (meeting-scheduled ?m - meeting)
    (assigned ?m - meeting ?t1 - timeslot ?t2 - timeslot)
  )

  ;; Schedule a meeting that occupies two consecutive timeslots
  ;; and requires those two slots to be free for each required participant.
  (:action schedule-meeting-for-michelle-steven-jerry
    :parameters (?m - meeting ?s1 - timeslot ?s2 - timeslot)
    :precondition (and
      (consecutive ?s1 ?s2)
      (free michelle ?s1) (free michelle ?s2)
      (free steven ?s1)  (free steven ?s2)
      (free jerry ?s1)   (free jerry ?s2)
      (not (meeting-scheduled ?m))
    )
    :effect (and
      (meeting-scheduled ?m)
      (assigned ?m ?s1 ?s2)
      (not (free michelle ?s1)) (not (free michelle ?s2))
      (not (free steven ?s1))  (not (free steven ?s2))
      (not (free jerry ?s1))   (not (free jerry ?s2))
    )
  )
)