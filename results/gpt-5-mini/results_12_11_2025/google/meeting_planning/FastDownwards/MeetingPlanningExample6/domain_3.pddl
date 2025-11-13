(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?ag - agent ?loc - location ?t - time)
    (next ?t1 - time ?t2 - time)
    (travel_edge ?t1 - time ?t2 - time)
    (allowed_meeting ?t1 - time ?t2 - time)
    (met_kenneth)
  )

  ;; Wait: advance from one declared time stage to its immediate successor while staying at same location.
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

  ;; Travel: Fisherman's Wharf -> Nob Hill using an explicit travel_edge representing the 11-minute hop.
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

  ;; Travel: Nob Hill -> Fisherman's Wharf using an explicit travel_edge representing the 11-minute hop.
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

  ;; Schedule and perform a single contiguous meeting block with Kenneth.
  ;; The allowed_meeting predicate encodes approved contiguous meeting intervals that satisfy:
  ;; - Kenneth's availability window [14:15..19:45] and
  ;; - the minimum 90-minute meeting duration.
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