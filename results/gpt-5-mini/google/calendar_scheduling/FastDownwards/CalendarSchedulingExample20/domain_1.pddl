(define (domain meeting-scheduling)
  ;; Solver target: FastDownwards
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types participant slot)

  (:predicates
    (available ?p - participant ?s - slot)   ; participant ?p is available at slot ?s
    (before_1330 ?s - slot)                  ; slot starts at or before 13:00 (so meeting ends by 13:30)
    (meeting_scheduled)                      ; global flag: a meeting has been scheduled
    (scheduled_at ?s - slot)                 ; meeting is scheduled at slot ?s
  )

  ;; Preferred scheduling action: uses slots that respect Daniel's preference (ends by 13:30).
  (:action schedule-preferred
    :parameters (?s - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (before_1330 ?s)
      (available ?p1 ?s) (available ?p2 ?s) (available ?p3 ?s)
      (not (meeting_scheduled))
      (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p2 ?p3))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
      (not (available ?p1 ?s)) (not (available ?p2 ?s)) (not (available ?p3 ?s))
    )
  )

  ;; Fallback scheduling action: allows any workday slot (used if preferred slots were not chosen).
  (:action schedule-any
    :parameters (?s - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (available ?p1 ?s) (available ?p2 ?s) (available ?p3 ?s)
      (not (meeting_scheduled))
      (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p2 ?p3))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled_at ?s)
      (not (available ?p1 ?s)) (not (available ?p2 ?s)) (not (available ?p3 ?s))
    )
  )
)