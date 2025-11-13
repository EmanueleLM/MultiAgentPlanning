(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?ag - agent ?loc - location ?t - time)
    (next ?t1 - time ?t2 - time)
    (travel_edge ?t1 - time ?t2 - time)
    (connected ?from - location ?to - location)
    (meeting_place ?loc - location)

    ;; Defines allowed meeting plans by explicit start and end times
    (allowed_meeting ?tstart - time ?tend - time)
    ;; Enforces contiguous per-step progress for a specific meeting plan
    (allowed_meeting_step ?tcur - time ?tnext - time ?tstart - time ?tend - time)

    ;; Meeting execution bookkeeping (structural, no shortcuts)
    (meeting_in_progress)
    (meeting_plan ?tstart - time ?tend - time)
    (meeting_at ?t - time)

    ;; Goal flag
    (met_kenneth)
  )

  (:action wait
    :parameters (?ag - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?ag ?loc ?t1)
      (next ?t1 ?t2)
      (not (meeting_in_progress))
    )
    :effect (and
      (not (at ?ag ?loc ?t1))
      (at ?ag ?loc ?t2)
    )
  )

  (:action travel
    :parameters (?ag - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?ag ?from ?t1)
      (connected ?from ?to)
      (travel_edge ?t1 ?t2)
      (not (meeting_in_progress))
    )
    :effect (and
      (not (at ?ag ?from ?t1))
      (at ?ag ?to ?t2)
    )
  )

  (:action start_meeting
    :parameters (?ag - agent ?loc - location ?tstart - time ?tend - time)
    :precondition (and
      (at ?ag ?loc ?tstart)
      (meeting_place ?loc)
      (allowed_meeting ?tstart ?tend)
      (not (meeting_in_progress))
    )
    :effect (and
      (meeting_in_progress)
      (meeting_plan ?tstart ?tend)
      (meeting_at ?tstart)
    )
  )

  (:action meeting_progress
    :parameters (?ag - agent ?tcur - time ?tnext - time ?tstart - time ?tend - time ?loc - location)
    :precondition (and
      (meeting_in_progress)
      (meeting_plan ?tstart ?tend)
      (meeting_at ?tcur)
      (allowed_meeting_step ?tcur ?tnext ?tstart ?tend)
      (next ?tcur ?tnext)
      (at ?ag ?loc ?tcur)
      (meeting_place ?loc)
    )
    :effect (and
      (not (meeting_at ?tcur))
      (meeting_at ?tnext)
      (not (at ?ag ?loc ?tcur))
      (at ?ag ?loc ?tnext)
    )
  )

  (:action end_meeting
    :parameters (?ag - agent ?loc - location ?tstart - time ?tend - time)
    :precondition (and
      (meeting_in_progress)
      (meeting_plan ?tstart ?tend)
      (meeting_at ?tend)
      (at ?ag ?loc ?tend)
      (meeting_place ?loc)
      (not (met_kenneth))
    )
    :effect (and
      (not (meeting_in_progress))
      (not (meeting_plan ?tstart ?tend))
      (not (meeting_at ?tend))
      (met_kenneth)
    )
  )
)