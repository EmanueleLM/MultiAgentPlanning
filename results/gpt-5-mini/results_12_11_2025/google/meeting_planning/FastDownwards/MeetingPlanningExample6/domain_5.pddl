(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?ag - agent ?loc - location ?t - time)
    (next ?t1 - time ?t2 - time)
    (travel_edge ?t1 - time ?t2 - time)

    ;; Allowed meeting start-end pairs (satisfy availability window and minimum duration).
    (allowed_meeting ?tstart - time ?tend - time)
    ;; Allowed per-step transitions for a meeting that was declared with a specific start/end.
    ;; allowed_meeting_step ?tcur ?tnext ?tstart ?tend
    (allowed_meeting_step ?tcur - time ?tnext - time ?tstart - time ?tend - time)

    ;; Meeting bookkeeping: a declared meeting plan and which exact timepoint of the meeting is currently occupied.
    (meeting_in_progress)
    (meeting_plan ?tstart - time ?tend - time)
    (meeting_at ?t - time)

    (met_kenneth)
  )

  ;; Wait one time stage at the same location when NOT in a meeting.
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

  ;; Travel actions between the two known locations. Forbidden while a meeting is in progress.
  (:action travel_fw_to_nh
    :parameters (?ag - agent ?t1 - time ?t2 - time)
    :precondition (and
      (at ?ag fishermans_wharf ?t1)
      (travel_edge ?t1 ?t2)
      (not (meeting_in_progress))
    )
    :effect (and
      (not (at ?ag fishermans_wharf ?t1))
      (at ?ag nob_hill ?t2)
    )
  )

  (:action travel_nh_to_fw
    :parameters (?ag - agent ?t1 - time ?t2 - time)
    :precondition (and
      (at ?ag nob_hill ?t1)
      (travel_edge ?t1 ?t2)
      (not (meeting_in_progress))
    )
    :effect (and
      (not (at ?ag nob_hill ?t1))
      (at ?ag fishermans_wharf ?t2)
    )
  )

  ;; Start a contiguous meeting block at Nob Hill with an explicitly allowed end time.
  ;; This creates a meeting_plan and marks the meeting as occupying the start time.
  (:action start_meeting
    :parameters (?ag - agent ?tstart - time ?tend - time)
    :precondition (and
      (at ?ag nob_hill ?tstart)
      (allowed_meeting ?tstart ?tend)
      (not (meeting_in_progress))
    )
    :effect (and
      (meeting_in_progress)
      (meeting_plan ?tstart ?tend)
      (meeting_at ?tstart)
    )
  )

  ;; Advance the meeting occupancy from ?tcur to its successor ?tnext under the same declared meeting plan.
  ;; Requires the agent to be at Nob Hill at both timepoints and an explicit allowed_meeting_step for this plan.
  (:action meeting_progress
    :parameters (?ag - agent ?tcur - time ?tnext - time ?tstart - time ?tend - time)
    :precondition (and
      (meeting_in_progress)
      (meeting_plan ?tstart ?tend)
      (meeting_at ?tcur)
      (allowed_meeting_step ?tcur ?tnext ?tstart ?tend)
      (at ?ag nob_hill ?tcur)
      (at ?ag nob_hill ?tnext)
    )
    :effect (and
      (not (meeting_at ?tcur))
      (meeting_at ?tnext)
    )
  )

  ;; End the meeting when the meeting_at predicate is at the declared end time.
  ;; This finalizes the contiguous meeting block and records that Kenneth was met.
  (:action end_meeting
    :parameters (?ag - agent ?tstart - time ?tend - time)
    :precondition (and
      (meeting_in_progress)
      (meeting_plan ?tstart ?tend)
      (meeting_at ?tend)
      (at ?ag nob_hill ?tend)
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