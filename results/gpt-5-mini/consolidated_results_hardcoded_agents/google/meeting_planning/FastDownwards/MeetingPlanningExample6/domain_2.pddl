(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?ag - agent ?loc - location ?t - time)
    (next ?t1 - time ?t2 - time)            ; general temporal successor (for waiting/intentional stage jumps)
    (travel_edge ?t1 - time ?t2 - time)     ; explicit edges representing 11-minute travel hops
    (allowed_meeting ?t1 - time ?t2 - time) ; approved contiguous meeting interval (respects availability and min duration)
    (met_kenneth)
  )

  ;; Wait (advance in time while remaining at same location along a declared next edge)
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

  ;; Travel from Fisherman's Wharf to Nob Hill: requires an explicit 11-minute travel_edge
  (:action travel_fw_to_nh
    :parameters (?ag - agent ?t1 - time ?t2 - time)
    :precondition (and
      (at ?ag fishermans_wharf ?t1)
      (travel_edge ?t1 ?t2)
    )
    :effect (and
      (not (at ?ag fishermans_wharf ?t1))
      (at ?ag nob_hill ?t2)
    )
  )

  ;; Travel from Nob Hill to Fisherman's Wharf: requires an explicit 11-minute travel_edge
  (:action travel_nh_to_fw
    :parameters (?ag - agent ?t1 - time ?t2 - time)
    :precondition (and
      (at ?ag nob_hill ?t1)
      (travel_edge ?t1 ?t2)
    )
    :effect (and
      (not (at ?ag nob_hill ?t1))
      (at ?ag fishermans_wharf ?t2)
    )
  )

  ;; Schedule and perform the meeting with Kenneth as a single contiguous block.
  ;; The allowed_meeting facts encode both Kenneth's availability window and the minimum 90-minute duration.
  (:action schedule_meeting_kenneth
    :parameters (?ag - agent ?tstart - time ?tend - time)
    :precondition (and
      (at ?ag nob_hill ?tstart)
      (allowed_meeting ?tstart ?tend)
      (not (met_kenneth))
    )
    :effect (and
      (not (at ?ag nob_hill ?tstart))
      (at ?ag nob_hill ?tend)
      (met_kenneth)
    )
  )
)