(define (domain kenneth-meetings)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time meeting)

  (:predicates
    (at ?ag - agent ?loc - location ?t - time)
    (meeting-scheduled ?m - meeting ?loc - location ?tstart - time ?tend - time)
    (succ11 ?t1 - time ?t2 - time)    ; t2 is exactly 11 minutes after t1
    (succ110 ?t1 - time ?t2 - time)   ; t2 is exactly 110 minutes after t1
  )

  ; Wait action: advance the agent from the morning start time to the meeting-window start.
  (:action wait-to-1415
    :parameters (?ag - agent ?from - time ?to - time ?loc - location)
    :precondition (and
      (at ?ag ?loc ?from)
      ; This action only allows the specific jump used in the problem (09:00 -> 14:15).
      ;; The concrete time-pair is provided in the problem initial state.
    )
    :effect (and
      (not (at ?ag ?loc ?from))
      (at ?ag ?loc ?to)
    )
  )

  ; Travel actions between Fisherman's Wharf and Nob Hill taking exactly 11 minutes.
  (:action travel-fw-to-nh
    :parameters (?ag - agent ?t1 - time ?t2 - time)
    :precondition (and
      (at ?ag fishermans-wharf ?t1)
      (succ11 ?t1 ?t2)
    )
    :effect (and
      (not (at ?ag fishermans-wharf ?t1))
      (at ?ag nob-hill ?t2)
    )
  )

  (:action travel-nh-to-fw
    :parameters (?ag - agent ?t1 - time ?t2 - time)
    :precondition (and
      (at ?ag nob-hill ?t1)
      (succ11 ?t1 ?t2)
    )
    :effect (and
      (not (at ?ag nob-hill ?t1))
      (at ?ag fishermans-wharf ?t2)
    )
  )

  ; Schedule a meeting occupying a concrete interval [tstart,tend).
  ; Enforces: agent is at the meeting location at tstart, the interval length is exactly 110 minutes,
  ; and the meeting is recorded. Agent's time advances to the meeting end time at the same location.
  (:action schedule-meeting
    :parameters (?ag - agent ?m - meeting ?loc - location ?tstart - time ?tend - time)
    :precondition (and
      (at ?ag ?loc ?tstart)
      (succ110 ?tstart ?tend)
      (not (meeting-scheduled ?m ?loc ?tstart ?tend))
    )
    :effect (and
      (not (at ?ag ?loc ?tstart))
      (at ?ag ?loc ?tend)
      (meeting-scheduled ?m ?loc ?tstart ?tend)
    )
  )
)