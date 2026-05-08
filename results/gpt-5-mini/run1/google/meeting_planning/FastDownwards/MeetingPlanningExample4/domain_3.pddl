(define (domain presidio_marina_meetings)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location)
    (current_time ?t - time)
    (succ_1 ?t1 ?t2 - time)
    (succ_10 ?t1 ?t2 - time)
    (succ_60 ?t1 ?t2 - time)
    (aligned_15 ?t - time)
    (avail_start ?t - time)
    (avail_end ?t - time)
    (can_travel ?a - agent)
    (met_jessica)
    (is_jessica ?a - agent)
  )

  ;; advance forward by 1 minute using succ_1
  (:action advance_1min
    :parameters (?t1 ?t2 - time)
    :precondition (and (current_time ?t1) (succ_1 ?t1 ?t2))
    :effect (and
              (not (current_time ?t1))
              (current_time ?t2)
            )
  )

  ;; traveler travel taking exactly 10 minutes (succ_10).
  (:action travel_10min
    :parameters (?tstart ?tend - time ?trav - agent ?from - location ?to - location)
    :precondition (and
                    (current_time ?tstart)
                    (succ_10 ?tstart ?tend)
                    (at ?trav ?from)
                    (can_travel ?trav)
                  )
    :effect (and
              (not (current_time ?tstart))
              (current_time ?tend)
              (not (at ?trav ?from))
              (at ?trav ?to)
            )
  )

  ;; 60-minute contiguous meeting with a specific agent identified as Jessica.
  ;; Meeting requires both traveler and Jessica at the same location,
  ;; meeting start aligned to 15-minute increments,
  ;; start within Jessica availability (avail_start) and end within avail_end.
  (:action meet_jessica_60
    :parameters (?tstart ?tend - time ?trav - agent ?j - agent ?loc - location)
    :precondition (and
                    (current_time ?tstart)
                    (succ_60 ?tstart ?tend)
                    (aligned_15 ?tstart)
                    (avail_start ?tstart)
                    (avail_end ?tend)
                    (at ?trav ?loc)
                    (at ?j ?loc)
                    (is_jessica ?j)
                    (not (met_jessica))
                  )
    :effect (and
              (not (current_time ?tstart))
              (current_time ?tend)
              (met_jessica)
            )
  )
)