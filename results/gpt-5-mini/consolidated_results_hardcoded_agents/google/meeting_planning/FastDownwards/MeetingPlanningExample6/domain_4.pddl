(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?ag - agent ?loc - location ?t - time)
    (next ?t1 - time ?t2 - time)
    (travel_edge ?t1 - time ?t2 - time)
    (allowed_meeting ?t1 - time ?t2 - time)
    (meeting_in_progress)
    (meeting_started ?t - time)
    (met_kenneth)
  )

  ;; Advance from one declared time stage to its immediate successor while remaining at the same location.
  (:action wait
    :parameters (?ag - agent ?loc - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?ag ?loc ?t1)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (at ?ag ?loc ?t1))
      (at ?ag ?loc ?t2)
    )
  )

  ;; Travel actions require the explicit travel_edge and are forbidden while a meeting is in progress.
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

  ;; Start a contiguous meeting block at Nob Hill that is known to be allowed to end at some approved end time.
  ;; Starting a meeting blocks travel until the meeting is ended.
  (:action start_meeting
    :parameters (?ag - agent ?tstart - time ?tminend - time)
    :precondition (and
      (at ?ag nob_hill ?tstart)
      (allowed_meeting ?tstart ?tminend)
      (not (meeting_in_progress))
    )
    :effect (and
      (meeting_in_progress)
      (meeting_started ?tstart)
    )
  )

  ;; End a meeting that began at ?tstart and finishes at an allowed end ?tend.
  ;; Requires the agent to be at Nob Hill at the declared end time and that a meeting is in progress.
  (:action end_meeting
    :parameters (?ag - agent ?tstart - time ?tend - time)
    :precondition (and
      (at ?ag nob_hill ?tend)
      (meeting_started ?tstart)
      (allowed_meeting ?tstart ?tend)
      (meeting_in_progress)
      (not (met_kenneth))
    )
    :effect (and
      (not (meeting_in_progress))
      (not (meeting_started ?tstart))
      (met_kenneth)
    )
  )
)