(define (domain calendar-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types interval)
  (:predicates
    (succ ?i ?j - interval)
    (available-billy ?i - interval)
    (available-maria ?i - interval)
    (available-william ?i - interval)
    (scheduled ?i - interval)
    (scheduled-start ?i - interval)
    (meeting-scheduled)
  )

  ;; Schedule a single 60-minute meeting by occupying two consecutive 30-minute intervals.
  ;; Preconditions require both consecutive intervals to be available for every participant,
  ;; to be currently unscheduled, and that no meeting has already been scheduled.
  (:action schedule-meeting
    :parameters (?i - interval ?j - interval)
    :precondition (and
      (succ ?i ?j)
      (available-billy ?i) (available-billy ?j)
      (available-maria ?i) (available-maria ?j)
      (available-william ?i) (available-william ?j)
      (not (scheduled ?i))
      (not (scheduled ?j))
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?i)
      (scheduled ?j)
      (scheduled-start ?i)
      (meeting-scheduled)
    )
  )
)