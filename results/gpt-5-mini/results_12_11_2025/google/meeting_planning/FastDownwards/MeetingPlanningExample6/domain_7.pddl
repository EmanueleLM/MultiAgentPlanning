(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?ag - agent ?loc - location ?t - time)
    (next ?t1 - time ?t2 - time)
    (travel_edge ?t1 - time ?t2 - time)

    (allowed_meeting ?tstart - time ?tend - time)
    (allowed_meeting_step ?tcur - time ?tnext - time ?tstart - time ?tend - time)

    (meeting_in_progress)
    (meeting_plan ?tstart - time ?tend - time)
    (meeting_at ?t - time)

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

  (:action meeting_progress
    :parameters (?ag - agent ?tcur - time ?tnext - time ?tstart - time ?tend - time)
    :precondition (and
      (meeting_in_progress)
      (meeting_plan ?tstart ?tend)
      (meeting_at ?tcur)
      (allowed_meeting_step ?tcur ?tnext ?tstart ?tend)
      (next ?tcur ?tnext)
      (at ?ag nob_hill ?tcur)
    )
    :effect (and
      (not (meeting_at ?tcur))
      (meeting_at ?tnext)
      (not (at ?ag nob_hill ?tcur))
      (at ?ag nob_hill ?tnext)
    )
  )

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